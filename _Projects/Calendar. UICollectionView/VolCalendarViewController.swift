//
//  CalendarViewController.swift
//  Volunteer
//
//  Created by Михаил Дмитриев on 30.06.2020.
//  Copyright (c) 2020 Mikhail Dmitriev. All rights reserved.
//

import UIKit

//MARK: - Protocol. Display

protocol VolCalendarDisplayLogic: class {
    func displayData(viewModel: VolCalendar.Model.ViewModel.ViewModelData)
}

//MARK: - Protocol. Delegate

protocol VolCalendarViewControllerDelegate: class {
    func onCalendarDismiss(dateBegin: Date?, dateEnd: Date?)
}

class VolCalendarViewController: UIViewController, VolCalendarDisplayLogic {
    //MARK: - Outlets
    
    @IBOutlet weak var monthAndYearLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var calendarWidth: NSLayoutConstraint!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    //MARK: - Delegate

    weak var calendarDelegate: VolCalendarViewControllerDelegate?
    
    
    //MARK: - Managers/Helpers
    
    private let datesManager = VolDates()
    private let colors = VolColors()
    
    
    //MARK: - Properties
    
    var interactor: VolCalendarBusinessLogic?
    var router: (NSObjectProtocol & VolCalendarRoutingLogic & VolCalendarDataPassing)?
    lazy var configurator: VolCalendarConfiguratorProtocol = VolCalendarConfigurator()
    
    private var viewModel: VolCalendarViewModel?
    
    private var _reloadDelay = 0.2
    
    
    //MARK: - Object Lyfecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configurator.configure(with: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator.configure(with: self)
    }
    
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
        interactor?.makeRequest(request: .restorePreviousSettings)
        interactor?.makeRequest(request: .configureCalendar)
    }
    
    deinit {
        print("CalendarViewController deinited")
    }
    
    
    //MARK: - Display Data
    
    func displayData(viewModel: VolCalendar.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayCalendar(viewModel: let viewModel):
            self.viewModel = viewModel
            self.configureBackButton(state: viewModel.backButtonState)
            
            //UICollectionView
            UIView.transition(with: collectionView,
                              duration: _reloadDelay,
                              options: .transitionCrossDissolve,
                              animations: { [weak self] in
                                guard let self = self else { return }
                                self.collectionView.reloadData()
            })
            
            self.title = viewModel.screenTitle
            self.monthAndYearLabel.text = viewModel.currentPageText
        }
    }
    
    
    //MARK: - Actions
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        router?.routeBackToFilter()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextMonthButtonPressed(_ sender: UIButton) {
        interactor?.makeRequest(request: .moveCalendarCurrentPage(isUp: true))
    }
    
    @IBAction func previousMonthButtonPressed(_ sender: UIButton) {
        interactor?.makeRequest(request: .moveCalendarCurrentPage(isUp: false))
    }
    
    
    //MARK: - Private
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = colors.blue
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
    
    private func configureBackButton(state: Bool) {
        backButton.isEnabled = state
    }
    
    private func setupCollectionView() {
        //Delegates
        collectionView.delegate = self
        collectionView.dataSource = self
        //Back Button
        configureBackButton(state: false)
        //UICollectionView Layout
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let width = self.view.frame.width
        let cellSize = CGFloat(width / 7).rounded()
        let newWidth = cellSize * 7
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        calendarWidth.constant = newWidth
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
    }
    
    
}//Class End




//MARK: - Extension. UI Collection View

extension VolCalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = viewModel?.cells.count else { return 0 }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard
            let viewModelSafe = viewModel,
            let date = viewModelSafe.cells[indexPath.row].dateDate,
            viewModelSafe.cells[indexPath.row].isInteractable else { return }
        interactor?.makeRequest(request: .setSelectedDate(date: date))
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VolCalendarCVCell", for: indexPath) as? VolCalendarCVCell,
            let cellVM = viewModel?.cells[indexPath.row] else { fatalError() }
        cell.configureCell(cellVM: cellVM)
        return cell
    }
}

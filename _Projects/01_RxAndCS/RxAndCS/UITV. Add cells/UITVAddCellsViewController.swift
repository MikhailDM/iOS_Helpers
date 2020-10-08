//
//  UITVAddCellsViewController.swift
//  RxAndCS
//
//  Created by Dmitriev on 23.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

//MARK: - Protocol. DisplayLogic

protocol UITVAddCellsDisplayLogic: class {
    func displayData(viewModel: UITVAddCells.Model.ViewModel.ViewModelData)
}


class UITVAddCellsViewController: UIViewController, UITVAddCellsDisplayLogic {
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Managers
    
    private let alertManager = AlertManager()
    
    
    //MARK: - Properties
    
    var interactor: UITVAddCellsBusinessLogic?
    var router: (NSObjectProtocol & UITVAddCellsRoutingLogic & UITVAddCellsDataPassing)?
    lazy var configurator: UITVAddCellsConfiguratorProtocol = UITVAddCellsConfigurator()
    
    private var disposeBag = DisposeBag()
    private var screenViewModel = BehaviorRelay<[String]>(value: (0...10).map{ "\($0)" })
    
    
    //MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configurator.configure(with: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator.configure(with: self)
    }
    
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        registerCells()
        
        DispatchQueue.main.async { [weak self] in
            self?.subscribeToUITableView()
        }
    }
    
    deinit {
        print("DEINITED - UITVAddCellsViewController")
    }
    
    
    //MARK: - Display data
    
    func displayData(viewModel: UITVAddCells.Model.ViewModel.ViewModelData) { }
    
    
    //MARK: - Actions
    
    @IBAction func addNewCellBarButtonPressed(_ sender: UIBarButtonItem) {
        screenViewModel.accept(screenViewModel.value + ["\(screenViewModel.value.count)"])
    }
    
    
    //MARK: - Private
    
    private func configureDesign() {
        title = "Add cells/Show alert"
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    
}//




//MARK: - Extension. Rx

extension UITVAddCellsViewController {
    
    private func subscribeToCellButton(cell: UITVAddCellsTVCell) {
        cell.infoButton.rx.tap.bind(
            onNext: { [weak self] in
                guard let self = self else { return }
                self.alertManager.showInfoAlert(view: self, title: "TAP TO CELL", infoText: "You tap to cell with title: \(cell.titleLabel.text ?? "")")
            }).disposed(by: cell.disposeBag)
    }
}


//MARK: - Extension. UITableView

extension UITVAddCellsViewController {
    
    private func registerCells() {
        tableView.register(UINib(nibName: "UITVAddCellsTVCell", bundle: nil),
                           forCellReuseIdentifier: "UITVAddCellsTVCell")
    }
    
    private func subscribeToUITableView() {
        screenViewModel
            .observeOn(MainScheduler.asyncInstance)
            .bind(to: tableView.rx.items(cellIdentifier: "UITVAddCellsTVCell", cellType: UITVAddCellsTVCell.self)) { [weak self] row, event, cell in
                cell.configure(titleText: "Test Cell # \(row)")
                self?.subscribeToCellButton(cell: cell)
            }
            .disposed(by: disposeBag)
    }
}

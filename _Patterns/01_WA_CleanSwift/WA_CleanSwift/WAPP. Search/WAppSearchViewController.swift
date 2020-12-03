//
//  WAppSearchViewController.swift
//  WA_CleanSwift
//
//  Created by Михаил Дмитриев on 27.11.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class WAppSearchViewController: UIViewController, WAppSearchDisplayLogic {
    //MARK: - Settings
    var interactor: WAppSearchBusinessLogic?
    var router: (NSObjectProtocol & WAppSearchRoutingLogic & WAppSearchDataPassing)?
    lazy var configurator: WAppSearchConfiguratorProtocol = WAppSearchConfigurator()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator.configure(with: self)
    }
    
    
    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Properties
    private var disposeBag = DisposeBag()
    private var viewModel = [String]()
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        configureUITableView()
        
        subscribeToSearchBar()
        subscribeCancelButtonPressed()
        interactor?.makeRequest(request: .subscribeToSearchedCities)
    }
    
    deinit { print("DEINITED - WAppSearchViewController") }
    
    
    //MARK: - Display data
    func displayData(toDisplay: WAppSearch.Model.ViewModel.ViewModelData) {
        switch toDisplay {
        case .displayCitiesWhichContainText(searchData: let searchData):
            viewModel = searchData
            tableView.reloadData()
            print("===== searchData \(searchData)")
        }
    }
    
    
    //MARK: - Private
    private func configureDesign() {
        title = "Search"
        navigationItem.backButtonTitle = ""
        view.backgroundColor = UIColor.clear
    }
    
    private func configureUITableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: "WAppSearchTVCell", bundle: nil), forCellReuseIdentifier: "WAppSearchTVCell")
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.backgroundView = blurEffectView
        tableView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
    }
    
    
    //MARK: - Extension. Rx
    private func subscribeToSearchBar() {
        searchBar.rx.value.orEmpty.changed
            .debug("===== SEARCH BAR")
            .subscribe(onNext: { [weak self] text in
                self?.interactor?.makeRequest(request: .getCitiesWhichContainText(searchText: text))
            }).disposed(by: disposeBag)
    }
    
    private func subscribeCancelButtonPressed() {
        cancelButton.rx.tap
            .subscribe { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }.disposed(by: disposeBag)
    }
    
}//


//MARK: - Extension. UITableView
extension WAppSearchViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard !viewModel.isEmpty else { return 1 }
        return viewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WAppSearchTVCell") as! WAppSearchTVCell
        guard !viewModel.isEmpty else {
            cell.title?.text = "No results"
            return cell
        }
        cell.title?.text = viewModel[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //guard viewModel.indices.contains(indexPath.row) else { return }
        interactor?.makeRequest(request: .selectCity(city: viewModel[indexPath.row]))
        interactor?.makeRequest(request: .completeSubscription)
        dismiss(animated: true, completion: nil)
    }
    
}//

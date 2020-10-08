//
//  MainViewController.swift
//  RxAndCS
//
//  Created by Dmitriev on 23.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//MARK: - Protocol. DisplayLogic

protocol MainDisplayLogic: class {
    func displayData(viewModel: Main.Model.ViewModel.ViewModelData)
}


class MainViewController: UIViewController, MainDisplayLogic {
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Properties
    
    var interactor: MainBusinessLogic?
    var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?
    lazy var configurator: MainConfiguratorProtocol = MainConfigurator()
    
    private var screenViewModel: MainViewModel?

    
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
        interactor?.makeRequest(request: .getExamplesCells)
        chargeViewSettings()
        setupDesign()
    }
    
    deinit {
        print("DEINITED - MainViewController")
    }
    
    
    //MARK: - Display data
    
    func displayData(viewModel: Main.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayExamplesCells(viewModel: let viewModel):
            screenViewModel = viewModel
        }
    }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func setupDesign() {
        title = "RxSwift/CleanSwift"
        navigationItem.backButtonTitle = ""
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    private func chargeViewSettings() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}//




//MARK: - Extension. UITableView

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let screenViewModelSafe = screenViewModel else { return nil }
        return screenViewModelSafe.sections[section].title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let screenViewModelSafe = screenViewModel else { return 0 }
        return screenViewModelSafe.sections.count
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let screenViewModelSafe = screenViewModel else { return 0 }
        return screenViewModelSafe.sections[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTVCell") as? MainTVCell else { return UITableViewCell.init() }
        cell.configure(cellViewModel: screenViewModel?.sections[indexPath.section].cells[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let screenViewModelSafe = screenViewModel else { return }
        let routeType = screenViewModelSafe.sections[indexPath.section].cells[indexPath.row].routeType
        router?.routeByType(routeType: routeType)
    }
}

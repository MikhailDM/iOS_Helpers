//
//  VolStartViewController.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 14.08.2020.
//  Copyright (c) 2020 aisa. All rights reserved.
//

import UIKit

//MARK: - Protocol. Display

protocol VolStartDisplayLogic: class {
    func displayData(viewModel: VolStart.Model.ViewModel.ViewModelData)
}


class VolStartViewController: UIViewController, VolStartDisplayLogic {
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!

    
    //MARK: - Properties
    
    private var lastCellHeight: CGFloat?
    
    
    //MARK: - Settings
    
    var interactor: VolStartBusinessLogic?
    var router: (NSObjectProtocol & VolStartRoutingLogic & VolStartDataPassing)?
    lazy var configurator: VolStartConfiguratorProtocol = VolStartConfigurator()
    
    
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
        setupDesign()
        calculateLastCellHeight()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    deinit {
        print("DEINITED - VolStartViewController")
    }
    
    
    //MARK: - Display Data
    
    func displayData(viewModel: VolStart.Model.ViewModel.ViewModelData) {
        
    }
    
    
    //MARK: - Actions
    
    @IBAction func filterButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    
    //MARK: - Private
    
    private func setupDesign() {
        navigationItem.title = "Волонтер"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
    }
    
    private func calculateLastCellHeight() {
        DispatchQueue.main.async {
            guard let cell = self.tableView.visibleCells.last else { return }
            self.lastCellHeight = cell.frame.height
            self.tableView.reloadData()
        }
    }

    
}//Class End




//MARK: - Extension. Digital Health Button Pressed

extension VolStartViewController: VolStartGeneralTVCellDelegate {
    func onGoToStoreButtonPressed() {
        router?.routeToStore()
    }
    
    func onGoToEventsButtonPressed() {
        router?.routeToEvents()
    }    
}



//MARK: - Extension. UITableView

extension VolStartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VolStartGeneralTVCell",
                                                       for: indexPath) as? VolStartGeneralTVCell else {
                                                        fatalError("VolStartGeneralTVCell does not exist")
        }
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let lastCellHeightSafe = lastCellHeight else { return tableView.rowHeight }
        return lastCellHeightSafe <= tableView.frame.height ? tableView.frame.height : tableView.rowHeight
    }
}

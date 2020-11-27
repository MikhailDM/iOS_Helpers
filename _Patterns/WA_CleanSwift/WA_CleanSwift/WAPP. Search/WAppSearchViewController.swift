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
    
    
    //MARK: - Properties
    private var disposeBag = DisposeBag()
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        configureUITableView()
    }
    
    deinit {
        print("DEINITED - WAppSearchViewController")
    }
    
    
    //MARK: - Display data
    func displayData(toDisplay: WAppSearch.Model.ViewModel.ViewModelData) { }
    
    
    //MARK: - Private
    private func configureDesign() {
        title = "Search"
        navigationItem.backButtonTitle = ""
    }
    
    private func configureUITableView() {
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.tableFooterView = UIView(frame: .zero)
//        tableView.register(UINib(nibName: "Cell Name", bundle: nil), forCellReuseIdentifier: "Cell ID")
    }
    
    
    //MARK: - Extension. Rx
    
}//


//MARK: - Extension. UITableView
//extension WAppSearchViewController: UITableViewDelegate, UITableViewDataSource {
//   
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
////        return TVCells.allCases.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return UITableViewCell.init()
////        let cellType = TVCells.allCases[indexPath.row]
////
////        switch cellType {
////        case .CellName:
////            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITVCalculatingTextTVCell")
////                    as? UITVCalculatingTextTVCell else { return UITableViewCell.init()}
////            return cell
////        }
//    }
//}

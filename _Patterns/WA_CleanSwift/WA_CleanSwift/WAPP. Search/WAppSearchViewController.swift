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
    
    
    //MARK: - Properties
    private var disposeBag = DisposeBag()
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        configureUITableView()
        
        subscribeToSearchBar()
    }
    
    deinit { print("DEINITED - WAppSearchViewController") }
    
    
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
    private func subscribeToSearchBar() {
        searchBar.rx.value.orEmpty.changed
            .subscribe(onNext: { text in
                print("===== SEARCH: \(text)")
            }).disposed(by: disposeBag)
    }
    
}//

/*
 searchTF.rx
     .controlEvent([.editingChanged])
     .withLatestFrom(searchTF.rx.text.orEmpty)
     .debounce(.seconds(searchDelay), scheduler: MainScheduler.instance)
     .subscribe(onNext: { [weak self] cityName in
         guard let self = self else { return }
         self.interactor?.makeRequest(request: .requestWeatherByCity(cityName: cityName))
     }).disposed(by: disposeBag)
 */

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

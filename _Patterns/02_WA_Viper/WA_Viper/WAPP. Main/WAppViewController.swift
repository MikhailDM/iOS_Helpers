//
//  WAppViewController.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 03.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class WAppViewController: UIViewController, WAppViewProtocol {
    //MARK: - Configure
    var presenter: WAppPresenterProtocol?
    var configurator: WAppConfiguratorProtocol = WAppConfigurator()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator.configure(with: self)
    }
    
    
    //MARK: - Outlets
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var deegreeLabel: UILabel!
    @IBOutlet weak var changeCityButton: UIButton!
    
    
    //MARK: - Properties
    private var disposeBag = DisposeBag()
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        configureUITableView()
        presenter?.present(presentType: .presentTestText)
    }
    
    deinit { print("DEINITED - WAppViewController") }
    
    
    //MARK: - Display data
    //func displayData(dataType: WApp.Action.ViewModel.ViewModelData) { }
    func display(displayType: WApp.Action.Display.DisplayType) {
        switch displayType {
        case .displayTestText(text: let text):
            print("===== TEST TEXT: \(text)")
        }
    }
    
    
    //MARK: - Private
    private func configureDesign() {
        navigationController?.navigationBar.isHidden = true
//        title = "Title"
//        navigationItem.backButtonTitle = ""
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
extension WAppViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
//        return TVCells.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
//        let cellType = TVCells.allCases[indexPath.row]
//
//        switch cellType {
//        case .CellName:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITVCalculatingTextTVCell")
//                    as? UITVCalculatingTextTVCell else { return UITableViewCell.init()}
//            return cell
//        }
    }
}

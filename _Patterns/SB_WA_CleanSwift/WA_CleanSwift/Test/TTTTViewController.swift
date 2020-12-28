//
//  TTTTViewController.swift
//  WA_CleanSwift
//
//  Created by Mikhail Dmitriev on 28.12.2020
//

import UIKit
//import RxSwift

//MARK: - View
class TTTTViewController: UIViewController, TTTTViewProtocol, TTTTViewLogicProtocol {
    
    //MARK: - Configure
    var interactor: (TTTTInteractorLogicProtocol & TTTTDataStoreProtocol)?
    var configurator = TTTTConfigurator()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator.configure(with: self)
    }
    
    //MARK: - Outlets
    
    //MARK: - Properties
    //private var disposeBag = DisposeBag()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        configureUITableView()
    }
    
    deinit { print("===== DEINITED: TTTTViewController") }
    
    
    //MARK: - Display
    func display(displayType: TTTTLogic.Action.Display.DisplayType) { }
    
    
    //MARK: - Private
    private func configureDesign() {
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
    
    
    //MARK: - Rx
    
}//

//MARK: - Extension. UITableView
extension TTTTViewController: UITableViewDelegate, UITableViewDataSource {
   
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

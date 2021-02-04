//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import UIKit
//import RxSwift

//MARK: - View
class ___VARIABLE_sceneName___ViewController: UIViewController, ___VARIABLE_sceneName___ViewDependencies, ___VARIABLE_sceneName___ViewLogic {
    
    //MARK: - Configure
    var interactor: ___VARIABLE_sceneName___InteractorLogic?
    var dataStore: ___VARIABLE_sceneName___DataStore?
    var configurator = ___VARIABLE_sceneName___Configurator()
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
    
    deinit { print("===== Deinited: ___VARIABLE_sceneName___ViewController") }
    
    //MARK: - Display
    func display(displayType: ___VARIABLE_sceneName___Logic.Action.Display.DisplayType) { }
    
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
}

//MARK: - Extension. UITableView
extension ___VARIABLE_sceneName___ViewController: UITableViewDelegate, UITableViewDataSource {
   
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

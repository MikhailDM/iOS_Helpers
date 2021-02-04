//
//  FirstViewController.swift
//  XIBTEST
//
//  Created by Mikhail Dmitriev on 04.02.2021
//

import UIKit
//import RxSwift

//MARK: - View
class FirstViewController: UIViewController, FirstViewDependencies, FirstViewLogic {
    
    //MARK: - Configure
    var interactor: FirstInteractorLogic?
    var dataStore: FirstDataStore?
    var configurator = FirstConfigurator()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator.configure(with: self)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configurator.configure(with: self)
    }
    
    //MARK: - Outlets
    @IBOutlet weak var dataFromSecondLabel: UILabel!
    
    //MARK: - Properties
    //private var disposeBag = DisposeBag()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        configureUITableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        interactor?.interactorRequest(requestType: .updateData)
    }
    
    deinit { print("===== Deinited: FirstViewController") }
    
    //MARK: - Display
    func display(displayType: FirstLogic.Action.Display.DisplayType) {
        switch displayType {
        case .displayData(num: let num):
            dataFromSecondLabel.text = "\(num)"
        }
    }
    
    //MARK: - Private
    private func configureDesign() {
        title = "FIRST"
        navigationItem.backButtonTitle = ""
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    private func configureUITableView() {
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.tableFooterView = UIView(frame: .zero)
//        tableView.register(UINib(nibName: "Cell Name", bundle: nil), forCellReuseIdentifier: "Cell ID")
    }
    
    //MARK: - Rx
    @IBAction func goToSecondButtonPressed(_ sender: UIButton) {
        interactor?.interactorRequest(requestType: .routeToSecond)
    }
}

//MARK: - Extension. UITableView
extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
   
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

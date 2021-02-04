//
//  SecondViewController.swift
//  XIBTEST
//
//  Created by Mikhail Dmitriev on 04.02.2021
//

import UIKit
//import RxSwift

//MARK: - View
class SecondViewController: UIViewController, SecondViewDependencies, SecondViewLogic {
    
    //MARK: - Configure
    var interactor: SecondInteractorLogic?
    var dataStore: SecondDataStore?
    var configurator = SecondConfigurator()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator.configure(with: self)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configurator.configure(with: self)
    }
    
    //MARK: - Outlets
    @IBOutlet weak var dataFromFirstLabel: UILabel!
    
    //MARK: - Properties
    //private var disposeBag = DisposeBag()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        configureUITableView()
        
        interactor?.interactorRequest(requestType: .updateData)
    }
    
    deinit { print("===== Deinited: SecondViewController") }
    
    //MARK: - Display
    func display(displayType: SecondLogic.Action.Display.DisplayType) {
        switch displayType {
        case .displayData(num: let num):
            dataFromFirstLabel.text = "\(num)"
        }
    }
    
    //MARK: - Private
    private func configureDesign() {
        title = "SECOND"
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
    @IBAction func backToFirstButtonPressed(_ sender: UIButton) {
        interactor?.interactorRequest(requestType: .routeBack)
    }
    
}

//MARK: - Extension. UITableView
extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
   
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

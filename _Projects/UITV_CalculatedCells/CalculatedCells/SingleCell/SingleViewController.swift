//
//  SingleViewController.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit
//import RxSwift

//MARK: - View
class SingleViewController: UIViewController, SingleViewDependencies, SingleViewLogic {
    
    //MARK: - Configure
    var interactor: SingleInteractorLogic?
    var dataStore: SingleDataStore?
    var configurator = SingleConfigurator()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator.configure(with: self)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configurator.configure(with: self)
    }
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    private var cellHeight: CGFloat?
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        configureUITableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let maxY = tableView.visibleCells.last?.frame.maxY,
              maxY < tableView.frame.height else { return }
        cellHeight = tableView.bounds.height
    }
    
    deinit { print("===== Deinited: SingleViewController") }
    
    //MARK: - Display
    func display(displayType: SingleLogic.Action.Display.DisplayType) { }
    
    //MARK: - Private
    private func configureDesign() {
        title = "Single Cell"
        navigationItem.backButtonTitle = ""
    }
    
    private func configureUITableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "SingleScreenTVCell", bundle: nil), forCellReuseIdentifier: "SingleScreenTVCell")
    }
    
    //MARK: - Rx
}

//MARK: - Extension. UITableView
extension SingleViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SingleScreenTVCell")
                as? SingleScreenTVCell else { return UITableViewCell.init()}
        let asd = 0...10
        cell.descriptionLabel.text = asd.map {"\($0)"}.joined(separator: "Test ")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let lastCellHeightSafe = cellHeight else { return tableView.rowHeight }
        return lastCellHeightSafe
    }
}

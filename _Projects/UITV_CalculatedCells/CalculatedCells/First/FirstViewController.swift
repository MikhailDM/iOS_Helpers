//
//  FirstViewController.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
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
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    private enum Cells: String, CaseIterable {
        case SingleCalculated = "Одна ячейка на весь экран"
        case MultipleCalculated = "Последняя ячейка заполняет экран"
    }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        configureUITableView()
    }
    
    deinit { print("===== Deinited: FirstViewController") }
    
    //MARK: - Display
    func display(displayType: FirstLogic.Action.Display.DisplayType) { }
    
    //MARK: - Private
    private func configureDesign() {
        title = "Calculated Cells"
        navigationItem.backButtonTitle = ""
    }
    
    private func configureUITableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: "FirstScreenTVCell", bundle: nil), forCellReuseIdentifier: "FirstScreenTVCell")
    }
    
    //MARK: - Rx
}

//MARK: - Extension. UITableView
extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cells.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = Cells.allCases[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstScreenTVCell") as? FirstScreenTVCell else { return UITableViewCell.init() }
        cell.title.text = cellType.rawValue
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellType = Cells.allCases[indexPath.row]
        switch cellType {
        case .SingleCalculated:
            interactor?.interactorRequest(requestType: .routeToSingle)
        case .MultipleCalculated:
            print("Route2")
        }
    }
}


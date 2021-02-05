//
//  MutiCellsViewController.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit
//import RxSwift

//MARK: - View
class MutiCellsViewController: UIViewController, MutiCellsViewDependencies, MutiCellsViewLogic {
    
    //MARK: - Configure
    var interactor: MutiCellsInteractorLogic?
    var dataStore: MutiCellsDataStore?
    var configurator = MutiCellsConfigurator()
    
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
        case MultiCellsFirstTVCell = "MultiCellsFirstTVCell"
        case MultiCellsSecondTVCell = "MultiCellsSecondTVCell"
        case MultiCellsBottomTVCell = "MultiCellsBottomTVCell"
    }
    private var lastCellInitialHeight: CGFloat?
    private var lastCellHeight: CGFloat?
    private var isExpanded = false
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        configureUITableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard tableView.visibleCells.count == Cells.allCases.count,
            let maxY = tableView.visibleCells.last?.frame.maxY,
              maxY < tableView.frame.height,
              let lastCellMinY = tableView.visibleCells.dropLast().last?.frame.maxY,
              let lastCellHeigh = tableView.visibleCells.last?.frame.height else { return }
        lastCellHeight = tableView.bounds.height - lastCellMinY
        lastCellInitialHeight = lastCellHeigh
    }
    
    deinit { print("===== Deinited: MutiCellsViewController") }
    
    //MARK: - Display
    func display(displayType: MutiCellsLogic.Action.Display.DisplayType) { }
    
    //MARK: - Private
    private func configureDesign() {
        title = "Multi Cells"
        navigationItem.backButtonTitle = ""
    }
    
    private func configureUITableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        Cells.allCases.forEach { tableView.register(UINib(nibName: $0.rawValue, bundle: nil), forCellReuseIdentifier: $0.rawValue) }
    }
    
    private func calculateLastCellHeight() {
        guard tableView.visibleCells.count == Cells.allCases.count,
              let dropLastCellMaxY = tableView.visibleCells.dropLast().last?.frame.maxY,
              let lastCellInitialHeightSafe = lastCellInitialHeight,
              dropLastCellMaxY+lastCellInitialHeightSafe < tableView.frame.height else { lastCellHeight = UITableView.automaticDimension; return }
        lastCellHeight = tableView.bounds.height - dropLastCellMaxY
    }
    
    //MARK: - Rx
}

//MARK: - Extension. UITableView
extension MutiCellsViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cells.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = Cells.allCases[indexPath.row]
        switch cellType {
        case .MultiCellsFirstTVCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MultiCellsFirstTVCell")
                    as? MultiCellsFirstTVCell else { return UITableViewCell.init() }
            return cell
        case .MultiCellsSecondTVCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MultiCellsSecondTVCell")
                    as? MultiCellsSecondTVCell else { return UITableViewCell.init() }
            cell.delegate = self
            let asd = 0...191
            cell.descriptionLabel.text = asd.map {"\($0)"}.joined(separator: "Test ")
            cell.descriptionLabel.numberOfLines = isExpanded ? 100 : 1
            return cell
        case .MultiCellsBottomTVCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MultiCellsBottomTVCell")
                    as? MultiCellsBottomTVCell else { return UITableViewCell.init() }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let lastCellHeightSafe = lastCellHeight, Cells.allCases[indexPath.row] == .MultiCellsBottomTVCell else { return tableView.rowHeight }
        return lastCellHeightSafe
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension MutiCellsViewController: MultiCellsSecondTVCellDelegate {
    func expandByttonPressed() {
        isExpanded.toggle()
        tableView.reloadRows(at: [IndexPath(row: Cells.allCases.firstIndex(of: .MultiCellsSecondTVCell)!, section: 0)], with: .fade)
        calculateLastCellHeight()
        tableView.reloadRows(at: [IndexPath(row: Cells.allCases.firstIndex(of: .MultiCellsBottomTVCell)!, section: 0)], with: .none)
    }
}

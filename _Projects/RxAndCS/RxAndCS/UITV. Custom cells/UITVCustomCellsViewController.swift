//
//  UITVCustomCellsViewController.swift
//  RxAndCS
//
//  Created by Dmitriev on 24.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

//MARK: - Protocol. DisplayLogic

protocol UITVCustomCellsDisplayLogic: class {
    func displayData(viewModel: UITVCustomCells.Model.ViewModel.ViewModelData)
}


class UITVCustomCellsViewController: UIViewController, UITVCustomCellsDisplayLogic {
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Cells
    
    private enum Cells: Int, CaseIterable {
        case UITVCustomCellsHeaderTVCell
        case UITVCustomCellsInfoTVCell
        case UITVCustomCellsSwitchTVCell
        case UITVCustomCellsEnterTVCell
        case UITVCustomCellsValidationTVCell
        case UITVCustomCellsExpanableTVCell
    }
    
    
    //MARK: - Settings
    
    var interactor: UITVCustomCellsBusinessLogic?
    var router: (NSObjectProtocol & UITVCustomCellsRoutingLogic & UITVCustomCellsDataPassing)?
    lazy var configurator: UITVCustomCellsConfiguratorProtocol = UITVCustomCellsConfigurator()
    
    
    //MARK: - Properties
    
    private var disposeBag = DisposeBag()
    private var _screenVM: UITVCustomCellsViewModel?
    private var _lastCellHeight: CGFloat?
    
    
    //MARK: - Init
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configurator.configure(with: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator.configure(with: self)
    }
    
    
    //MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLastCellHeight()
        configureViewSettings()
        configureDesign()
        registerUITVCells()
    }
    
    deinit {
        print("DEINITED - UITVCustomCellsViewController")
    }
    
    
    //MARK: - Display data
    
    func displayData(viewModel: UITVCustomCells.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayViewModel(viewModel: let viewModel):
            _screenVM = viewModel
            
            tableView.reloadRows(at: [IndexPath(row: Cells.UITVCustomCellsInfoTVCell.rawValue, section: .zero)], with: .none)
        }
    }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func configureDesign() {
        title = "Custom cells"
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    private func configureViewSettings() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func configureLastCellHeight() {
        DispatchQueue.main.async { [weak self] in
            guard
                let self = self,
                let cell = self.tableView.visibleCells.last,
                cell.frame.maxY < self.tableView.frame.height else { return }
            self._lastCellHeight = self.tableView.frame.height - cell.frame.minY
            self.tableView.reloadRows(at: [IndexPath(row: Cells.UITVCustomCellsExpanableTVCell.rawValue, section: .zero)], with: .none)
            print("CHARGE LAST CELL VALUE - \(self.tableView.frame.height - cell.frame.minY)")
        }
    }
    
    
}//




//MARK: - Extension. Rx Cells

extension UITVCustomCellsViewController {
    
    private func subscribeToSwitchCell(cell: UITVCustomCellsSwitchTVCell) {
        cell.switchRelay
            .subscribe(onNext: { [weak self] isOn in
                print("SWITCH PRESSED WITH STATE - \(isOn.description.uppercased())")
                self?.interactor?.makeRequest(request: .switchPressed(state: isOn))
            })
            .disposed(by: cell.disposeBag)
    }
    
    private func subscribeToEnterCell(cell: UITVCustomCellsEnterTVCell) {
        cell.enteredTextRelay
            .subscribe(onNext: { [weak self] value in
                print("TEXT ENTERED - \(value)")
                self?.interactor?.makeRequest(request: .textEntered(text: value))
            })
            .disposed(by: cell.disposeBag)
    }
    
    private func subscribeValidationCell(cell: UITVCustomCellsValidationTVCell) {
        cell.isEverythingValid
            .subscribe(onNext: { [weak self] isValid in
                print("VALID IN CONTROLLER - \(isValid.description.uppercased())")
                self?.interactor?.makeRequest(request: .passedTheValidation(isValid: isValid))
            })
            .disposed(by: cell.disposeBag)
    }
    
}//


//MARK: - Extension. UITableView

extension UITVCustomCellsViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cells.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return configureCell(cellType: Cells.allCases[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return calculatecCellHeight(cellType: Cells.allCases[indexPath.row])
    }
    
    private func calculatecCellHeight(cellType: Cells) -> CGFloat {
        switch cellType {
        case .UITVCustomCellsHeaderTVCell:
            return 150
            
        case .UITVCustomCellsExpanableTVCell:
            guard let lastCellHeightSafe = _lastCellHeight else { return tableView.rowHeight}
            return lastCellHeightSafe
            
        default:
            return tableView.rowHeight
        }
    }
    
    private func configureCell(cellType: Cells) -> UITableViewCell {
        switch cellType {
        case .UITVCustomCellsHeaderTVCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITVCustomCellsHeaderTVCell")
                    as? UITVCustomCellsHeaderTVCell else { return UITableViewCell.init()}
            return cell
            
        case .UITVCustomCellsInfoTVCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITVCustomCellsInfoTVCell")
                    as? UITVCustomCellsInfoTVCell else { return UITableViewCell.init()}
            cell.configure(viewModel: _screenVM)
            return cell
            
        case .UITVCustomCellsSwitchTVCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITVCustomCellsSwitchTVCell")
                    as? UITVCustomCellsSwitchTVCell else { return UITableViewCell.init()}
            subscribeToSwitchCell(cell: cell)
            return cell
            
        case .UITVCustomCellsEnterTVCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITVCustomCellsEnterTVCell")
                    as? UITVCustomCellsEnterTVCell else { return UITableViewCell.init()}
            subscribeToEnterCell(cell: cell)
            return cell
            
        case .UITVCustomCellsValidationTVCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITVCustomCellsValidationTVCell")
                    as? UITVCustomCellsValidationTVCell else { return UITableViewCell.init()}
            subscribeValidationCell(cell: cell)
            return cell
            
        case .UITVCustomCellsExpanableTVCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITVCustomCellsExpanableTVCell")
                    as? UITVCustomCellsExpanableTVCell else { return UITableViewCell.init()}
            return cell
        }
    }
    
    private func registerUITVCells() {
        tableView.register(UINib(nibName: "UITVCustomCellsHeaderTVCell", bundle: nil),
                           forCellReuseIdentifier: "UITVCustomCellsHeaderTVCell")
        tableView.register(UINib(nibName: "UITVCustomCellsInfoTVCell", bundle: nil),
                           forCellReuseIdentifier: "UITVCustomCellsInfoTVCell")
        tableView.register(UINib(nibName: "UITVCustomCellsSwitchTVCell", bundle: nil),
                           forCellReuseIdentifier: "UITVCustomCellsSwitchTVCell")
        tableView.register(UINib(nibName: "UITVCustomCellsEnterTVCell", bundle: nil),
                           forCellReuseIdentifier: "UITVCustomCellsEnterTVCell")
        tableView.register(UINib(nibName: "UITVCustomCellsValidationTVCell", bundle: nil),
                           forCellReuseIdentifier: "UITVCustomCellsValidationTVCell")
        tableView.register(UINib(nibName: "UITVCustomCellsExpanableTVCell", bundle: nil),
                           forCellReuseIdentifier: "UITVCustomCellsExpanableTVCell")
    }
    
}//


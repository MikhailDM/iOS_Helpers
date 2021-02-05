//
//  UITVCalculatingViewController.swift
//  RxAndCS
//
//  Created by Dmitriev on 29.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

//MARK: - Protocol. DisplayLogic

protocol UITVCalculatingDisplayLogic: class {
    func displayData(viewModel: UITVCalculating.Model.ViewModel.ViewModelData)
}


class UITVCalculatingViewController: UIViewController, UITVCalculatingDisplayLogic {
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Cells
    
    private enum Cells: Int, CaseIterable {
        case UITVCalculatingTextTVCell
        case UITVCalculatingButtonTVCell
    }
    
    
    //MARK: - Settings
    
    var interactor: UITVCalculatingBusinessLogic?
    var router: (NSObjectProtocol & UITVCalculatingRoutingLogic & UITVCalculatingDataPassing)?
    lazy var configurator: UITVCalculatingConfiguratorProtocol = UITVCalculatingConfigurator()
    
    
    //MARK: - Properties
    
    private var _isExpandedState: Bool?
    private var _lastCellHeight: (initial: CGFloat?, calculated: CGFloat?)
    
    
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
        configureDesign()
        configureUITableView()
        configureLastCellHeight()
    }
    
    deinit {
        print("DEINITED - UITVCalculatingViewController")
    }
    
    
    //MARK: - Display data
    
    func displayData(viewModel: UITVCalculating.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayExpandedText(isExpanded: let isExpanded):
            _isExpandedState = isExpanded
            tableView.reloadRows(at: [IndexPath(row: Cells.UITVCalculatingTextTVCell.rawValue, section: .zero)], with: .fade)
            configureLastCellHeight()
        }
    }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func configureDesign() {
        title = "Calculating cell"
    }
    
    private func configureUITableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: "UITVCalculatingTextTVCell", bundle: nil), forCellReuseIdentifier: "UITVCalculatingTextTVCell")
        tableView.register(UINib(nibName: "UITVCalculatingButtonTVCell", bundle: nil), forCellReuseIdentifier: "UITVCalculatingButtonTVCell")
    }
    
    private func configureLastCellHeight() {
        DispatchQueue.main.async { [weak self] in
            guard
                let self = self,
                let cell = self.tableView.visibleCells.last  else { return }
            
            if self._lastCellHeight.initial == nil { self._lastCellHeight.initial = cell.frame.height }
            self._lastCellHeight.calculated = nil
            
            guard
                let initialLastCellHeightSafe = self._lastCellHeight.initial,
                let maxYOfPreviousCells = self.tableView.visibleCells.dropLast().last?.frame.maxY,
                (initialLastCellHeightSafe + maxYOfPreviousCells) < self.tableView.frame.height else { return }
            
            self._lastCellHeight.calculated = self.tableView.frame.height - maxYOfPreviousCells
            self.tableView.reloadRows(at: [IndexPath(row: Cells.UITVCalculatingButtonTVCell.rawValue, section: .zero)], with: .none)
        }
    }
    
    
}//




//MARK: - Extension. Rx Cells

extension UITVCalculatingViewController {
    
    private func subscribeToButtonCell(cell: UITVCalculatingButtonTVCell) {
        cell.bottomButton.rx.tap
            .subscribe { (_) in
                print("BOTTOM BUTTON PRESSED")
            }
            .disposed(by: cell.disposeBag)
    }
    
}//


//MARK: - Extension. UITableView

extension UITVCalculatingViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cells.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = Cells.allCases[indexPath.row]
        
        switch cellType {
        case .UITVCalculatingTextTVCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITVCalculatingTextTVCell")
                    as? UITVCalculatingTextTVCell else { return UITableViewCell.init()}
            cell.configure(isTextExpanded: _isExpandedState)
            return cell
            
        case .UITVCalculatingButtonTVCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITVCalculatingButtonTVCell")
                    as? UITVCalculatingButtonTVCell else { return UITableViewCell.init()}
            subscribeToButtonCell(cell: cell)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellType = Cells.allCases[indexPath.row]
        if cellType == .UITVCalculatingTextTVCell {
            interactor?.makeRequest(request: .expandTheText)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard
            Cells.allCases[indexPath.row] == .UITVCalculatingButtonTVCell,
            let lastCellHeightSafe = _lastCellHeight.calculated else { return tableView.rowHeight }
        return lastCellHeightSafe
    }
    
}//
    
    


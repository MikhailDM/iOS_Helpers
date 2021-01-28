//
//  UITVFullscreenViewController.swift
//  RxAndCS
//
//  Created by Dmitriev on 29.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

//MARK: - Protocol. Display Logic

protocol UITVFullscreenDisplayLogic: class {
    func displayData(viewModel: UITVFullscreen.Model.ViewModel.ViewModelData)
}


class UITVFullscreenViewController: UIViewController, UITVFullscreenDisplayLogic {
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Properties
    
    var interactor: UITVFullscreenBusinessLogic?
    var router: (NSObjectProtocol & UITVFullscreenRoutingLogic & UITVFullscreenDataPassing)?
    lazy var configurator: UITVFullscreenConfiguratorProtocol = UITVFullscreenConfigurator()
    
    private var disposeBag = DisposeBag()
    
    private var _screenViewModel = Observable.just(["Just One Cell"])
    private var _lastCellHeight = BehaviorRelay<CGFloat?>(value: nil)
    
    
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
        registerCells()
        configureDesign()
        configureLastCellHeight()
        
        DispatchQueue.main.async { [weak self] in
            self?.subscribeToUITableView()
            self?.configureLastCellHeight()
        }
    }
    
    deinit {
        print("DEINITED - UITVFullscreenViewController")
    }
    
    
    //MARK: - Display data
    
    func displayData(viewModel: UITVFullscreen.Model.ViewModel.ViewModelData) { }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func configureDesign() {
        title = "Single cell"
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    //Calculate last cell height
    private func configureLastCellHeight() {
        guard
            let maxY = tableView.visibleCells.last?.frame.maxY,
            maxY < tableView.frame.height else { return }
        _lastCellHeight.accept(tableView.frame.height)
    }
    
    
}//


//MARK: - Extension. Rx

extension UITVFullscreenViewController {
        
    private func subscribeTo() { }
    
}


//MARK: - Extension. UITableView

extension UITVFullscreenViewController: UITableViewDelegate {
    
    private func registerCells() {
        tableView.register(UINib(nibName: "UITVFullscreenTVCell", bundle: nil),
                           forCellReuseIdentifier: "UITVFullscreenTVCell")
    }
    
    private func subscribeToUITableView() {
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        _screenViewModel
            .bind(to: tableView.rx.items(cellIdentifier: "UITVFullscreenTVCell", cellType: UITVFullscreenTVCell.self)) { _,_,_ in }
            .disposed(by: disposeBag)
        
        _lastCellHeight
            .subscribe { [weak self] _ in
                self?.tableView.reloadData()
            }
            .disposed(by: disposeBag)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let lastCellHeightSafe = _lastCellHeight.value else { return tableView.rowHeight }
        return lastCellHeightSafe
    }
}

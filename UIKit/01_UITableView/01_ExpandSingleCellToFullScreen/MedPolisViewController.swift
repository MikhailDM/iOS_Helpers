//
//  MedPolisViewController.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 17.08.2020.
//  Copyright (c) 2020 aisa. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

//MARK: - Protocol. Display

protocol MedPolisDisplayLogic: class {
    func displayData(viewModel: MedPolis.Model.ViewModel.ViewModelData)
}


class MedPolisViewController: UIViewController, MedPolisDisplayLogic {
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Cells

    private enum TableViewCells: Int, CaseIterable {
        case MedPolisInfoTVCell
        case MedPolisEnterTVCell
        case MedPolisButtonsTVCell
    }


    //MARK: - Properties
    
    var interactor: MedPolisBusinessLogic?
    var router: (NSObjectProtocol & MedPolisRoutingLogic & MedPolisDataPassing)?
    lazy var configurator: MedPolisConfiguratorProtocol = MedPolisConfigurator()
    
    private var viewModel: MedPolisViewModel?
    private var lastCellHeight: CGFloat?
    
    
    //MARK: - Object lifecycle
    
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
        setupDesign()
        registerCells()
        initKeyboardManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateCellsHeights()
    }
    
    deinit {
        print("DEINITED - MedPolisViewController")
        deInitKeyboardManager()
    }
    
    
    //MARK: - Display data
    
    func displayData(viewModel: MedPolis.Model.ViewModel.ViewModelData) {
        
        switch viewModel {
        case .displayViewModel(viewModel: let viewModel):
            self.viewModel = viewModel
            print("VIEW MODEL ON ENTER: \(viewModel)")
            tableView.reloadData()
            //Test
            //self.tableView.beginUpdates()
            //self.tableView.reloadRows(at: [IndexPath(row: TableViewCells.MedPolisButtonsTVCell.rawValue, section: .zero)], with: .none)
            //self.tableView.endUpdates()
            
        case .displayError(viewModel: let viewModel):
            self.viewModel = viewModel
            print("VIEW MODEL ON ERROR: \(viewModel)")
            
            self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [IndexPath(row: TableViewCells.MedPolisEnterTVCell.rawValue, section: .zero)], with: .fade)
            self.tableView.endUpdates()
            updateCellsHeights()
            
        case .presentLastCellHeight(height: let height):
            self.lastCellHeight = height
            tableView.reloadData()
        }
    }
    
    
    //MARK: - Actions
    
    //FIXME: - REFACTOR
    @IBAction func errorButtonPressed(_ sender: UIBarButtonItem) {
        interactor?.makeRequest(request: .TESTMakeError)
    }
    
    
    
    //MARK: - Private
    
    private func setupDesign() {
        navigationItem.title = "Цифровое здравоохранение"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
    }
    
    private func registerCells() {
        self.tableView.register(UINib(nibName: "MedPolisInfoTVCell", bundle: nil), forCellReuseIdentifier: "MedPolisInfoTVCell")
        self.tableView.register(UINib(nibName: "MedPolisEnterTVCell", bundle: nil), forCellReuseIdentifier: "MedPolisEnterTVCell")
        self.tableView.register(UINib(nibName: "MedPolisButtonsTVCell", bundle: nil), forCellReuseIdentifier: "MedPolisButtonsTVCell")
    }
    
    private func initKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Ок"
    }
    
    private func deInitKeyboardManager() {
        IQKeyboardManager.shared.enable = false
        IQKeyboardManager.shared.enableAutoToolbar = false
    }
    
    private func updateCellsHeights() {
        DispatchQueue.main.async {
            guard let lastCell = self.tableView.visibleCells.last else { return }
            let cellsHeights = self.tableView.visibleCells.map { $0.frame.height }
            self.interactor?.makeRequest(request: .setCellsHeightsValues(cellsHeights: cellsHeights,
                                                                         lastCellInitialHeight: lastCell.frame.height,
                                                                         tableViewHeight: self.tableView.frame.height))
        }
    }
    
    
}//




//MARK: - Extension. UITableView

extension MedPolisViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TableViewCells.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = TableViewCells(rawValue: indexPath.row) else { return UITableViewCell.init() }
        
        switch cellType {
        case .MedPolisInfoTVCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MedPolisInfoTVCell", for: indexPath)
                as? MedPolisInfoTVCell else { fatalError("MedPolisInfoCell does not exist") }
            return cell
            
        case .MedPolisEnterTVCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MedPolisEnterTVCell", for: indexPath)
            as? MedPolisEnterTVCell else { fatalError("MedPolisEnterCell does not exist") }
            cell.delegate = self
            cell.configureCell(viewModel: viewModel)
            return cell
            
        case .MedPolisButtonsTVCell:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MedPolisButtonsTVCell", for: indexPath)
                as? MedPolisButtonsTVCell else { fatalError("MedPolisButtonsTVCell does not exist") }
            
            cell.delegate = self
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard
            let lastCellHeightSafe = lastCellHeight,
            let cellType = TableViewCells(rawValue: indexPath.row),
            cellType == .MedPolisButtonsTVCell else { return tableView.rowHeight }
        return lastCellHeightSafe
    }
}


//MARK: - Extension. Cells buttons pressed delegate

extension MedPolisViewController: MedPolisButtonsTVCellDelegate {
    func showPolicyAlert() {
        UIUtils.showSimpleDialog(controller: self,
                                 title: "Политика в отношении обработки персональных данных",
                                 text: "В соответствии с ФЗ от 27.07.2006 № 152-ФЗ \"О персональных данных\", заполняя поля формы обратной связи, Вы даете согласие на обработку указанных персональных данных какими угодно способами, в том числе путем осуществления прямых контактов с Вами с помощью средств связи. Оператор ГИС ЕКП гарантирует конфиденциальность и сохранность предоставленных Вами сведений.")
    }
    
    //FIXME: - REFACTOR
    func onCancelButtonPressed() {
        print("CANCEL BUTTON PRESSED")
    }
    
    //FIXME: - REFACTOR
    func onSaveButtonPressed() {
        print("SAVE BUTTON PRESSED")
        router?.routeToMain()
    }
}


//MARK: - Extension. User finished input delegate

extension MedPolisViewController: MedPolisEnterTVCellDelegate {
    func onUserFinishedInpit(series: String?, number: String?) {
        interactor?.makeRequest(request: .setSerialAndNumberOMS(series: series,
                                                                number: number))
    }
}

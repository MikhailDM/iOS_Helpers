//
//  WAppSearchViewController.swift
//  WA_Viper
//
//  Created by Михаил Дмитриев on 04.12.2020
//


import UIKit
import RxSwift
import RxCocoa


class WAppSearchViewController: UIViewController, WAppSearchViewProtocol, WAppSearchViewLogicProtocol {
    //MARK: - Configure
    var presenter: (WAppSearchPresenterLogicProtocol & WAppSearchDataStoreProtocol)?
    var configurator = WAppSearchConfigurator()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configurator.configure(with: self)
    }
    
    
    //MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Properties
    private var disposeBag = DisposeBag()
    private var viewModel = [String]()
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDesign()
        configureUITableView()
        
        subscribeToSearchBar()
        subscribeCancelButtonPressed()
        presenter?.presenterRequest(requestType: .getCitiesList)
    }
    
    deinit { print("===== DEINITED: WAppSearchViewController") }
    
    
    //MARK: - Display
    func display(displayType: WAppSearch.Action.Display.DisplayType) {
        switch displayType {
        case .displayCities(cities: let cities):
            viewModel = cities
            tableView.reloadData()
        }
    }
    
    
    //MARK: - Private
    private func configureDesign() {
        title = "Search"
        navigationItem.backButtonTitle = ""
        view.backgroundColor = UIColor.clear
    }
    
    private func configureUITableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(UINib(nibName: "WAppSearchTVCell", bundle: nil), forCellReuseIdentifier: "WAppSearchTVCell")
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.backgroundView = blurEffectView
        tableView.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
    }
    
    
    //MARK: - Rx
    private func subscribeToSearchBar() {
        searchBar.rx.value.orEmpty.changed
            .debug("===== SEARCH BAR")
            .subscribe(onNext: { [weak self] text in
                self?.presenter?.presenterRequest(requestType: .getCitiesWhichContainText(searchText: text))
            }).disposed(by: disposeBag)
    }
    
    private func subscribeCancelButtonPressed() {
        cancelButton.rx.tap
            .subscribe { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }.disposed(by: disposeBag)
    }
}//


//MARK: - Extension. UITableView
extension WAppSearchViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard !viewModel.isEmpty else { return 1 }
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WAppSearchTVCell") as! WAppSearchTVCell
        guard !viewModel.isEmpty else {
            cell.title?.text = "No results"
            return cell
        }
        cell.title?.text = viewModel[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.presenterRequest(requestType: .selectCity(city: viewModel[indexPath.row]))
        dismiss(animated: true, completion: nil)
    }
}//

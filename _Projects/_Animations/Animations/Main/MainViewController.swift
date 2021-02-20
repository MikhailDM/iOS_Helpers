//
//  MainViewController.swift
//  Animations
//
//  Created by Mikhail Dmitriev on 17.02.2021.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    enum Cell: CaseIterable {
        case uiView
        case bottomSheet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        title = "Main"
        navigationItem.backButtonTitle = ""
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "MainTVCell", bundle: nil), forCellReuseIdentifier: "MainTVCell")
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cell.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainTVCell", for: indexPath) as? MainTVCell else { return UITableViewCell() }
        let cellType = Cell.allCases[indexPath.row]
        
        switch cellType {
        case .uiView: cell.title.text = "UIView"
        case .bottomSheet: cell.title.text = "BottomSheet"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellType = Cell.allCases[indexPath.row]
        switch cellType {
        case .uiView:
            navigationController?.pushViewController(UIViewViewController(), animated: true)
        case .bottomSheet:
            navigationController?.pushViewController(BottomSheetViewController(), animated: true)
        }
    }
}


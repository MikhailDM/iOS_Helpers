//
//  AddNumbersViewController.swift
//  RxAndCS
//
//  Created by Dmitriev on 24.09.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

//MARK: - Protocol. DisplayLogic

protocol AddNumbersDisplayLogic: class {
    func displayData(viewModel: AddNumbers.Model.ViewModel.ViewModelData)
}


class AddNumbersViewController: UIViewController, AddNumbersDisplayLogic {
    //MARK: - Outlets
    
    @IBOutlet weak var firstTF: UITextField!
    @IBOutlet weak var secondTF: UITextField!
    @IBOutlet weak var thirdTF: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    //MARK: - Properties
    
    var interactor: AddNumbersBusinessLogic?
    var router: (NSObjectProtocol & AddNumbersRoutingLogic & AddNumbersDataPassing)?
    lazy var configurator: AddNumbersConfiguratorProtocol = AddNumbersConfigurator()
    
    private let disposeBag = DisposeBag()
    
    
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
        setupDesign()
        subscribeToTF()
    }
    
    deinit {
        print("DEINITED - AddNumbersViewController")
    }
    
    
    //MARK: - Display data
    
    func displayData(viewModel: AddNumbers.Model.ViewModel.ViewModelData) {
        
    }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func setupDesign() {
        title = "Adding numbers"
    }
    
    
    //MARK: - Rx
    
    private func subscribeToTF() {
        Observable.combineLatest(firstTF.rx.text.orEmpty, secondTF.rx.text.orEmpty, thirdTF.rx.text.orEmpty) { textValue1, textValue2, textValue3 -> Int in
            return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0) + (Int(textValue3) ?? 0)
        }
        .map { "SUM IS: \($0.description)" }
        .bind(to: answerLabel.rx.text)
        .disposed(by: disposeBag)
    }
    
    
}//




//MARK: - Extension.

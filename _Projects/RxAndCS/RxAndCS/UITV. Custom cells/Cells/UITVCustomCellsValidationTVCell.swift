//
//  ActivStepsLoginCell.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 23.07.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class UITVCustomCellsValidationTVCell: UITableViewCell {
    //MARK: - Outlets
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    
    
    //MARK: - Properties
    
    var disposeBag = DisposeBag()
    var isEverythingValid = PublishSubject<Bool>()
    
    private let minimalUsernameLength = 5
    private let minimalPasswordLength = 5
    
    private var usernameValidOutletText = " "
    private var passwordValidOutletText = " "
    
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesign()
        subscribeToTF()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
        subscribeToTF()
    }
    
    
    //MARK: - Configure
    
    func configure() { }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func setupDesign() {
        usernameValidOutletText = "Username has to be at least \(minimalUsernameLength) characters"
        passwordValidOutletText = "Password has to be at least \(minimalPasswordLength) characters"
    }
    
    
}//




//MARK: - Extension. Rx

extension UITVCustomCellsValidationTVCell {
    
    private func subscribeToTF() {
        let usernameValid = usernameTF.rx.text.orEmpty
            .map { $0.count >= self.minimalUsernameLength }
        
        let passwordValid = passwordTF.rx.text.orEmpty
            .map { $0.count >= self.minimalPasswordLength }
        
        let isAllValid = Observable
            .combineLatest(usernameValid, passwordValid) { $0 && $1 }
            
        //Global Check
        isAllValid
            .skip(1)
            .distinctUntilChanged()
            .bind { [weak self] isValid in
                self?.isEverythingValid.onNext(isValid)
            }
            .disposed(by: disposeBag)
        
        //Interactive
        usernameValid
            .bind(to: passwordTF.rx.isEnabled)
            .disposed(by: disposeBag)
        
        usernameValid
            .bind { (isValid) in
                self.usernameLabel.text = isValid ? " " : self.usernameValidOutletText
            }
            .disposed(by: disposeBag)

        passwordValid
            .bind { (isValid) in
                self.passwordLabel.text = isValid ? " " : self.passwordValidOutletText
            }
            .disposed(by: disposeBag)
    }
    
}//

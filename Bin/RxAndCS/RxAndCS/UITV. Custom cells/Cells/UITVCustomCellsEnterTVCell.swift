//
//  ActivStepsLoginCell.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 23.07.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit
import RxSwift

class UITVCustomCellsEnterTVCell: UITableViewCell {
    //MARK: - Outlets
    
    @IBOutlet weak var textField: UITextField!
    
    
    //MARK: - Properties
    
    var disposeBag = DisposeBag()
    var enteredTextRelay = PublishSubject<String>()
    
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesign()
        subscribeToEnteredText()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
        subscribeToEnteredText()
    }
    
    
    //MARK: - Configure
    
    func configure() { }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func setupDesign() { }
    
    
}//




//MARK: - Extension. Rx

extension UITVCustomCellsEnterTVCell {
    
    private func subscribeToEnteredText() {
        textField.rx
            .controlEvent(.editingChanged)
            .withLatestFrom(textField.rx.text.orEmpty)
            .subscribe(onNext: { [weak self] value in
                self?.enteredTextRelay.onNext(value)
            })
            .disposed(by: disposeBag)
    }
}

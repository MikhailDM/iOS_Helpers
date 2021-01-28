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

class UITVCustomCellsSwitchTVCell: UITableViewCell {
    //MARK: - Outlets
    
    @IBOutlet weak var mySwitch: UISwitch!
    
    
    //MARK: - Properties
    
    var disposeBag = DisposeBag()
    var switchRelay = PublishSubject<Bool>()
    
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesign()
        subscribeToSwitch()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
        subscribeToSwitch()
    }
    
    
    //MARK: - Configure
    
    func configure() { }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func setupDesign() { }
    

}//




//MARK: - Extension. Rx

extension UITVCustomCellsSwitchTVCell {
    
    private func subscribeToSwitch() {
        mySwitch.rx
            .isOn.changed
            .subscribe(onNext: { [weak self] isOn in
                self?.switchRelay.onNext(isOn)
            })
            .disposed(by: disposeBag)
    }
    
}//

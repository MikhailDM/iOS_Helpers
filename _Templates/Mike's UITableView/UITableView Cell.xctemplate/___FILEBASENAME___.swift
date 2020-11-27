//
//  ActivStepsLoginCell.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 23.07.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit
import RxSwift


class ___FILEBASENAME___: UITableViewCell {
    //MARK: - Outlets
    
    
    //MARK: - Properties
    var disposeBag = DisposeBag()
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureDesign()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    
    //MARK: - Configure
    func configure() { }
    
    
    //MARK: - Private
    private func configureDesign() { }
    
    
    //MARK: - Rx
    
}//

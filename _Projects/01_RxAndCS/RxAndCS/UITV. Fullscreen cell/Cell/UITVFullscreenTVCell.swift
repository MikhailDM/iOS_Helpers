//
//  ActivStepsLoginCell.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 23.07.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit
import RxSwift

class UITVFullscreenTVCell: UITableViewCell {
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
    
    func configureCell() { }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func configureDesign() {
        separatorInset.left = .greatestFiniteMagnitude
    }
    
    
}//

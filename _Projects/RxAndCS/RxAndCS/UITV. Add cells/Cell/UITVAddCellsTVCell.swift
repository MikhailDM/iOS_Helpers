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

class UITVAddCellsTVCell: UITableViewCell {
    //MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!

    
    //MARK: - Rx
    
    var disposeBag = DisposeBag()
    
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesign()
    }
    
    //Предотвращаем множественную подписку
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    
    //MARK: - Configure
    
    func configure(titleText: String) {
        titleLabel.text = titleText
    }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func setupDesign() { }
    
    
}//

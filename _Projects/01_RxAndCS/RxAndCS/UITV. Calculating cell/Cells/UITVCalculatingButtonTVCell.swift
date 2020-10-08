//
//  ActivStepsLoginCell.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 23.07.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit
import RxSwift

class UITVCalculatingButtonTVCell: UITableViewCell {
    //MARK: - Outlets
    
    @IBOutlet weak var bottomButton: UIButton!
    
    
    //MARK: - Properties
    
    var disposeBag = DisposeBag()
    
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesign()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
    
    //MARK: - Configure
    
    func configure() { }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func setupDesign() { }
    
    
}//

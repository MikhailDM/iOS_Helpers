//
//  ActivStepsLoginCell.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 23.07.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit
import RxSwift

class UITVCalculatingTextTVCell: UITableViewCell {
    //MARK: - Outlets
    
    @IBOutlet weak var expanableText: UILabel!
    
    
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
    
    func configure(isTextExpanded: Bool?) {
        guard
            let isTextExpandedSafe = isTextExpanded,
            isTextExpandedSafe else {
            expanableText.numberOfLines = 5
            return
        }
        expanableText.numberOfLines = 0
    }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func setupDesign() { }
    
    
}//

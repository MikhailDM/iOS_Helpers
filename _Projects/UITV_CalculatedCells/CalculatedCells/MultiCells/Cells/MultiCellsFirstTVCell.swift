//
//  MultiCellsFirstTVCell.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit
//import RxSwift

//MARK: - UITableViewCell
class MultiCellsFirstTVCell: UITableViewCell {
    
    //MARK: - Outlets
    
    //MARK: - Properties
    //var disposeBag = DisposeBag()
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureDesign()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //disposeBag = DisposeBag()
    }
    
    //MARK: - Configure
    func configure() { }
    
    //MARK: - Private
    private func configureDesign() { }
    
    //MARK: - Rx
}

//
//  MultiCellsBottomTVCell.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit
//import RxSwift

//MARK: - UITableViewCell
class MultiCellsBottomTVCell: UITableViewCell {
    
    //MARK: - Outlets
    
    //MARK: - Properties
    //var disposeBag = DisposeBag()
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureDesign()
        separatorInset.left = .greatestFiniteMagnitude
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

//
//  MultiCellsSecondTVCell.swift
//  CalculatedCells
//
//  Created by Mikhail Dmitriev on 05.02.2021
//

import UIKit
//import RxSwift

protocol MultiCellsSecondTVCellDelegate: class {
    func expandByttonPressed()
}

//MARK: - UITableViewCell
class MultiCellsSecondTVCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var expandButton: UIButton!
    
    //MARK: - Properties
    weak var delegate: MultiCellsSecondTVCellDelegate?
    
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
    @IBAction func expandButtonPressed(_ sender: UIButton) {
        delegate?.expandByttonPressed()
    }
}

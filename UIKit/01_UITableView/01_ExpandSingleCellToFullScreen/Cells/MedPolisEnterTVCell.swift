//
//  MedPolisEnterCell.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 17.08.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit

//MARK: - PROTOCOL

protocol MedPolisEnterTVCellDelegate: class {
    func onUserFinishedInpit(series: String?, number: String?)
}


class MedPolisEnterTVCell: UITableViewCell {
    //MARK: - Delegate
    
    weak var delegate: MedPolisEnterTVCellDelegate?
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var seriesTF: UITextField!
    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    
    //MARK: - Helpers/Managers
       
    let colors = MedColors()
    
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        seriesTF.delegate = self
        numberTF.delegate = self
        errorLabel.isHidden = true
        setupDesign()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //MARK: - Configure cell
    
    func configureCell(viewModel: MedPolisViewModel?) {
        guard let viewModelSafe = viewModel else { return }
        seriesTF.layer.masksToBounds = true
        numberTF.layer.masksToBounds = true
        seriesTF.layer.borderWidth = 1
        numberTF.layer.borderWidth = 1
        seriesTF.layer.cornerRadius = seriesTF.frame.height / 6
        numberTF.layer.cornerRadius = numberTF.frame.height / 6
        switch viewModelSafe.isError {
        case true:
            errorLabel.isHidden = false
            seriesTF.layer.borderColor = UIColor.red.cgColor
            numberTF.layer.borderColor = UIColor.red.cgColor
        case false:
            errorLabel.isHidden = true
            seriesTF.layer.borderColor = UIColor.lightGray.cgColor
            numberTF.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        seriesTF.text = viewModelSafe.seriesOMS
        numberTF.text = viewModelSafe.numberOMS
    }
    
    
    //MARK: - Actions
    
    
    //MARK: - Private
    
    private func setupDesign() {
        self.separatorInset.left = UIScreen.main.bounds.width
    }
    
    
}//Class end




//MARK: - Extension. UITextField

extension MedPolisEnterTVCell: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.onUserFinishedInpit(series: seriesTF.text, number: numberTF.text)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        guard textField.layer.borderColor != UIColor.red.cgColor else { return }
        textField.layer.borderColor = colors.blue.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard textField.layer.borderColor != UIColor.red.cgColor else { return }
        textField.layer.borderColor = UIColor.lightGray.cgColor
    }
}

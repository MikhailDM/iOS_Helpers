//
//  ActivStepsLoginCell.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 23.07.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit

//MARK: - Protocol

protocol MedPolisButtonsTVCellDelegate: class {
    func onCancelButtonPressed()
    func onSaveButtonPressed()
    func showPolicyAlert()
}


class MedPolisButtonsTVCell: UITableViewCell {
    //MARK: - Delegate
    
    weak var delegate: MedPolisButtonsTVCellDelegate?
    
    
    //MARK: - Outlets
    
    @IBOutlet weak var borderButtonView: MedBorderBlueButtonView!
    @IBOutlet weak var solidButtonView: MedSolidBlueButtonView!
    
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesign()
        
        borderButtonView.delegate = self
        solidButtonView.delegate = self
    }
    
    
    //MARK: - Configure cell
    
    
    //MARK: - Actions
    
    @IBAction func policyButtonPressed(_ sender: UIButton) {
        delegate?.showPolicyAlert()
    }
        
    
    //MARK: - Private
    
    private func setupDesign() {
        borderButtonView.setupTitle(title: "Отмена")
        solidButtonView.setupTitle(title: "Сохранить")
    }
    
    
}//Class end




//MARK: - Extension. Reusable views delegate

extension MedPolisButtonsTVCell: MedBorderBlueButtonViewDelegate, MedSolidBlueButtonViewDelegate {
   
    func onMedBorderBlueButtonPressed() {
        delegate?.onCancelButtonPressed()
    }
    func onMedSolidBlueButtonPressed() {
        delegate?.onSaveButtonPressed()
    }
}

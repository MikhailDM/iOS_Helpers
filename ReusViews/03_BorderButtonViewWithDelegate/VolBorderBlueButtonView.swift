//
//  MedBorderBlueButtonView.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 17.08.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit

//MARK: - Protocols

protocol VolBorderBlueButtonViewDelegate: class {
    func onVolBorderBlueButtonPressed()
}


class VolBorderBlueButtonView: UIView {
    //MARK: - Outlets
    
    @IBOutlet weak var borderButton: UIButton!
    
    
    //MARK: - Delegate
    
    weak var delegate: VolBorderBlueButtonViewDelegate?
    
    
    //MARK: - Helpers
    
    private let customColors = VolColors()
    
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView()
    }
    
    
    //MARK: - Load
    
    func loadView() {
        let bundle = Bundle(for: VolBorderBlueButtonView.self)
        let nib = UINib(nibName: "VolBorderBlueButtonView", bundle: bundle)
        let view = nib.instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        addSubview(view)
        setupDesign()
    }
    
    
    //MARK: - Actoins
    
    @IBAction func borderButtonPressed(_ sender: UIButton) {
        delegate?.onVolBorderBlueButtonPressed()
    }
    
    
    //MARK: - Public Functions
    
    func setupTitle(title: String) {
        borderButton.setTitle(title, for: .normal)
    }
    
    
    //MARK: - Private
    
    private func setupDesign() {
        borderButton.layer.cornerRadius = borderButton.frame.height / 6
        borderButton.layer.borderWidth = 1
        borderButton.layer.borderColor = customColors.blue.cgColor
        borderButton.setTitleColor(customColors.blue, for: .normal)
        //Fix for small screens
        borderButton.titleLabel?.minimumScaleFactor = 0.8
        borderButton.titleLabel?.adjustsFontSizeToFitWidth = true
        borderButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    
}//Class End

//
//  ReusSolidButtonView.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 17.08.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit

//MARK: - Protocols

protocol VolSolidBlueButtonViewDelegate: class {
    func onVolSolidBlueButtonPressed()
}


class VolSolidBlueButtonView: UIView {
    //MARK: - Outlets
    
    @IBOutlet weak var solidButton: UIButton!
    
    
    //MARK: - Delegate
    
    weak var delegate: VolSolidBlueButtonViewDelegate?
    
    
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
        let bundle = Bundle(for: VolSolidBlueButtonView.self)
        let nib = UINib(nibName: "VolSolidBlueButtonView", bundle: bundle)
        let view = nib.instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        addSubview(view)
        setupDesign()
    }
    
    
    //MARK: - Actions
    
    @IBAction func solidButtonPressed(_ sender: UIButton) {
        delegate?.onVolSolidBlueButtonPressed()
    }
    
    
    //MARK: - Public Functions
    
    func setupTitle(title: String) {
        solidButton.setTitle(title, for: .normal)
    }
    
    //MARK: - Private
    
    private func setupDesign() {
        solidButton.layer.cornerRadius = solidButton.frame.height / 6
        solidButton.setTitleColor(.white, for: .normal)
        solidButton.layer.backgroundColor = customColors.blue.cgColor
        //Fix for small screens
        solidButton.titleLabel?.minimumScaleFactor = 0.8
        solidButton.titleLabel?.adjustsFontSizeToFitWidth = true
        solidButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
    
    
}//Class End

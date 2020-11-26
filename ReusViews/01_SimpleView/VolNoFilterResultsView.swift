//
//  VolNoFilterResultsView.swift
//  ekpv2
//
//  Created by Михаил Дмитриев on 14.08.2020.
//  Copyright © 2020 aisa. All rights reserved.
//

import UIKit


class VolNoFilterResultsView: UIView {
    //MARK: - Outlets
    
    
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
        let bundle = Bundle(for: VolNoFilterResultsView.self)
        let nib = UINib(nibName: "VolNoFilterResultsView", bundle: bundle)
        let view = nib.instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        addSubview(view)
    }
    
}//

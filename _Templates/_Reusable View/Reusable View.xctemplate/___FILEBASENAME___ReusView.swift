//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import UIKit

@IBDesignable
class ___VARIABLE_sceneName___ReusView: UIView {
    
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
        let bundle = Bundle(for: ___VARIABLE_sceneName___ReusView.self)
        let nib = UINib(nibName: "___VARIABLE_sceneName___ReusView", bundle: bundle)
        let view = nib.instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        addSubview(view)
    }
}

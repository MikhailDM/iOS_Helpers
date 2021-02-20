//
//  BottomSheetViewController.swift
//  Animations
//
//  Created by Mikhail Dmitriev on 20.02.2021.
//

import UIKit

class BottomSheetViewController: UIViewController {

    var bottomSheet = BottomSheetSubviewViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBottomSheet()
    }
    
    deinit { print("===== Deinited BottomSheetViewController") }

    private func addBottomSheet() {
        self.view.addSubview(bottomSheet.view)
        bottomSheet.view.frame = CGRect(x: 0, y: self.view.frame.maxY, width: view.frame.width, height: view.frame.height)
        bottomSheet.topExpandedPositionY = self.view.frame.minY + 100
        bottomSheet.showBottomSheet()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("===== Main View Button Click")
    }
}

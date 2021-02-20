//
//  BottomSheetViewController.swift
//  Animations
//
//  Created by Mikhail Dmitriev on 20.02.2021.
//

import UIKit

class BottomSheetViewController: UIViewController {

    let transition = BottomSheetSubviewAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBottomSheet()
    }

    private func addBottomSheet() {
        let sheet = BottomSheetSubviewViewController()
        view.addSubview(sheet.view)
        addChild(sheet)
        //didMove(toParent: self)
        sheet.view.translatesAutoresizingMaskIntoConstraints = false
        //sheet.view.frame = view.frame
        sheet.view.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: 0).isActive = true
        sheet.view.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        sheet.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sheet.view.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("===== Parent View Button Click")
    }
    
}

//extension BottomSheetViewController: UIViewControllerTransitioningDelegate {
//    
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        //    transition.originFrame = selectedImage!.superview!.convert(selectedImage!.frame, to: nil)
//        //
//        //    transition.presenting = true
//        //    selectedImage!.isHidden = true
//        
//        return transition
//    }
//    
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.presenting = false
//        return transition
//    }
//}

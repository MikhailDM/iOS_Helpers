//
//  BottomSheetViewController.swift
//  Animations
//
//  Created by Mikhail Dmitriev on 20.02.2021.
//

import UIKit

class BottomSheetViewController: UIViewController {

    let transition = BottomSheetSubviewAnimator()
    var bottomSheet = BottomSheetSubviewViewController()
    var bottomSheetViewTopAnchorWhenClosed: NSLayoutConstraint?
    var bottomSheetViewTopAnchorWhenOpened: NSLayoutConstraint?
    var IsBottomSheetViewOpened = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBottomSheet()
    }
    
    deinit {
        print("===== Deinited BottomSheetViewController")
    }

    private func addBottomSheet() {
        self.addChild(bottomSheet)
        self.view.addSubview(bottomSheet.view)
        bottomSheet.didMove(toParent: self)
        bottomSheet.view.frame = CGRect(x: 0, y: self.view.frame.maxY, width: view.frame.width, height: view.frame.height)
        bottomSheet.topExpandedPositionY = self.view.frame.minY + 100
        bottomSheet.showBottomSheet()
        
        print("===== bottomSheet.topPositionY \(String(describing: bottomSheet.topExpandedPositionY))")
        print("===== bottomSheet.view.frame \(String(describing: bottomSheet.view.frame))")
        print("===== self.view.frame \(String(describing: self.view.frame))")
//        //let sheet = BottomSheetSubviewViewController()
//        view.addSubview(bottomSheetView.view)
//        //addChild(bottomSheetView)
//        //didMove(toParent: self)
//        bottomSheetView.view.translatesAutoresizingMaskIntoConstraints = false
//        //sheet.view.frame = view.frame
//        bottomSheetView.view.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: 0).isActive = true
//        bottomSheetView.view.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
//        bottomSheetView.view.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        //let initialTopAnchor = bottomSheetView.view.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
//        bottomSheetViewTopAnchorWhenClosed = bottomSheetView.view.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
//        bottomSheetViewTopAnchorWhenClosed?.isActive = true
//
//        bottomSheetViewTopAnchorWhenOpened = bottomSheetView.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100)
//        bottomSheetViewTopAnchorWhenOpened?.isActive = false
//
//        //bottomSheetView.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapBottomSheet)))
//        bottomSheetView.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.onTouch(_:))))

    }
    
//    @objc func onTouch(_ sender: UIPanGestureRecognizer) {
//        switch sender.state {
//        case .changed:
//            var newPositionY = view.center.y + sender.translation(in: view).y
//            if newPositionY < view.center.y {
//                //state = .expanded
//            } else {
//                //state = .notExpanded
//            }
//
//            newPositionY = view.center.y + (sender.translation(in: view).y / 5)
//            view.center.y = newPositionY
//            sender.setTranslation(.zero, in: view)
//        case .ended:
//            print("")
//            //moveToDefaultPosition(speed: 0.4, usingSpring: true)
//        default: break
//        }
//    }
    
    @objc func didTapBottomSheet(_ tap: UITapGestureRecognizer) {
        print("==== Tap On Bottom Sheet")
//        UIView.animate(withDuration: 1) { [weak self] in
//            guard let self = self else { return }
//            self.bottomSheetViewTopAnchorWhenClosed?.isActive = self.IsBottomSheetViewOpened ? true : false
//            //self.bottomSheetViewTopAnchorWhenOpened = self.bottomSheetView.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100)
//            self.bottomSheetViewTopAnchorWhenOpened?.isActive = self.IsBottomSheetViewOpened ? false : true
//            self.IsBottomSheetViewOpened.toggle()
//            self.view.layoutIfNeeded()
//            self.bottomSheetView.updateOnOpen()
//        }
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.25, options: .curveEaseInOut) { [weak self] in
            guard let self = self else { return }
            self.bottomSheetViewTopAnchorWhenClosed?.isActive = self.IsBottomSheetViewOpened ? true : false
            //self.bottomSheetViewTopAnchorWhenOpened = self.bottomSheetView.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100)
            self.bottomSheetViewTopAnchorWhenOpened?.isActive = self.IsBottomSheetViewOpened ? false : true
            self.IsBottomSheetViewOpened.toggle()
            self.view.layoutIfNeeded()
            //self.bottomSheetView.updateOnOpen()
        }

        
        //bottomSheetView.modalPresentationStyle = .overFullScreen
//        bottomSheetView.transitioningDelegate = self
//        present(bottomSheetView, animated: true, completion: nil)
        
//      selectedImage = tap.view as? UIImageView
//
//      let index = tap.view!.tag
//      let selectedHerb = herbs[index]
//
//      //present details view controller
//      let herbDetails = storyboard!.instantiateViewController(withIdentifier: "HerbDetailsViewController") as! HerbDetailsViewController
//      herbDetails.herb = selectedHerb
//      herbDetails.modalPresentationStyle = .overFullScreen
//      herbDetails.transitioningDelegate = self
//      present(herbDetails, animated: true, completion: nil)
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        print("===== Parent View Button Click")
    }
    
}

extension BottomSheetViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //    transition.originFrame = selectedImage!.superview!.convert(selectedImage!.frame, to: nil)
        //
        //    transition.presenting = true
        //    selectedImage!.isHidden = true
        
        //return transition
        return nil
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        transition.presenting = false
//        return transition
        return nil
    }
}

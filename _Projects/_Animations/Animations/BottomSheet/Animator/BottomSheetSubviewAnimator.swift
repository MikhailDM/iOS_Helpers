//
//  BottomSheetSubviewAnimator.swift
//  Animations
//
//  Created by Mikhail Dmitriev on 20.02.2021.
//

import UIKit

//class BottomSheetSubviewAnimator: NSObject, UIViewControllerAnimatedTransitioning {
//    private(set) var _expandDuration: Double = 0.3
//    private(set) var _closeDuration: Double = 0.3
//    private(set) var _isNeedToPresent: Bool = true
//    var cellSnapshot: UIView?
//    
//    var originFrame: CGRect = CGRect.zero
//    
//    var dismissCompletionHandler: (() -> Void)?
//    
//    func setNeedsPresent(_ boolValue: Bool) {
//        self._isNeedToPresent = boolValue
//    }
//    
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//        return _isNeedToPresent ? _expandDuration : _closeDuration
//    }
//    
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        let containerView = transitionContext.containerView
//        guard let toView = transitionContext.view(forKey: .to), let detailView = _isNeedToPresent ? toView : transitionContext.view(forKey: .from) else { return }
//        
//        let initialFrame = _isNeedToPresent ? originFrame : detailView.frame
//        let finalFrame = _isNeedToPresent ? detailView.frame : originFrame
//        
//        let scaleX = _isNeedToPresent ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
//        let scaleY = _isNeedToPresent ? initialFrame.height / finalFrame.height : finalFrame.height / initialFrame.height
//        
//        let scaleTransform = CGAffineTransform(scaleX: scaleX, y: scaleY)
//        
//        if _isNeedToPresent {
//            detailView.transform = scaleTransform
//            detailView.center = CGPoint( x: initialFrame.midX, y: initialFrame.midY)
//            detailView.clipsToBounds = true
//        }
//        containerView.addSubview(toView)
//        containerView.bringSubviewToFront(detailView)
//        
//        if _isNeedToPresent {
//            UIView.animate(withDuration: _expandDuration, animations: {
//                detailView.transform = CGAffineTransform.identity
//                detailView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
//            }) { _ in
//                transitionContext.completeTransition(true)
//            }
//        } else {
//            //            let tb = (detailView.subviews.filter { $0 is UITableView }.first) as? UITableView
//            //            let cell = tb?.cellForRow(at: IndexPath(row: 0, section: 0))
//            //
//            //            let img = (cell as? NewsDetailImageTableViewCell)?.detailImageView
//            UIView.animate(withDuration: _closeDuration, animations: {
//                detailView.transform = scaleTransform
//                detailView.alpha = 0.1
//                detailView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
//            }) { _ in
//                if !self._isNeedToPresent {
//                    self.dismissCompletionHandler?()
//                }
//                transitionContext.completeTransition(true)
//            }
//        }
//    }
//}

/*
 private(set) var _expandDuration: Double = 0.3
 private(set) var _closeDuration: Double = 0.3
 private(set) var _isNeedToPresent: Bool = true
 var cellSnapshot: UIView?
 
 var originFrame: CGRect = CGRect.zero
 
 var dismissCompletionHandler: (() -> Void)?
 
 func setNeedsPresent(_ boolValue: Bool) {
 self._isNeedToPresent = boolValue
 }
 
 func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
 return _isNeedToPresent ? _expandDuration : _closeDuration
 }
 
 func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
 let containerView = transitionContext.containerView
 guard let toView = transitionContext.view(forKey: .to), let detailView = _isNeedToPresent ? toView : transitionContext.view(forKey: .from) else { return }
 
 let initialFrame = _isNeedToPresent ? originFrame : detailView.frame
 let finalFrame = _isNeedToPresent ? detailView.frame : originFrame
 
 let scaleX = _isNeedToPresent ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
 let scaleY = _isNeedToPresent ? initialFrame.height / finalFrame.height : finalFrame.height / initialFrame.height
 
 let scaleTransform = CGAffineTransform(scaleX: scaleX, y: scaleY)
 
 if _isNeedToPresent {
 detailView.transform = scaleTransform
 detailView.center = CGPoint( x: initialFrame.midX, y: initialFrame.midY)
 detailView.clipsToBounds = true
 }
 containerView.addSubview(toView)
 containerView.bringSubviewToFront(detailView)
 
 if _isNeedToPresent {
 UIView.animate(withDuration: _expandDuration, animations: {
 detailView.transform = CGAffineTransform.identity
 detailView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
 }) { _ in
 transitionContext.completeTransition(true)
 }
 } else {
 //            let tb = (detailView.subviews.filter { $0 is UITableView }.first) as? UITableView
 //            let cell = tb?.cellForRow(at: IndexPath(row: 0, section: 0))
 //
 //            let img = (cell as? NewsDetailImageTableViewCell)?.detailImageView
 UIView.animate(withDuration: _closeDuration, animations: {
 detailView.transform = scaleTransform
 detailView.alpha = 0.1
 detailView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
 }) { _ in
 if !self._isNeedToPresent {
 self.dismissCompletionHandler?()
 }
 transitionContext.completeTransition(true)
 }
 }
 }
 */

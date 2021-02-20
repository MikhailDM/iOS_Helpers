//
//  BottomSheetSubviewAnimator.swift
//  Animations
//
//  Created by Mikhail Dmitriev on 20.02.2021.
//

import UIKit

class BottomSheetSubviewAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 1.0
    var presenting = true
    var originFrame = CGRect.zero
    
    var dismissCompletion: (()->Void)?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        let containerView = transitionContext.containerView
//        let herbView = presenting ? transitionContext.view(forKey: .to)! : transitionContext.view(forKey: .from)!
//
//        let initialFrame = presenting ? originFrame : herbView.frame
//        let finalFrame = presenting ? herbView.frame : originFrame
//
//        let xScaleFactor = presenting ?
//            initialFrame.width / finalFrame.width :
//            finalFrame.width / initialFrame.width
//
//        let yScaleFactor = presenting ?
//            initialFrame.height / finalFrame.height :
//            finalFrame.height / initialFrame.height
//
//        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
//
//        if presenting {
//            herbView.transform = scaleTransform
//            herbView.center = CGPoint(
//                x: initialFrame.midX,
//                y: initialFrame.midY)
//            herbView.clipsToBounds = true
//            herbView.layer.cornerRadius = 20.0 / xScaleFactor
//        }
//
//        if let toView = transitionContext.view(forKey: .to) {
//            containerView.addSubview(toView)
//        }
//        containerView.bringSubviewToFront(herbView)
//
//        let herbController = transitionContext.viewController(
//            forKey: presenting ? .to : .from
//        ) as! BottomSheetViewController
//
//        if presenting {
//            herbController.containerView.alpha = 0.0
//        }
//
//        UIView.animate(withDuration: duration, delay:0.0, usingSpringWithDamping: 0.4,
//                       initialSpringVelocity: 0.0,
//                       animations: {
//                        herbView.transform = self.presenting ? CGAffineTransform.identity : scaleTransform
//                        herbView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
//                        herbController.containerView.alpha = self.presenting ? 1.0 : 0.0
//                        herbView.layer.cornerRadius = self.presenting ? 0.0 : 20.0/xScaleFactor
//                       }, completion: { _ in
//                        if !self.presenting {
//                            self.dismissCompletion?()
//                        }
//                        transitionContext.completeTransition(true)
//                       })
    }
}

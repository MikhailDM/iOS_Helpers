//
//  BottomSheetSubviewViewController.swift
//  Animations
//
//  Created by Mikhail Dmitriev on 20.02.2021.
//

import UIKit

class BottomSheetSubviewViewController: UIViewController {
    //MARK: - Properties
    var topExpandedPositionY: CGFloat!
    var state: BottomSheetState = .notExpanded
    var isFirstLaunch = true
    
    enum BottomSheetState {
        case expanded
        case notExpanded
    }
    
    var expandPosition: CGFloat {
        switch state {
        case .expanded: return topExpandedPositionY
        case .notExpanded: return self.view.frame.height - 40
            //case .notExpanded: return self.view.frame.height - (self.tableView.frame.minY)
        }
    }
    
    //MARK: - Services
    let animator = BottomSheetSubviewAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
        view.layer.cornerRadius = 10
    }
    
    deinit {
        print("===== Deinited BottomSheetSubviewViewController")
    }
    
    @IBAction func childButtonClick(_ sender: UIButton) {
        print("===== Child View Button Click")
    }
    
    func updateOnOpen() {
        print("==== Bottom Sheet Update")
    }
    //MARK: - public methods
    public func showBottomSheet() {
        self.view.layoutSubviews()
        moveToDefaultPosition(speed: 0.5, usingSpring: false)
    }
}

private extension BottomSheetSubviewViewController {
    
    private func moveToDefaultPosition(speed: Float, usingSpring: Bool) {
        UIView.animate(withDuration: TimeInterval(speed), delay: 0, usingSpringWithDamping: usingSpring ? 0.8 : 1, initialSpringVelocity: 5, options: .curveEaseInOut, animations: { [weak self] in
            guard let self = self else { return }
            self.view.frame = CGRect(x: 0,
                                     y: self.expandPosition,
                                     width: self.view.frame.width,
                                     height: self.view.frame.height)
        }) { _ in
            if self.isFirstLaunch && self.state == .expanded {
                //self.presenter?.loadData()
                self.isFirstLaunch = false
            }
        }
        if self.state == .notExpanded {
            //let indexPath = IndexPath(row: 0, section: 0)
            //self.tableView.scrollToRow(at: indexPath, at: .none, animated: true)
        }
    }
    
    private func addGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.onTouch(_:)))
        self.view.addGestureRecognizer(panGesture)
    }
}


//MARK: - @objc methods
@objc extension BottomSheetSubviewViewController {
    
    @objc func onTouch(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            var newPositionY = view.center.y + sender.translation(in: view).y
            if newPositionY < view.center.y {
                state = .expanded
            } else {
                state = .notExpanded
            }
            
            newPositionY = view.center.y + (sender.translation(in: view).y / 5)
            view.center.y = newPositionY
            sender.setTranslation(.zero, in: view)
        case .ended:
            moveToDefaultPosition(speed: 0.4, usingSpring: true)
        default: break
        }
    }
    
}

//MARK: - Presenter output (PRESENTER -> VIEW)
extension BottomSheetSubviewViewController {
//    func showData(_ viewModel: BottomSheetModels.ViewModel) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.tableView.setData(viewModel)
//            self.tableView.isUserInteractionEnabled = true
//        }
//    }
}

//MARK: - TableView Header Click all Button delegate
//extension BottomSheetSubviewViewController: BottomFeedTableViewClickDelegate {
//
//    func onHeaderAllButtonClick(cellType: BottomFeedCellType) {
//        switch cellType {
//        case .main: break
//        case .news: self.onAllNewsClickCompletion?()
//        case .notifications: self.onAllNotificationsClickCompletion?()
//        }
//    }
//
//    func onNewsItemClick(id: Int, cell: UICollectionViewCell) {
////        selectedCell = cell
////        selectedCellShapshot = (selectedCell as? BottomFeedNewsCollectionViewCell)?.newsImage.snapshotView(afterScreenUpdates: false)
////        let storyboard = UIStoryboard(name: "DetailNewsViewController", bundle: nil)
////        let vc = storyboard.instantiateViewController(withIdentifier: "DetailController") as! NewsDetailViewController
////        vc.newsId = id
////        vc.transitioningDelegate = self
////        navigationController?.pushViewController(vc, animated: true)
//        self.onAllNewsDetailClickCompletion?(id)
//    }
//
//    func onNotifiationItemClick(id: Int, cell: UICollectionViewCell) { }
//}

//MARK: - Transition animation
extension BottomSheetSubviewViewController: UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //let animator = presenter?.transitionAnimator
        
        if operation == .push {
            //guard let selectedCell = self.selectedCell, let originFrame = selectedCell.superview?.convert(selectedCell.frame, to: nil) else { return animator }
//            animator.cellSnapshot = selectedCellShapshot
//            animator.originFrame = originFrame
//            animator.setNeedsPresent(true)
//            selectedCell.alpha = 0
//            animator.cellSnapshot = selectedCell
            return animator
        } else {
            animator.setNeedsPresent(false)
            return animator
        }
    }
}

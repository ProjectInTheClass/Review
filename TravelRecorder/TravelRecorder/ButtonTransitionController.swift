//
//  ButtonTransitionController.swift
//  TravelRecorder
//
//  Created by 임예진 on 2017. 2. 14..
//  Copyright © 2017년 owlsogul. All rights reserved.
//

import UIKit

class ButtonTransitionController: NSObject {

    var rectangle = UIView()
    
    var startingPoint = CGPoint.zero {
        didSet {
            rectangle.center = startingPoint
        }
    }
    
    var recColor = UIColor.white
    
    var duration = 0.3
    
    enum RecTransitionMode:Int {
        case present, dismiss, pop
    }
    
    var transitionMode:RecTransitionMode = .present
}

extension ButtonTransitionController:UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        if transitionMode == .present {
            if let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to){
                let viewCenter = presentedView.center
                let viewSize = presentedView.frame.size
                
                rectangle = UIView()
                
                rectangle.frame = frameForRectangle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
                
                rectangle.layer.cornerRadius = rectangle.frame.size.height / 2
                rectangle.center = startingPoint
                rectangle.backgroundColor = recColor
                rectangle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                containerView.addSubview(rectangle)
                
                
                presentedView.center = startingPoint
                presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                presentedView.alpha = 0
                containerView.addSubview(presentedView)
                
                UIView.animate(withDuration: duration, animations: { 
                    self.rectangle.transform = CGAffineTransform.identity
                    presentedView.transform = CGAffineTransform.identity
                    presentedView.alpha = 1
                    presentedView.center = viewCenter
                    
                }, completion: { (success:Bool) in
                    transitionContext.completeTransition(success)
                })
            }
            
        } else {
            
            let transitionModeKey = (transitionMode == .pop) ? UITransitionContextViewKey.to : UITransitionContextViewKey.from
            
            if let returningView = transitionContext.view(forKey: transitionModeKey) {
                
                let viewCenter = returningView.center
                let viewSize = returningView.frame.size
                
                rectangle.frame = frameForRectangle(withViewCenter: viewCenter, size: viewSize, startPoint: startingPoint)
                
                rectangle.layer.cornerRadius = rectangle.frame.size.height / 2
                rectangle.center = startingPoint
                
                UIView.animate(withDuration: duration, animations: { 
                    self.rectangle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningView.center = self.startingPoint
                    returningView.alpha = 0
                    
                    if self.transitionMode == .pop {
                        containerView.insertSubview(returningView, belowSubview: returningView)
                        containerView.insertSubview(self.rectangle, belowSubview: returningView)
                    }
                }, completion: {    (success:Bool) in
                    
                    returningView.center = viewCenter
                    returningView.removeFromSuperview()
                    
                    self.rectangle.removeFromSuperview()
                    
                    transitionContext.completeTransition(success)
                    
                })
                
            }
            
        }
        
    }
    
    func frameForRectangle (withViewCenter viewCenter:CGPoint, size viewSize:CGSize, startPoint:CGPoint) -> CGRect{
        
        let xLength = fmax(startPoint.x, viewSize.width - startPoint.x)
        let yLength = fmax(startPoint.y, viewSize.height - startPoint.y)
        
        let offestVector = sqrt(xLength * xLength + yLength * yLength) * 2
        let size = CGSize(width: offestVector, height: offestVector)
        
        return CGRect(origin: CGPoint.zero, size: size)
        
    }
    
}

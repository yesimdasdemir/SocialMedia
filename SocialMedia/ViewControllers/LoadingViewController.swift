//
//  LoadingViewController.swift
//  SocialMedia
//
//  Created by Yeşim Daşdemir on 1.12.2021.
//

import UIKit

final class LoadingViewController: UIViewController {
    static let shared = LoadingViewController()
    
    var loadingActivityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        
        indicator.style = .medium
        indicator.color = .white
        indicator.startAnimating()
        
        indicator.autoresizingMask = [
            .flexibleLeftMargin, .flexibleRightMargin,
            .flexibleTopMargin, .flexibleBottomMargin
        ]
        
        return indicator
    }()
    
    var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.alpha = 0.8
        blurEffectView.autoresizingMask = [
            .flexibleWidth, .flexibleHeight
        ]
        
        return blurEffectView
    }()
    
     func showLoading() {
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)

        blurEffectView.frame = self.view.bounds
        view.insertSubview(blurEffectView, at: 0)

        loadingActivityIndicator.center = CGPoint(
            x: view.bounds.midX,
            y: view.bounds.midY
        )
        view.addSubview(loadingActivityIndicator)
         
         modalPresentationStyle = .overCurrentContext
         modalTransitionStyle = .crossDissolve
         
         AlertUtils.shared.presentAlert(alert: self, animated: false)
    }
    
    func hideLoading() {
        AlertUtils.shared.popAlert(alert: self)
    }
}

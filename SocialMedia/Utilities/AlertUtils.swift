//
//  AlertUtils.swift
//  SocialMedia
//
//  Created by Yeşim Daşdemir on 30.11.2021.
//

import UIKit

class AlertUtils {
    static let shared = AlertUtils()
    
    func showAlert(title: String?, message: String?) {
        
        let alert = UIAlertController(title: title ?? "",
                                      message: message ?? "",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
    }
    
    func presentAlert(alert: UIViewController, animated: Bool = true) {
        getRootViewController().present(alert, animated: animated)
    }
    
    func popAlert(alert: UIViewController, animated: Bool = true) {
        
        getRootViewController().dismiss(animated: true, completion: nil)
        
    }
    
    private func getRootViewController() -> UIViewController {
        if var viewController = UIApplication.shared.windows.first?.rootViewController {
            if let presentedViewController = viewController.presentedViewController {
                viewController = presentedViewController
            } else if let presentingViewController = viewController.presentingViewController {
                viewController = presentingViewController
            }
            return viewController
        }
        return UIViewController()
    }
}

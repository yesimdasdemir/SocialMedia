//
//  NetworkManager.swift
//  SocialMedia
//
//  Created by Yeşim Daşdemir on 22.11.2021.
//s

import UIKit
import Foundation

struct NetworkManager {
    
    static func fetchData<T: Codable>(url : String, completion : @escaping (T) -> ()) {
        guard NetworkMonitor.shared.isConnected else {
            AlertUtils.shared.showAlert(title: "Error", message: "No connection.")
            NetworkMonitor.shared.stopMonitoring()
            return
        }

        let sessionURL = URL(string: url)
        let session = URLSession.shared
        
        if let url = sessionURL {
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(okButton)
                    
                } else {
                    
                    if let data = data {
                        
                        do {
                            let response = try JSONDecoder().decode(T.self, from: data)
                            DispatchQueue.main.async {
                             //   LoadingViewController.shared.hideLoading()
                                completion(response)
                                debugPrint(response)
                            }
                            
                        } catch  {
                            debugPrint(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

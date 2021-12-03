//
//  NetworkMonitor.swift
//  SocialMedia
//
//  Created by Yeşim Daşdemir on 30.11.2021.
//

import UIKit
import Network

final class NetworkMonitor {
    
    init() {
        startMonitoring()
    }
    
    static let shared = NetworkMonitor()

    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachableOnCellular: Bool = true
    
    var isConnected: Bool = true
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive
            
            self?.isConnected = path.status == .satisfied
            
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}

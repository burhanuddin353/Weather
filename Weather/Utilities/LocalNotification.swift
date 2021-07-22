//
//  LocalNotification.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 21/07/21.
//

import UIKit

extension UNNotificationRequest {
    
    static func request(for title: String, message: String) -> UNNotificationRequest {

        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(
            identifier: uuidString,
            content: content,
            trigger: nil
        )
        return request
    }
    
    func notify() {
        UNUserNotificationCenter.current().add(self)
    }
}

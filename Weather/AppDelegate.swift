//
//  AppDelegate.swift
//  Weather
//
//  Created by Burhanuddin Sunelwala on 19/07/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.sound, .alert]) { _, _ in }
        
        return true
    }
}

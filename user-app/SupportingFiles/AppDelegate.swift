//
//  AppDelegate.swift
//  user-app
//
//  Created by Hema M on 29/03/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.setupRootView()
        return true
    }

    // MARK: - Setup Root View
    
    fileprivate func setupRootView() {
        
        let vc = UserListRouter.createModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }

}


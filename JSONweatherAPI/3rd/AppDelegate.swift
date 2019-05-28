//
//  AppDelegate.swift
//  JSONweatherAPI
//
//  Created by Admin on 5/24/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = HomeViewController.init(nibName: "HomeViewController", bundle: nil)
        let navigations = UINavigationController(rootViewController: vc)
        navigations.isNavigationBarHidden = true
        window?.rootViewController = navigations
        window?.makeKeyAndVisible()
        return true
    }
    

}


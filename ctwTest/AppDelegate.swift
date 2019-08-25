//
//  AppDelegate.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navc = UINavigationController(rootViewController: LocationListConfigurator().configure())
        window!.rootViewController = navc
        window!.makeKeyAndVisible()
        return true
    }


}


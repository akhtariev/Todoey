//
//  AppDelegate.swift
//  Todoey
//
//  Created by Roman Akhtariev on 2018-07-27.
//  Copyright © 2018 Roman Akhtariev. All rights reserved.
//

import UIKit
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            let _ = try Realm()
        } catch {
            print("Error initializing new Realm, \(error)")
        }
        return true
    }



    

    
    

}


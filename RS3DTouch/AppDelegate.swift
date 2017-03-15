//
//  AppDelegate.swift
//  RS3DTouch
//
//  Created by Ravikumar Shah on 2/28/17.
//  Copyright © 2017 Ravi Shah. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.addShortcuts(application: application);
        return true
    }
    
    func addShortcuts(application:UIApplication) {
        let shortcut2 = UIMutableApplicationShortcutItem(type: "SearchDoc",
                                                         localizedTitle: "Search",
                                                         localizedSubtitle: "Search document",
                                                         icon: UIApplicationShortcutIcon(type: .search),
                                                         userInfo: nil);
        
        let shortcut3 = UIMutableApplicationShortcutItem(type: "UpdateDoc", localizedTitle: "Update",
                                                         localizedSubtitle: "Update document",
                                                         icon: UIApplicationShortcutIcon(type: .update),
                                                         userInfo: nil);
        
        application.shortcutItems = [shortcut2, shortcut3];
//        self.updateItem(application: application);
    }
    
    func removeShortcut(application:UIApplication) {
        application.shortcutItems = [];
    }
    
    func updateItem(application:UIApplication) {
        var shortcuts = application.shortcutItems
        
        let shortcut4 = UIMutableApplicationShortcutItem(type: "SendDoc", localizedTitle: "Send",
                                                         localizedSubtitle: "Send document",
                                                         icon: UIApplicationShortcutIcon(type: .share),
                                                         userInfo: nil);

        
        shortcuts![0] = shortcut4
        application.shortcutItems = shortcuts
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}


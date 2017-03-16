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
        let shortcut4 = UIMutableApplicationShortcutItem(type: "SendDoc", localizedTitle: "Send",
                                                         localizedSubtitle: "Send document",
                                                         icon: UIApplicationShortcutIcon(type: .share),
                                                         userInfo: nil);
        
        application.shortcutItems = [shortcut2, shortcut3, shortcut4];
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
    
    // Quick action selection
    
    /*
     Called when the user activates your application by selecting a shortcut on the home screen, except when
     application(_:,willFinishLaunchingWithOptions:) or application(_:didFinishLaunchingWithOptions) returns `false`.
     You should handle the shortcut in those callbacks and return `false` if possible. In that case, this
     callback is used if your application is already launched in the background.
     */
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let handledShortCutItem = handleShortCutItem(shortcutItem: shortcutItem)
        
        completionHandler(handledShortCutItem)
    }
    
    func handleShortCutItem(shortcutItem: UIApplicationShortcutItem) -> Bool {
        var handle = false;
        // gurad to see if the shortcutItem type is string
        guard let shortCutType = shortcutItem.type as String? else { return false }
        
        switch (shortCutType) {
        case "Compose":
            // Handle shortcut 1 (static).
            handle = true;
            break
        case "Search":
            // Handle shortcut 2 (dynamic).
            handle = true;
            break
        case "Update":
            // Handle shortcut 3 (dynamic).
            handle = true;
            break
        case "Send":
            // Handle shortcut 4 (dynamic).
            handle = true;
            break
        default:
            break
        }
        self.showAlert(message: shortcutItem.localizedTitle)
        return handle;
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Quick Action",
                                                message: message + " Document",
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        
        alertController.addAction(okAction)
        
        window!.rootViewController?.present(alertController,
                                            animated: true, completion: nil)
    }
    
}




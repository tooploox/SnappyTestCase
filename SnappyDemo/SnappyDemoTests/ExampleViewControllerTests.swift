//
//  Created by Przemysław Stasiak on 16.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import UIKit
import SnappyTestCase
import FBSnapshotTestCase
@testable import SnappyDemo

class ExampleViewControllerTests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    func testAllDevices() {
        let window = UIWindow()
        window.makeKeyAndVisible()
        window.rootViewController = ExampleViewController(nibName: nil, bundle: nil)
        verifyViewSnaps(DeviceRack.iPhone.all, view: window)
    }
    
    func testAllWidths() {
        let window = UIWindow()
        window.makeKeyAndVisible()
        window.rootViewController = ExampleViewController(nibName: nil, bundle: nil)
        verifyViewSnaps(
            DeviceRack.iPhone.all.landscape.uniqueWidths + DeviceRack.iPhone.all.portrait.uniqueWidths,
            view: window
        )
    }
    
    func testInNavigationStack() {
        let window = UIWindow()
        window.makeKeyAndVisible()
        
        let navigationController = UINavigationController(
            rootViewController: ExampleViewController(nibName: nil, bundle: nil)
        )
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.barTintColor = .groupTableViewBackground
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [navigationController]
        tabBarController.tabBar.isTranslucent = false
        tabBarController.tabBar.barTintColor = .groupTableViewBackground
        
        window.rootViewController = tabBarController
        verifyViewSnaps(DeviceRack.iPhone.all, view: window)
    }
}

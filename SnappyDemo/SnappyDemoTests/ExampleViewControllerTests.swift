//
//  Created by Przemysław Stasiak on 16.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import UIKit
import Snappy
import FBSnapshotTestCase
@testable import SnappyDemo

class ExampleViewControllerTests: FBSnapshotTestCase {

    let window = UIWindow()
    
    override func setUp() {
        super.setUp()
        window.makeKeyAndVisible()
        recordMode = false
    }
    
    func testAllDevices() {
        window.rootViewController = ExampleViewController(nibName: nil, bundle: nil)
        verifyViewSnaps(DeviceRack.iPhone.all, view: window)
    }
    
    func testAllWidths() {
        window.rootViewController = ExampleViewController(nibName: nil, bundle: nil)
        verifyViewSnaps(
            DeviceRack.iPhone.all.landscape.uniqueWidths + DeviceRack.iPhone.all.portrait.uniqueWidths,
            view: window
        )
    }
    
    func testInNavigationStack() {
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

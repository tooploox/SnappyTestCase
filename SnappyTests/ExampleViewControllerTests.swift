//
//  Created by Przemysław Stasiak on 16.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import UIKit
@testable import Snappy

class ExampleViewControllerTests: SnappyTestCase {
    
    let window = UIWindow()

    override func setUp() {
        super.setUp()
        recordMode = false
    }
    
    func testAllDevices() {
        window.rootViewController = ExampleViewController(nibName: nil, bundle: nil)
        window.makeKeyAndVisible()
        verifyViewSnaps(DeviceRack.iPhone.all, view: window)
    }
    
    func testAllWidths() {
        window.rootViewController = ExampleViewController(nibName: nil, bundle: nil)
        window.makeKeyAndVisible()
        verifyViewSnaps(DeviceRack.iPhone.allWidths, view: window)
    }
    
}

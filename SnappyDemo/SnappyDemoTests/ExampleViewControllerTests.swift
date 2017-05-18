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
        window.rootViewController = ExampleViewController(nibName: nil, bundle: nil)
        window.makeKeyAndVisible()
        recordMode = false
    }
    
    func testAllDevices() {
        verifyViewSnaps(DeviceRack.iPhone.all, view: window)
    }
    
    func testAllWidths() {
        verifyViewSnaps(
            DeviceRack.iPhone.all.landscape.uniqueWidths + DeviceRack.iPhone.all.portrait.uniqueWidths,
            view: window
        )
    }
}

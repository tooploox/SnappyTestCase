//
//  Created by Przemysław Stasiak on 16.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import UIKit

public struct DeviceRack {
    
    public struct iPhone {
        
        static let screen3_5 = DeviceInfo(
            portraitScreenSize: CGSize(width: 320.0, height: 480.0),
            name: "iPhone 3,5\"",
            scale: 2.0
        )
        
        static let screen4_0 = DeviceInfo(
            portraitScreenSize: CGSize(width: 320.0, height: 568.0),
            name: "iPhone 4\"",
            scale: 2.0
        )
        
        static let screen4_7 = DeviceInfo(
            portraitScreenSize: CGSize(width: 375.0, height: 667.0),
            name: "iPhone 4,7\"",
            scale: 2.0
        )
        
        static let screen5_5 = DeviceInfo(
            portraitScreenSize: CGSize(width: 414.0, height: 736.0),
            name: "iPhone 5,5\"",
            scale: 3.0
        )
        
        static let all: [DeviceInfo] = [
            DeviceRack.iPhone.screen3_5,
            DeviceRack.iPhone.screen4_0,
            DeviceRack.iPhone.screen4_7,
            DeviceRack.iPhone.screen5_5
        ]
        
        static let allWidths: [DeviceInfo] = [
            DeviceRack.iPhone.screen4_0,
            DeviceRack.iPhone.screen4_7,
            DeviceRack.iPhone.screen5_5
        ]
    }
}

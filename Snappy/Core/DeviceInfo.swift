//
//  Created by Przemysław Stasiak on 16.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import UIKit

public struct DeviceInfo {
    
    let screenSize: CGSize
    let name: String
}

extension DeviceInfo: Snap {
    
    public var identifier: String {
        return name
    }
    
    public var frameSize: CGSize {
        return screenSize
    }
}

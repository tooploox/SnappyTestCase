//
//  Created by Przemysław Stasiak on 16.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import UIKit

public struct DeviceInfo {
    
    public let screenSize: CGSize
    public let name: String
    public let scale: CGFloat
    
    init(screenSize: CGSize, name: String, scale: CGFloat = UIScreen.main.scale) {
        self.screenSize = screenSize
        self.name = name
        self.scale = scale
    }
}

extension DeviceInfo: Snap {
    
    public var identifier: String {
        return name
    }
    
    public var frameSize: CGSize {
        return screenSize
    }
}

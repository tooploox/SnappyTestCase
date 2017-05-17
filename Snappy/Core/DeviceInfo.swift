//
//  Created by Przemysław Stasiak on 16.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import UIKit

public struct DeviceInfo {
    
    public enum Orientation: String {
        case portrait = "Portrait"
        case landscape = "Landscape"
    }
    
    public let portraitScreenSize: CGSize
    public let name: String
    public let scale: CGFloat
    public let orientation: Orientation
    
    init(portraitScreenSize: CGSize, name: String, scale: CGFloat = UIScreen.main.scale, orientation: Orientation = .portrait) {
        self.portraitScreenSize = portraitScreenSize
        self.name = name
        self.scale = scale
        self.orientation = orientation
    }
    
    public var landscape: DeviceInfo {
        return withOrientation(.landscape)
    }
    
    public var portrait: DeviceInfo {
        return withOrientation(.portrait)
    }
    
    private func withOrientation(_ newOrientation: Orientation) -> DeviceInfo {
        return DeviceInfo(
            portraitScreenSize: portraitScreenSize,
            name: name,
            scale: scale,
            orientation: newOrientation
        )
    }
}

extension DeviceInfo: Snap {
    
    public var identifier: String {
        return "\(name)_\(orientation.rawValue)"
    }
    
    public var frameSize: CGSize {
        return orientation == .portrait ? portraitScreenSize :
            CGSize(width: portraitScreenSize.height, height: portraitScreenSize.width)
    }
}

extension Sequence where Iterator.Element == DeviceInfo {
    
    public var landscape: [DeviceInfo] {
        return map { $0.landscape }
    }
    
    public var portrait: [DeviceInfo] {
        return map { $0.portrait }
    }
}

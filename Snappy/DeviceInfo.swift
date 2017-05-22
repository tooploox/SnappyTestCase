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
    
    public var landscapeScreenSize: CGSize {
        return CGSize(width: portraitScreenSize.height, height: portraitScreenSize.width)
    }
    
    public var orientedScreenSize: CGSize {
        return orientation == .portrait ? portraitScreenSize : landscapeScreenSize
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

extension Sequence where Iterator.Element == DeviceInfo {
    
    public var landscape: [DeviceInfo] {
        return map { $0.landscape }
    }
    
    public var portrait: [DeviceInfo] {
        return map { $0.portrait }
    }
    
    public var uniqueWidths: [DeviceInfo] {
        return unique{ (lhs, rhs) -> Bool in
            lhs.orientedScreenSize.width == rhs.orientedScreenSize.width
        }
    }
    
    public var uniqueHeights: [DeviceInfo] {
        return unique{ (lhs, rhs) -> Bool in
            lhs.orientedScreenSize.height == rhs.orientedScreenSize.height
        }
    }
    
    func unique(_ equalityTest: (DeviceInfo, DeviceInfo) -> Bool) -> [DeviceInfo] {
        var unique = [DeviceInfo]()
        for info in self {
            if !unique.contains(where: { equalityTest($0, info) }) {
                unique.append(info)
            }
        }
        return unique
    }
    
}

extension DeviceInfo: Snap {
    
    public var identifier: String {
        return "\(name)_\(orientation.rawValue)"
    }
    
    public var frameSize: CGSize {
        return orientedScreenSize
    }
    
    public var deviceOrientation: UIDeviceOrientation {
        switch orientation {
        case .portrait:
            return .portrait
        case .landscape:
            return .landscapeLeft
        }
    }
}

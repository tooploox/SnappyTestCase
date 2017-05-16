//
//  Created by Przemysław Stasiak on 16.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import UIKit

public protocol Snap {
    var identifier: String { get }
    var frameSize: CGSize { get }
}

//
//  Created by Przemysław Stasiak on 18.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import XCTest
import SnappyTestCase
import FBSnapshotTestCase
@testable import SnappyDemo

class ExampleTableViewCellTests: FBSnapshotTestCase {
    
    let container = UIWindow()
    lazy var cell: ExampleTableViewCell = {
        let nib = UINib(nibName: String(describing: ExampleTableViewCell.self), bundle: Bundle.main)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! ExampleTableViewCell
        view.bounds = CGRect(
            origin: .zero,
            size: CGSize(
                width: self.container.bounds.size.width,
                height: 80.0
            )
        )
        view.autoresizingMask = [.flexibleWidth]
        view.backgroundColor = .white
        return view
    }()
    
    override func setUp() {
        super.setUp()
        recordMode = false
        
        container.makeKeyAndVisible()
        container.addSubview(cell)
    }
    
    func testAllWidths() {
        verifyViewSnaps(DeviceRack.iPhone.all.portrait.uniqueWidths, view: cell, container: container)
    }
}

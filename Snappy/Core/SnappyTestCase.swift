//
//  Created by Przemysław Stasiak on 16.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import XCTest
import FBSnapshotTestCase

class SnappyTestCase: FBSnapshotTestCase {
    
    public func verifyViewSnaps(_ snaps: [Snap], view: UIView, container: UIView? = nil, file: StaticString = #file, line: UInt = #line) {
        let frameView = container == nil ? view : container!
        var messages = [String]()
        for snap in snaps {
            UIScreen.main.setValue(snap.scale, forKeyPath:"scale")
            frameView.frame.size = snap.frameSize
            frameView.setNeedsLayout()
            frameView.layoutIfNeeded()
            if let msg = snapshotVerifyViewOrLayer(
                view,
                identifier: snap.identifier,
                suffixes: FBSnapshotTestCaseDefaultSuffixes(),
                tolerance: 0.0
            ) {
                if !messages.contains(msg) {
                    messages.append(msg)
                }
            }
        }
        if !messages.isEmpty {
            XCTFail(combinedPartialMessages(messages), file: file, line: line)
        }
    }
    
    func combinedPartialMessages(_ messages: [String]) -> String {
        var combined = ""
        for msg in messages {
            combined.append(msg)
            combined.append(";")
        }
        return combined
    }
    
}

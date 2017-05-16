//
//  Created by Przemysław Stasiak on 16.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import XCTest
import FBSnapshotTestCase

class SnappyTestCase: FBSnapshotTestCase {
    
    public func verifyViewSnaps(_ snaps: [Snap], view: UIView, container: UIView? = nil) {
        let frameView = container == nil ? view : container!
        var messages = [String]()
        for snap in snaps {
            frameView.frame.size = snap.frameSize
            frameView.setNeedsLayout()
            frameView.layoutIfNeeded()
            if let msg = snapshotVerifyViewOrLayer(
                view,
                identifier: snap.identifier,
                suffixes: FBSnapshotTestCaseDefaultSuffixes(),
                tolerance: 0.0
            ) {
                messages.append(msg)
            }
        }
        if !messages.isEmpty {
            XCTFail(combinedPartialMessages(messages))
        }
    }
    
    func combinedPartialMessages(_ messages: [String]) -> String {
        var combined = ""
        for msg in messages {
            combined.append(msg)
        }
        return combined
    }
    
}

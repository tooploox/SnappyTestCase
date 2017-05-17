//
//  Created by Przemysław Stasiak on 16.05.2017.
//  Copyright © 2017 Tooploox. All rights reserved.
//

import XCTest
import FBSnapshotTestCase

extension FBSnapshotTestCase {
    
    struct SnapVerifyError {
        
        let message: String
        var snaps: [Snap]
        
        var description: String {
            return "\(message) (\(snaps.map { $0.identifier }.joined(separator: ", ")))"
        }
    }
    
    public func verifyViewSnaps(_ snaps: [Snap], view: UIView, container: UIView? = nil, file: StaticString = #file, line: UInt = #line) {
        let frameView = container == nil ? view : container!
        var errors = [SnapVerifyError]()
        for snap in snaps {
            UIScreen.main.setValue(snap.scale, forKeyPath:"scale")
            frameView.frame.size = snap.frameSize
            frameView.setNeedsLayout()
            frameView.layoutIfNeeded()
            if var msg = snapshotVerifyViewOrLayer(
                view,
                identifier: snap.identifier,
                suffixes: FBSnapshotTestCaseDefaultSuffixes(),
                tolerance: 0.0
            ) {
                if recordMode {
                    msg = "Test ran in record mode. Reference image is now saved. Disable record mode to perform an actual snapshot comparison!"
                }
                if let existingIndex = errors.index(where: { $0.message == msg }) {
                    errors[existingIndex].snaps.append(snap)
                } else {
                    errors.append(SnapVerifyError(message: msg, snaps: [snap]))
                }
            }
        }
        if !errors.isEmpty {
            XCTFail(combinedPartialMessages(errors), file: file, line: line)
        }
    }
    
    func combinedPartialMessages(_ errors: [SnapVerifyError]) -> String {
        return errors.map { $0.description }.joined(separator: "; ")
    }
    
}

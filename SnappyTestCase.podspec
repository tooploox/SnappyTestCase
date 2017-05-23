Pod::Spec.new do |s|
    s.name              = "SnappyTestCase"
    s.version           = "0.1.0"
    s.summary           = "iOS Simulator type agnostic snapshot testing, built on top of the FBSnapshotTestCase."
    s.description       = <<-DESC
        SnappyTestCase combines tests with a set of device definitions (each one including screen size, scale, and orientation) to validate with, ignoring real device simulator context information.
                   DESC
    s.homepage          = "https://bitbucket.org/tooploox/snappy/overview"
    s.license           = "Apache 2.0"
    s.author            = 'Tooploox'
    s.platform          = :ios, "8.0"
    s.source            = { :git => "https://bitbucket.org/tooploox/snappy.git"}
    s.source_files      = 'Snappy/*.{swift}'
    s.frameworks        = 'XCTest', 'UIKit','Foundation'
    s.dependency "FBSnapshotTestCase", "~> 2.1.4"
end

Pod::Spec.new do |s|
    s.name              = "Snappy"
    s.version           = "0.0.2"
    s.summary           = "Device independent, various screen size snapshot testing"
    s.description       = <<-DESC
        TODO: There will be some description of SNAPPY
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

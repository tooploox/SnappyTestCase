Snappy
======

Simulator device independent snapshot testing, build on [FBSnapshotTestCase](https://github.com/facebook/ios-snapshot-test-case).

Why?
----

Snapshot testing helps to deliver views that scale correctly with a wide range of screen sizes. When it comes to view controllers, we usually want to ensure they keep visual quality on a various set of existing devices, in each supported orientation. Test suite could be run on numerous variants of iOS Simulators. However, this could be a really time-consuming task, for sure not acceptable during a development process. Snappy tackles this issue by combining test with a set of Device definitions (including screen size, scale factor, and orientation) to validate with, ignoring real device simulator context information.

Installation using CocoaPods
----------------------------

Add following line to your test target pods list in `Podfile`:

`pod 'Snappy'`

Authors
-------

`Snappy` was written at [Tooploox](www.tooploox.com) by
[Przemysław Stasiak](https://github.com/pstasiak)

License
-------

`Snappy` is BSD-licensed.
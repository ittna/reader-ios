#!/bin/sh

xcodebuild test -project Reader.xcodeproj -scheme Reader -destination 'platform=iOS Simulator,name=iPhone 6,OS=9.1'

#xctool -project Reader.xcodeproj -scheme Reader test -test-sdk iphonesimulator9.1


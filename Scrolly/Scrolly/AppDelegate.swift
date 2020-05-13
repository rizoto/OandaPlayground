//
//  AppDelegate.swift
//  Scrolly
//
//  Created by Lubor Kolacny on 13/5/20.
//  Copyright © 2020 Lubor Kolacny. All rights reserved.
//

import Cocoa
import SwiftUI


class MouseReadyHostingView: NSHostingView<ContentView> {
    override func mouseEntered(with event: NSEvent) {
        print("mouse is here")
        super.mouseEntered(with: event)
    }

//    override func mouseDown(with event: NSEvent) {
//        print("mouse down (left bee)")
//        super.mouseDown(with: event)
//    }
//    override func wantsForwardedScrollEvents(for axis: NSEvent.GestureAxis) -> Bool {
//        print("wantsForwardedScrollEvents", axis.rawValue)
//        return super.wantsForwardedScrollEvents(for: axis)
//    }
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = MouseReadyHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}


//
//  AppDelegate.swift
//  Marlin
//
//  Created by Valeriy Soltan on 1/18/21.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
  
  private var window: NSWindow?

  func applicationDidFinishLaunching(_ aNotification: Notification) {
      
      let windowSize = NSSize(width: 480, height: 240)
      let screenSize = NSScreen.main?.frame.size ?? .zero
      let rect = NSMakeRect(screenSize.width/2 - windowSize.width/2,
                            screenSize.height/2 - windowSize.height/2,
                            windowSize.width, windowSize.height)
      window = NSWindow(contentRect: rect, styleMask: [
                          .miniaturizable, .closable,
                          .resizable, .titled
      ], backing: .buffered, defer: false)
      window?.title = "Marlin"
      window?.makeKeyAndOrderFront(nil)
      window?.contentViewController = MainViewController()
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }


}


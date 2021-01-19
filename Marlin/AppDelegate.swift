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
    window = NSWindow(contentRect: rect, styleMask:
                        [.miniaturizable, .closable, .resizable, .titled],
                        backing: .buffered, defer: false)
    window?.title = "Marlin"
    window?.makeKeyAndOrderFront(nil)
    window?.contentViewController = MainViewController()
    
    let bundleInfoDict: NSDictionary = Bundle.main.infoDictionary! as NSDictionary
    let appName = bundleInfoDict["CFBundleName"] as! String
  
    // Add menu
    let mainMenu = NSMenu()
    let mainMenuFileItem = NSMenuItem(title: "File", action:nil, keyEquivalent: "")
    let fileMenu = NSMenu(title: "File")
    fileMenu.addItem(withTitle: "About \(appName)", action: nil, keyEquivalent: "")
    fileMenu.addItem(NSMenuItem.separator())
    fileMenu.addItem(withTitle: "Hide \(appName)", action: #selector(NSApplication.hide(_:)), keyEquivalent: "")
    fileMenu.addItem(withTitle: "Hide Others", action: #selector(NSApplication.hideOtherApplications(_:)), keyEquivalent: "")
    fileMenu.addItem(withTitle: "Show All", action: #selector(NSApplication.unhideAllApplications(_:)), keyEquivalent: "")
    fileMenu.addItem(NSMenuItem.separator())
    fileMenu.addItem(withTitle: "Quit \(appName)", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")

    mainMenuFileItem.submenu = fileMenu

    mainMenu.addItem(mainMenuFileItem)

    NSApp.mainMenu = mainMenu
  }

  func applicationWillTerminate(_ aNotification: Notification) {
    // Insert code here to tear down your application
  }


}


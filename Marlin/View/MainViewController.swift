//
//  MainViewController.swift
//  Marlin
//
//  Created by Valeriy Soltan on 1/18/21.
//

import Cocoa
import AMSMB2

class MainViewController: NSViewController {
  
  override func loadView() {
      let rect = NSRect(x: 0, y: 0, width: 480, height: 240)
      view = NSView(frame: rect)
      view.wantsLayer = true
      view.layer?.backgroundColor = NSColor.black.cgColor
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }
  
}

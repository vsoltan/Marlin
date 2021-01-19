//
//  LoginViewController.swift
//  Marlin
//
//  Created by Valeriy Soltan on 1/18/21.
//

import Cocoa

class LoginViewController: NSViewController {
  override func loadView() {
    let viewFrame = NSRect(x: 0, y: 0, width: 480, height: 240)
    let view = NSView(frame: viewFrame)
    view.wantsLayer = true
    view.layer?.backgroundColor = NSColor.white.cgColor
  }
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}


//
//  MainViewController.swift
//  Marlin
//
//  Created by Valeriy Soltan on 1/18/21.
//

import Cocoa
import AMSMB2

class MainViewController: NSViewController {
  
  let shareAddressField: NSTextField = {
    let fieldFrame = NSRect(x: 0, y: 0, width: 0, height: 20)
    let field = NSTextField(frame: fieldFrame)
    field.placeholderString = "smb://XXX.XXX.XX.XX/share"
    field.translatesAutoresizingMaskIntoConstraints = false
    return field
  }()
  
  let usernameField: NSTextField = {
    let fieldFrame = NSRect(x: 0, y: 0, width: 0, height: 20)
    let field = NSTextField(frame: fieldFrame)
    field.placeholderString = "username"
    field.translatesAutoresizingMaskIntoConstraints = false
    return field
  }()
  
  let passwordField: NSTextField = {
    let fieldFrame = NSRect(x: 0, y: 0, width: 0, height: 20)
    let field = NSTextField(frame: fieldFrame)
    field.placeholderString = "password"
    field.translatesAutoresizingMaskIntoConstraints = false
    return field
  }()
  
  let loginButton: NSButton = {
    let buttonFrame = NSRect(x: 30, y: 10, width: 100, height: 30)
    let button = NSButton(frame: buttonFrame)
    return button
  }()
  
  override func loadView() {
    let rect = NSRect(x: 0, y: 0, width: 480, height: 240)
    view = NSView(frame: rect)
    view.wantsLayer = true
    view.layer?.backgroundColor = NSColor.black.cgColor
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(shareAddressField)
    view.addSubview(usernameField)
    view.addSubview(passwordField)
    view.addSubview(loginButton)
    setupLayout()
  }
  
  func setupLayout() {
    shareAddressFieldLayout()
    usernameFieldLayout()
    passwordFieldLayout()
    loginButtonLayout()
  }
  
  func shareAddressFieldLayout() {
    NSLayoutConstraint.activate([
      shareAddressField.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
      shareAddressField.bottomAnchor.constraint(equalTo: shareAddressField.topAnchor, constant: 20),
      shareAddressField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      shareAddressField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
    ])
  }
  
  func usernameFieldLayout() {
    NSLayoutConstraint.activate([
      usernameField.topAnchor.constraint(equalTo: shareAddressField.bottomAnchor, constant: 15),
      usernameField.bottomAnchor.constraint(equalTo: usernameField.topAnchor, constant: 20),
      usernameField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      usernameField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
    ])
  }
  
  func passwordFieldLayout() {
    NSLayoutConstraint.activate([
      passwordField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 15),
      passwordField.bottomAnchor.constraint(equalTo: passwordField.topAnchor, constant: 20),
      passwordField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      passwordField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
    ])
  }
  
  func loginButtonLayout() {
//    NSLayoutConstraint.activate([
//      loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 15),
//      loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
//      loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40)
//    ])
  }
  
  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }
  
}

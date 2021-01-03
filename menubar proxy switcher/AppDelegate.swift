//
//  AppDelegate.swift
//  Menu Proxy Switcher
//
//  Created by 赵涤非 on 2020/12/29.
//

import Cocoa
import SwiftUI

import Foundation

func shell(_ command: String) {
    let task = Process()
    task.arguments = ["-c", command]
    task.launchPath = "/bin/zsh"
    task.launch()
    
}

@main

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem!
    var statusButton: NSStatusBarButton!
    var isEnabled: Bool = true
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem.isVisible = true
        statusButton = statusItem.button!
        statusButton.target = self
        statusButton.action = #selector(Tap)
        enable()
    //    if let button = statusItem.button {
      //      button.image = NSImage(named: "StatusIcon")
        //    statusItem.menu = menu

    }
    @objc func Tap() {
        if isEnabled {
            disable()
        } else {
            enable()
        }
    }
    func enable() {
        // Run anything here
        shell("echo <password> | sudo -S networksetup -setsocksfirewallproxystate 'Wi-Fi' on")
        statusButton.image = NSImage(named:"On")
        isEnabled = true
    }
    
    func disable() {
        // Run anything here
        shell("echo <password> | sudo -S networksetup -setsocksfirewallproxystate 'Wi-Fi' off");

        statusButton.image = NSImage(named:"Off")
        isEnabled = false
    }

    
}
    
//        shell("echo 'tsubasa202an' | sudo -S networksetup -setsocksfirewallproxystate 'Wi-Fi' on")
    
//        shell("echo 'tsubasa202an' | sudo -S networksetup -setsocksfirewallproxystate 'Wi-Fi' off");
        
    
//    @IBAction func quitApp(_ sender: Any) {
//        NSApplication.shared.terminate(self)
//    }
//    func applicationWillTerminate(_ aNotification: Notification) {
  //  }




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
    var proxystatus: Bool = false
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusButton = statusItem.button!
        statusButton.target = self
        statusButton.action = #selector(Tap)
        off()

    }
    @objc func Tap() {
        if proxystatus {
            off()
        } else {
            on()
        }
    }
    func on() {
        shell("echo <password> | sudo -S networksetup -setsocksfirewallproxystate 'Wi-Fi' on")
        statusButton.image = NSImage(named:"On")
        proxystatus = true
    }
    
    func off() {
        shell("echo <password> | sudo -S networksetup -setsocksfirewallproxystate 'Wi-Fi' off");

        statusButton.image = NSImage(named:"Off")
        proxystatus = false
    }

    
}



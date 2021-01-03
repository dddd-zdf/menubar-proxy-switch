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
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusIcon")
            statusItem.menu = menu

        }
    }
    
    
    @IBOutlet weak var menu: NSMenu!
    @IBAction func On(_ sender: Any) {
        shell("echo 'tsubasa202an' | sudo -S networksetup -setsocksfirewallproxystate 'Wi-Fi' on")
        
    }
    
    @IBAction func Off(_ sender: Any) {
        shell("echo 'tsubasa202an' | sudo -S networksetup -setsocksfirewallproxystate 'Wi-Fi' off");
        
    }
    
//    @IBAction func quitApp(_ sender: Any) {
//        NSApplication.shared.terminate(self)
//    }
    func applicationWillTerminate(_ aNotification: Notification) {
    }


}


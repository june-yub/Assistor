//
//  AssistorApp.swift
//  Assistor
//
//  Created by Junyeop Jeon on 7/27/21.
//
/*
 Source of images :
    [MenuBar Icon] cactus6 : https://icons8.com/icons/set/cactus
    [App Icon] Sherlock_EveryHey : Instagram/EveryHey
*/

import SwiftUI

@main
struct AssistorApp: App {

    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            // Inactive ContentView
            ContentView()
        }
    }
}

//Going to Build Menu button and pop over menu....
class AppDelegate: NSObject,NSApplicationDelegate
{
    // Status Bar Item...
    var statusItem: NSStatusItem?
    // PopOver...
    var popOver = NSPopover()
    
    func applicationDidFinishLaunching(_ notification: Notification)
    {
        // Menu View
        let menuView = MenuView()
        
        // Creating PopOver...
        popOver.behavior = .transient
        popOver.animates = true
      
        popOver.contentViewController = NSViewController()
        popOver.contentViewController?.view = NSHostingView(rootView: menuView)
        
        // also Making View as Main View
        popOver.contentViewController?.view.window?.makeKey()
        
        // Creating Status Bar Button...
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        // Safe Check if status Button is Available or not...
        if let MenuButton = statusItem?.button
        {
            MenuButton.image = NSImage(named: "cactus6")
            
//            MenuButton.bezelColor = NSColor(Color.white)
//            MenuButton.contentTintColor = NSColor(Color.white)
            
            //MenuButton.image = NSImage(systemSymbolName: "hands.clap", accessibilityDescription: "comm")
            MenuButton.action = #selector(MenuButtonToggles)
            MenuButton.toolTip = "Assistor"
        }
    }
    
    func quit2()
    {
        NSApplication.shared.terminate(self)
    }
    
    // Button Action...
    @objc func MenuButtonToggles(sender: AnyObject)
    {
        //For Safer Side...
        if popOver.isShown
        {
            popOver.performClose(sender)
        }
        else
        {
            // Showing PopOver...
            if let menuButton = statusItem?.button
            {
                // Top Get Button Location For popover Arroww....
                self.popOver.show(relativeTo: menuButton.bounds, of: menuButton, preferredEdge: NSRectEdge.minY)
            }
            else
            {
                assertionFailure("Failed to show Popover..")
            }
        }
        
    }
    
}


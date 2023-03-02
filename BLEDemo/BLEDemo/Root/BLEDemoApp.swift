//
//  BLEDemoApp.swift
//  BLEDemo
//
//  Created by JAKE WITT on 2/28/23.
//

import SwiftUI

@main
struct BLEDemoApp: App {
    let rootViewModel = RootViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: rootViewModel)
        }
    }
}

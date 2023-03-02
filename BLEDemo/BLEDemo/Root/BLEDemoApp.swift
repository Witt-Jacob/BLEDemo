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
    let spo2ViewModel = SPO2DeviceViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: rootViewModel, spo2ViewModel: spo2ViewModel)
        }
    }
}

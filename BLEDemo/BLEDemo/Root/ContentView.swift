//
//  ContentView.swift
//  BLEDemo
//
//  Created by JAKE WITT on 2/28/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : RootViewModel
    let spo2ViewModel : SPO2DeviceViewModel
    var body: some View {
        switch viewModel.state {
        case .home: HomeView(spo2ViewModel: spo2ViewModel)
        case .pulseOximeter: SPO2DeviceViewManager(viewModel: spo2ViewModel)
        case .bloodPressureMonitor: EmptyView()
        }
    }
}

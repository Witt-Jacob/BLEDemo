//
//  SPO2DeviceViewManager.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import SwiftUI

struct SPO2DeviceViewManager: View {
    @ObservedObject var viewModel: SPO2DeviceViewModel
    
    var body: some View {
        switch viewModel.state {
        case .notConnected: SPO2NotConnectedView(scanForDevices: viewModel.scanForDevices)
        case .searching: SPO2SearchingView(cancelScan: {})
        case .deviceDiscovered: SPO2DeviceDiscoveredView(viewModel : viewModel)
        case .connecting: SPO2ConnectingView()
        case .connected: SPO2ConnectedView()
        }
    }
}

struct SPO2DeviceViewManager_Previews: PreviewProvider {
    static var previews: some View {
        SPO2DeviceViewManager(viewModel: SPO2DeviceViewModel())
    }
}

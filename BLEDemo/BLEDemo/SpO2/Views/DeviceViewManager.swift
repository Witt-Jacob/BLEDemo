//
//  SPO2DeviceViewManager.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import SwiftUI

struct DeviceViewManager: View {
    @ObservedObject var viewModel: DeviceViewModel
    
    var body: some View {
        ZStack {
            switch viewModel.state {
            case .notConnected: NotConnectedView(scanForDevices: viewModel.scanForDevices)
            case .searching: SearchingView(cancelScan: {})
            case .deviceDiscovered: DeviceDiscoveredView(viewModel : viewModel)
            case .connecting: ConnectingView()
            case .connected: ConnectedView(viewModel: viewModel)
            }
            
            if viewModel.bluetoothOff {
                DisplayMessageView(text: "Bluetooth ")
            }
            
            if viewModel.noPermissions {
                
            }
        }
    }
}

struct SPO2DeviceViewManager_Previews: PreviewProvider {
    static var previews: some View {
        DeviceViewManager(viewModel: DeviceViewModel())
    }
}

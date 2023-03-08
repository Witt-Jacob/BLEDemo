//
//  SPO2DeviceViewManager.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import SwiftUI

struct DeviceViewManager: View {
    @ObservedObject var viewModel: DeviceViewModel
    let backToHome : () -> Void
    
    var body: some View {
        VStack {
            HStack {
                BackButton(backToHome: backToHome)
                Spacer()
            }
            ZStack {
                switch viewModel.state {
                case .notConnected: NotConnectedView(scanForDevices: viewModel.scanForDevices)
                case .searching:
                    SearchingView(cancelScan: viewModel.stopScanning)
                case .deviceDiscovered: DeviceDiscoveredView(viewModel : viewModel)
                case .connecting:
                    ConnectingView()
                case .connected:
                    ConnectedView(viewModel: viewModel)
                }
                
                if viewModel.failedToConnect {
                    DisplayMessageView(
                        title: "Failed to connect",
                        description: "Please try again",
                        onClose: {
                            viewModel.failedToConnect = false
                        })
                }
                
                if viewModel.bluetoothOff {
                    DisplayMessageView(
                        title: "Bluetooth is Off",
                        description: "Please turn your phone's bluetooth on",
                        onClose: {
                            viewModel.bluetoothOff = false
                        }
                    )
                }
                
                if viewModel.noPermissions {
                    DisplayMessageView(
                        title: "No Bluetooth Permission",
                        description: "Please allow bluetooth in settings",
                        onClose: {
                            viewModel.noPermissions = false
                        }
                    )
                }
                
            }
        }
    }
}

struct SPO2DeviceViewManager_Previews: PreviewProvider {
    static var previews: some View {
        DeviceViewManager(viewModel: DeviceViewModel(), backToHome: {})
    }
}

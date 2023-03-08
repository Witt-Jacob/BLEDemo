//
//  SPO2DeviceDiscoveredView.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import SwiftUI

struct DeviceDiscoveredView: View {
    @ObservedObject var viewModel : DeviceViewModel
    var body: some View {
        VStack {
            Text("Discovered Devices")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            Divider().foregroundColor(.black).padding()
            if !viewModel.demoDevices.isEmpty {
                ScrollView {
                    ForEach(viewModel.demoDevices) {
                        device in
                        Text("Device \(device.peripheral.name ?? "unknown device")").padding().onTapGesture {
                            viewModel.connectToDevice(device: device)
                        }
                    }
                }
            } else {
                Text("No devices found").padding()
                Button(action: {
                    viewModel.scanForDevices()
                }) {
                    Text("SCAN")
                        .fontWeight(.bold)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 1))
                }
                Spacer()
                
            }
        }
    }
}

struct SPO2DeviceDiscoveredView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceDiscoveredView(viewModel: DeviceViewModel())
    }
}

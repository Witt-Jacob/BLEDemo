//
//  SPO2DeviceDiscoveredView.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import SwiftUI

struct SPO2DeviceDiscoveredView: View {
    @ObservedObject var viewModel : SPO2DeviceViewModel
    var body: some View {
        VStack {
            Text("Discovered Devices")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            Divider().foregroundColor(.black).padding()
            ScrollView {
                ForEach(viewModel.demoDevices) {
                    device in
                    Text("Device \(device.serialNumber)").padding().onTapGesture {
                        viewModel.connectToDevice(device: device)
                    }
                }
            }
        }
    }
}

struct SPO2DeviceDiscoveredView_Previews: PreviewProvider {
    static var previews: some View {
        SPO2DeviceDiscoveredView(viewModel: SPO2DeviceViewModel())
    }
}

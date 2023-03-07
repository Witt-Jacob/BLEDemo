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
            ScrollView {
                ForEach(viewModel.demoDevices) {
                    device in
                    Text("Device \(device.id)").padding().onTapGesture {
                        viewModel.connectToDevice(device: device)
                    }
                }
            }
        }
    }
}

struct SPO2DeviceDiscoveredView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceDiscoveredView(viewModel: DeviceViewModel())
    }
}

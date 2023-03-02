//
//  HomeView.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var spo2ViewModel: SPO2DeviceViewModel
    
    var body: some View {
        VStack {
            Text("My Devices")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            Divider().foregroundColor(.black).padding()
            ScrollView {
                SPO2DeviceCardView(isConnected: spo2ViewModel.state == .connected).padding()
                BPDeviceCard(isConnected: .constant(true))
            }
        }
    }
}

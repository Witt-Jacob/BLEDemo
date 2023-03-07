//
//  HomeView.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var deviceViewModel: DeviceViewModel
    let rootViewModel : RootViewModel
    
    var body: some View {
        VStack {
            Text("My Devices")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            Divider().foregroundColor(.black).padding()
            ScrollView {
                DeviceCardView(isConnected: deviceViewModel.state == .connected)
                    .padding()
                    .onTapGesture {
                    rootViewModel.state = .device
                }
            }
        }
    }
}

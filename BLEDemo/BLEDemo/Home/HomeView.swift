//
//  HomeView.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("My Devices")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            Divider().foregroundColor(.black).padding()
            ScrollView {
                SPO2DeviceCard(isConnected: .constant(true)).padding()
                BPDeviceCard(isConnected: .constant(true))
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

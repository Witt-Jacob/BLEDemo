//
//  SPO2DeviceCard.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import SwiftUI

struct SPO2DeviceCardView: View {
    var isConnected: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Pulse Oximeter:").font(.title3).padding(.bottom, 2)
            Text(text)
        }.padding().background(backgroundColor.opacity(0.8)).cornerRadius(8)
    }
    
    var backgroundColor : Color {
        if isConnected {
            return Color.green
        } else {
            return Color.red
        }
    }
    
    var text : String {
        if isConnected {
            return "Connected"
        } else {
            return "Not Connected"
        }
    }
}
            

struct SPO2DeviceCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SPO2DeviceCardView(isConnected: true)
            SPO2DeviceCardView(isConnected: false)
        }
    }
}

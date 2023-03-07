//
//  SPO2NotConnectedView.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import SwiftUI

struct SPO2NotConnectedView: View {
    let scanForDevices : () -> Void
    
    var body: some View {
        VStack {
            Text("Not Connected")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            Divider().foregroundColor(.black).padding()
            Button(action: {
                scanForDevices()
            }) {
                Text("SCAN")
                    .fontWeight(.bold)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 1))
            }
        }
        Spacer()
    }
}

struct SPO2SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SPO2NotConnectedView(scanForDevices: {})
    }
}

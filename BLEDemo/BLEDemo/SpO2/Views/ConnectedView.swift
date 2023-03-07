//
//  SPO2ConnectedView.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import SwiftUI

struct ConnectedView: View {
    @ObservedObject var viewModel : DeviceViewModel
    var body: some View {
        VStack {
            Text("Connected")
                .font(.title)
                .foregroundColor(Color.green)
                .padding()
            Divider().foregroundColor(.black).padding()
            Button(action: {
                viewModel.disconnectConnectedDevice()
            }) {
                Text("DISCONNECT")
                    .fontWeight(.bold)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 1))
            }
        }
        Spacer()
    }
}

struct SPO2ConnectedView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectedView(viewModel: DeviceViewModel())
    }
}

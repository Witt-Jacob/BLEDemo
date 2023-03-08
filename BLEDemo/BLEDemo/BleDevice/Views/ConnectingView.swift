//
//  SPO2ConnectingView.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import SwiftUI

struct ConnectingView: View {
    var body: some View {
        VStack {
            Text("Connecting...")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            Divider().foregroundColor(.black).padding()
            Button(action: {
                
            }) {
                Text("CANCEL")
                    .fontWeight(.bold)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 1))
            }
            Spacer()
        }
    }
}

struct SPO2ConnectingView_Previews: PreviewProvider {
    static var previews: some View {
        ConnectingView()
    }
}

//
//  SPO2SearchingView.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import SwiftUI

struct SearchingView: View {
    let cancelScan : () -> Void
    var body: some View {
        VStack {
            Text("Scanning...")
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
        }
        Spacer()
    }
}

struct SPO2SearchingView_Previews: PreviewProvider {
    static var previews: some View {
        SearchingView(cancelScan: {})
    }
}

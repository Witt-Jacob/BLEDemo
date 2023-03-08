//
//  ErrorView.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/7/23.
//

import SwiftUI

struct DisplayMessageView: View {
    let title : String
    let description : String
    let onClose : () -> Void
    
    var body: some View {
        VStack {
            Text(title).font(.title).padding()
            Text(description).padding()
            Button(action: onClose) {
                Text("CLOSE")
            }
        }.background(Color.white)
    }
}

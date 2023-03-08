//
//  BackButton.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/7/23.
//

import SwiftUI

struct BackButton: View {
    let backToHome : () -> Void
    var body: some View {
        Button(action: backToHome) {
            Text("BACK")
                .fontWeight(.bold)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(backToHome: {})
    }
}

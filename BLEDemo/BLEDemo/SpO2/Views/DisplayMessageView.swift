//
//  ErrorView.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/7/23.
//

import SwiftUI

struct DisplayMessageView: View {
    let title : String
    let body : String
    
    var body: some View {
        VStack {
            Text(title).font(.title).
            Text(body)
        }
    }
}

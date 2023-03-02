//
//  ContentView.swift
//  BLEDemo
//
//  Created by JAKE WITT on 2/28/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : RootViewModel
    var body: some View {
        switch viewModel.state {
        case .home: HomeView()
        case .pulseOximeter: EmptyView()
        case .bloodPressureMonitor: EmptyView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: RootViewModel())
    }
}

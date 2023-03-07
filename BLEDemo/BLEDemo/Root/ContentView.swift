//
//  ContentView.swift
//  BLEDemo
//
//  Created by JAKE WITT on 2/28/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : RootViewModel
    let deviceViewModel : DeviceViewModel
    var body: some View {
        switch viewModel.state {
        case .home: HomeView(deviceViewModel: deviceViewModel , rootViewModel: viewModel)
        case .device: DeviceViewManager(viewModel: deviceViewModel)
        }
    }
}

func guaranteeMainThread(_ work: @escaping () -> Void) {
    if Thread.isMainThread {
        work()
    } else {
        DispatchQueue.main.async(execute: work)
    }
}

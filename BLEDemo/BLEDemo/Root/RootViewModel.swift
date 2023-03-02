//
//  RootViewModel.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import Foundation

class RootViewModel : ObservableObject {
    @Published var state : ScreenState = .home
}

enum ScreenState {
    case home
    case pulseOximeter
    case bloodPressureMonitor
}

//
//  SPO2DeviceViewModel.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import Foundation

class SPO2DeviceViewModel : ObservableObject {
    @Published var state: SPO2State = .notConnected
    let connectionHandler = DemoSPO2ConnectionHandler()
    
    
    func scanForDevices() {
        
    }
}

enum SPO2State {
    case notConnected
    case searching
    case deviceDiscovered
    case connecting
    case connected
}

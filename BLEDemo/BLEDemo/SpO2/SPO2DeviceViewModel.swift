//
//  SPO2DeviceViewModel.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import Foundation

class SPO2DeviceViewModel : ObservableObject {
    @Published var state: SPO2State = .notConnected
    @Published var demoDevices : [DemoSPO2Device] = []
    let connectionHandler = DemoSPO2ConnectionHandler()
    
    
    func scanForDevices() {
        guaranteeMainThread {
            self.state = .searching
        }
        
        connectionHandler.scanForDevices(onDeviceDiscovered: { device in
            if !self.demoDevices.contains(where: { $0.serialNumber == device.serialNumber }) {
                guaranteeMainThread {
                    self.demoDevices.append(device)
                    self.state = .deviceDiscovered
                }
            }
        })
    }
    
    func connectToDevice(device : DemoSPO2Device) {
        guaranteeMainThread {
            self.state = .connecting
        }
        
        connectionHandler.connectToDevice(device: device, onConnected: { device in
            guaranteeMainThread {
                self.state = .connected
            }
        })
    }
}

enum SPO2State {
    case notConnected
    case searching
    case deviceDiscovered
    case connecting
    case connected
}

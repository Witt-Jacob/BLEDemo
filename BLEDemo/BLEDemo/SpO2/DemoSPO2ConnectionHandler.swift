//
//  SPO2ConnectionHandler.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import Foundation

class DemoSPO2ConnectionHandler {
    func scanForDevices(onDeviceDiscovered: @escaping (DemoSPO2Device) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            let uuid = UUID().uuidString
            onDeviceDiscovered(DemoSPO2Device(id: uuid, serialNumber: uuid))
        }
    }
    
    func connectToDevice(device: DemoSPO2Device, onConnected: @escaping (DemoSPO2Device) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            onConnected(device)
        }
    }
}

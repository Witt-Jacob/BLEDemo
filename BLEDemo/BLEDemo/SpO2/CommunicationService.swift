//
//  CommunicationService.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/7/23.
//

import Foundation
import CoreBluetooth

class CommunicationService : NSObject {
    var delegate : CommunicationDelegate?
    
    func setDelegate(delegate : CommunicationDelegate) {
        self.delegate = delegate
    }
    func getBatteryInfo(peripheral : CBPeripheral) {
        delegate?.batteryInfoReceived(battery: BatteryInfo(percentage: Int.random(in: 0...100)))
    }
    
    func startDataCollection(_ peripheral : CBPeripheral) {
        //A flow that polls data periodically
        getBatteryInfo(peripheral: peripheral)
        
    }
}
extension CommunicationService : CBPeripheralDelegate {
    
}

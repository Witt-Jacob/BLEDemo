//
//  BleDevice.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/2/23.
//

import Foundation
import CoreBluetooth

struct BleDevice : Identifiable {
    let id : String
    let peripheral : CBPeripheral
}

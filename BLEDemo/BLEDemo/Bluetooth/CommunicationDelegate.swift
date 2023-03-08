//
//  SPO2CommunicationDelegate.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/7/23.
//

import Foundation

protocol CommunicationDelegate {
    func batteryInfoReceived(battery : BatteryInfo)
}

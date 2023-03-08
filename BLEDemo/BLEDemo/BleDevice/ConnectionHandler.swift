//
//  SPO2ConnectionHandler.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import Foundation
import CoreBluetooth

class ConnectionHandler: NSObject {
    var centralManager: CBCentralManager? = nil
    var foundDeviceCallback: ((BleDevice) -> Void)? = nil
    var deviceDisconnectedCallback: ((BleDevice) -> Void)? = nil
    var deviceConnectedCallback: ((BleDevice) -> Void)? = nil
    var deviceConnectionFailedCallback: ((BleDevice) -> Void)? = nil
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func scanForDevices(onDeviceDiscovered: @escaping (BleDevice) -> Void) {
        foundDeviceCallback = onDeviceDiscovered
        centralManager?.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: false])
    }
    
    func stopDeviceScan() {
        centralManager?.stopScan()
    }
    
    func connectToDevice(device: BleDevice, onConnected: @escaping (BleDevice) -> Void, onDisconnected: @escaping (BleDevice) -> Void, onError: @escaping (BleDevice) -> Void) {
        deviceConnectedCallback = onConnected
        deviceDisconnectedCallback = onDisconnected
        deviceConnectionFailedCallback = onError
        centralManager?.connect(device.peripheral, options: nil)
    }
    
    func disconnectFromDevice(_ device: BleDevice) {
        centralManager?.cancelPeripheralConnection(device.peripheral)
    }
    
    func isBluetoothOn() -> Bool {
        return centralManager?.state == .poweredOn
    }
    
    func isBluetoothPermissionGranted() -> Bool {
        return CBCentralManager.authorization == .allowedAlways
    }
}
extension ConnectionHandler : CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn: break
        case .poweredOff: break
        default: break
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        guard let callback = foundDeviceCallback else {
            return
        }
        callback(BleDevice(id: peripheral.identifier.uuidString, peripheral: peripheral))
        
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        guard let callback = deviceConnectedCallback else {
            return
        }
        callback(BleDevice(id: peripheral.identifier.uuidString, peripheral: peripheral))
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        guard let callback = deviceConnectionFailedCallback else {
            return
        }
        callback(BleDevice(id: peripheral.identifier.uuidString, peripheral: peripheral))
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        guard let callback = deviceDisconnectedCallback else {
            return
        }
        callback(BleDevice(id: peripheral.identifier.uuidString, peripheral: peripheral))
    }
}


//
//  SPO2DeviceViewModel.swift
//  BLEDemo
//
//  Created by JAKE WITT on 3/1/23.
//

import Foundation

class DeviceViewModel : ObservableObject {
    @Published var state: bleState = .notConnected
    @Published var demoDevices : [BleDevice] = []
    @Published var noPermissions : Bool = false
    @Published var bluetoothOff : Bool = false
    @Published var failedToConnect : Bool = false
    @Published var batteryInfo : BatteryInfo?
    
    var connectedDevice : BleDevice?
    let connectionHandler = ConnectionHandler()
    let communicationService = CommunicationService()
    
    init() {
        communicationService.setDelegate(delegate: self)
    }
    
    func scanForDevices() {
        if !connectionHandler.isBluetoothPermissionGranted() {
            noPermissions = true
            return
        }
        
        if !connectionHandler.isBluetoothOn() {
            bluetoothOff = true
            return
        }
        guaranteeMainThread {
            self.state = .searching
        }
        
        connectionHandler.scanForDevices(onDeviceDiscovered: { device in
            if !self.demoDevices.contains(where: { $0.id == device.id }) {
                guaranteeMainThread {
                    self.demoDevices.append(device)
                    self.state = .deviceDiscovered
                }
            }
        })
    }
    
    func stopScanning() {
        connectionHandler.stopDeviceScan()
        guaranteeMainThread {
            self.state = .notConnected
        }
    }
    
    func connectToDevice(device : BleDevice) {
        connectionHandler.stopDeviceScan()
        guaranteeMainThread {
            self.state = .connecting
        }
        
        connectionHandler.connectToDevice(device : device, onConnected: {
            device in
            device.peripheral.delegate = self.communicationService
            
            guaranteeMainThread {
                self.connectedDevice = device
                self.state = .connected
            }
            
            self.communicationService.startDataCollection(device.peripheral)
        }, onDisconnected: {
            device in

            guaranteeMainThread {
                self.state = .notConnected
                self.connectedDevice = nil
            }
        }, onError: {
            device in
            
            guaranteeMainThread {
                self.state = .notConnected
                self.failedToConnect = true
            }
        })

    }
    
    func disconnectConnectedDevice() {
        guard let device = connectedDevice else {
            return
        }
        connectionHandler.disconnectFromDevice(device)
    }
}

extension DeviceViewModel : CommunicationDelegate {
    func batteryInfoReceived(battery: BatteryInfo) {
        guaranteeMainThread {
            self.batteryInfo = battery
        }
    }
}

enum bleState {
    case notConnected
    case searching
    case deviceDiscovered
    case connecting
    case connected
}

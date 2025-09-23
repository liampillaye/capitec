//
//  ApplicationStore.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

class ApplicationStore: ObservableObject {
    
    //MARK: PROPERTIES
    @Published var branches: [Branch]? = nil
    
    //MARK: SHARED
    static let instance = ApplicationStore()
    
    //MARK: PRIVATE INIT
    private init() {}
    
    //MARK: PUBLIC FUNCTIONS
    public func setBranches(_ branches: [Branch]) {
        self.branches = branches
    }
    
    //    public func findAndReplaceDevice(_ device: Device) {
    //        if let index = self.devices.firstIndex(where: { $0.id == device.id }) {
    //            self.devices[index] = device
    //        }
    //    }
}

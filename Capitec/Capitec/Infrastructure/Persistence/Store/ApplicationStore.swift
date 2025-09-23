//
//  ApplicationStore.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

class ApplicationStore:Codable, ObservableObject {
    
    //MARK: PROPERTIES
    var branches: [Branch]
    
    private enum CodingKeys: String, CodingKey {
        case branches
    }
    
    //MARK: INITS
    init(
        branches: [Branch] = []) {
            self.branches = branches
        }
    
    required init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        branches = try values.decode([Branch].self, forKey: .branches)
    }
}

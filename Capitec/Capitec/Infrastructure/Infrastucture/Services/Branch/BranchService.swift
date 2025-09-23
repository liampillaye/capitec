//
//  BranchService.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

protocol BranchService {
    func findBranchBySuburbOrCity(suburbOrCity: String) async throws -> [Branch]
}

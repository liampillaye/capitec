//
//  LoanEligibilitySimulatorPersonalInfoViewModel.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

@MainActor internal final class LoanEligibilitySimulatorPersonalInfoViewModel: ObservableObject {
    
    
        
    private let formValidator: FormValidator = FormValidator()
    private let manager: LoanEligibilitySimulatorManager
//    private let userRepository: UserRepository
//    private let profileManager: ProfileManager
//    private var user: User?
    
    @Published private(set) var isBusy: Bool = false
    @Published var saveFailed: Bool = false
    
    
    //MARK: - Form Fields -
    @Published var age: FormField = FormField(for: "Age")
    @Published var employmentStatus: FormField = FormField(for: "Employment Status")
    @Published var employmentDuration: FormField = FormField(for: "Emmployment Duration")

    
    //MARK: - Inits -
    
    init(manager: LoanEligibilitySimulatorManager) {
        self.manager = manager

        formValidator.addFields(fields: [
            self.age,
            self.employmentStatus,
            self.employmentDuration
        ])
    }
//    init(userRepository: UserRepository = resolve(UserRepository.self)!,
//         profileManager: ProfileManager = resolve(ProfileManager.self)!) {
//        self.userRepository = userRepository
//        self.profileManager = profileManager
//        
//        initialiseUser()
//        
//        formValidator.addFields(fields: [
//            self.name,
//            self.surname,
//            self.mobile,
//            self.idNumber,
//            self.email,
//            self.complexBuilding,
//            self.street,
//            self.suburb,
//            self.town,
//            self.postalCode,
//            self.provinceState,
//            self.passphrase,
//            self.confirmpassphrase
//        ])
        
//        formValidator.validate()
    
    
    func validate() -> Bool {
        return formValidator.validate();
    }
    
    func fetchValidationRules() async throws {
        try await self.manager.fetchAndSaveValidationRules()
    }
}

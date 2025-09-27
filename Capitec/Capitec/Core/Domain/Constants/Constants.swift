//
//  Constants.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

enum Constants {
    
    enum Services {
        
        enum base {
            static let baseUrl = "https://www.capitecbank.co.za/api/"
        }
        
        enum branch {
            static let basePath = "Branch"
        }
    }
    
    enum Store {
        static let bundle = "za.co.capitecbank.Capitec.store"
    }
    
    enum Mocks {
        static let branch = "MockBranches.json"
        
        enum Loans {
            static let eligibility = "Eligibility.json"
            static let products = "Products.json"
            static let calculateRates = "CalculateRates.json"
            static let valdiationRules = "ValidationRules.json"
        }
    }
    
    enum NavigationBar {
        
        enum LoanElilitySimulator {
            static let title = "Loan Eligibility Simulator"
            static let personalInfoTitle = "Personal Information"
            static let financialInfoTitle = "Financial Information"
            static let loanDetailsTitle = "Loan Details"
        }
        
        enum ProductOrNeeds {
            static let title = "Choose a Product or a Need"
            static let productTitle = "Choose a Product"
            static let needTitle = "Choose a Need"
        }
    }
    
    enum Colors {
        static let accentColor = "AccentColor"
        static let inputValidationErrorColor = "InputValidationErrorColor"
        static let navigationBarSubtitleColor = "NavigationBarSubtitleColor"
        static let navigationBarTitleColor = "NavigationBarTitleColor"
        static let primaryThemeColor = "PrimaryThemeColor"
        static let textBoarderColor = "TextBoarderColor"
        static let textColor = "TextColor"
    }
    
    enum Images {
        static let logo = "logo"
        static let personalLoan = "personal_loan"
        static let vehicleLoan = "vehicle_loan"
    }
}

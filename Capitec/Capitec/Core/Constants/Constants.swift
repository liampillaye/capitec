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
        static let Bundle = "za.co.capitecbank.Capitec.store"
    }
    
    enum Mocks {
        static let Branch = "MockBranches.json"
    }
    
    enum NavigationBar {
        
        enum LoanElilitySimulator {
            static let title = "Loan Eligibility Simulator"
            static let personalInfoTitle = "Personal Information"
            static let financialInfoTitle = "Financial Information"
            static let loanDetailsTitle = "Loan Details"
        }
    }
    
    enum Colors {
        static let AccentColor = "AccentColor"
        static let InputValidationErrorColor = "InputValidationErrorColor"
        static let NavigationBarSubtitleColor = "NavigationBarSubtitleColor"
        static let NavigationBarTitleColor = "NavigationBarTitleColor"
        static let PrimaryColor = "PrimaryColor"
        static let TextBoarderColor = "TextBoarderColor"
        static let TextColor = "TextColor"
    }
}

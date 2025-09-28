//
//  Constants.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

enum Constants {
        
    enum Store {
        static let bundle = "za.co.capitecbank.Capitec.store"
    }
    
    enum Mocks {
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
            static let productTitle = "Get a solution up to R500 000 to suits your financial needs"
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
        static let dropShadowColor = "ColorBlackTransparentLight"
        static let placeholderColor = "PlaceholderTextColor"
    }
    
    enum Images {
        static let logo = "logo"
        static let personalLoan = "personal_loan"
        static let vehicleLoan = "vehicle_loan"
        static let closeIcon = "x.circle.fill"
    }
    
    enum Product {
        enum Details {
            static let minimumAmountTitle = "Minimum Amount:"
            static let maximumAmountTitle = "Maximum Amount:"
            static let currencyISOCode = "ZAR"
            static let minimumTermTitle = "Minimum Term:"
            static let monthsTitle = "(Months)"
            static let maxiumTermTitle = "Maximum Term:"
            static let maximumInterestRateTitle = "Maximum Interest Rate:"
            static let minimumInterestRateTitle = "Minimum Interest Rate:"
            static let generalPurposesTitle = "General Purposes:"
        }
    }
}

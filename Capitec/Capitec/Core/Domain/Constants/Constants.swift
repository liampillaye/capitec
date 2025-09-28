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
            static let calculateRates = "CalculateRate.json"
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
        
        enum Eligibility {
            static let title = "Loan Eligibility Check"
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
        static let placeholderColor = "TextPlaceholderTextColor"
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
    
    enum Eligibility {
        enum Results {
            static let resultTitle = "Eligibility Results"
            static let isEligibleTitle = "Is Eligible:"
            static let approvalLikelihoodTitle = "Approval Likelihood:"
            static let riskCategoryTitle = "Risk Category:"
            static let decisionReasonTitle = "Decision Reason:"
        }
        
        enum RecommendedLoan {
            static let title = "Recommended Loan"
            static let maxAmountTitle = "Maximum Amount:"
            static let recommendedAmountTitle = "Recommended Amount:"
            static let interestRateTitle = "Interest Rate:"
            static let monthlyPaymentTitle = "Monthly Payment:"
            static let totalRepaymentTitle = "Total Replayment:"
        }
        
        enum AffordabilityAnalysis {
            static let title = "Affordability Analysis"
            static let disposableIncomeTitle = "Disposable Income:"
            static let debtToIncomeRatioTitle = "Debt to Income Ratio:"
            static let loanToIncomeRatioTitle = "Loan to Income Ratio"
            static let affordabilityScoreTitle = "Affordability Score:"
        }
    }
    
    enum CalculateRate {
        static let title = "Calculate Rate"
        static let interestRateTitle = "Interest Rate:"
        static let monthlyPaymentTitle = "Monthly Payment:"
        static let totalInterestTitle = "Total Interest:"
        static let totalRepaymentTitle = "Total Replayment:"
        
        enum PaymentSchedule {
            static let title = "Payment Schedule"
            static let monthTitle = "Month:"
            static let paymentTitle = "Payment:"
            static let principleTitle = "Principle:"
            static let interestTitle = "Interest:"
            static let balanceTitle = "Balance:"
        }
    }
    
    enum SegmentedControl {
        static let eligiblityTitle = "Eligibility"
        static let eligiblityTag = "eligiblity"
        static let calculateRateTitle = "Calculate Rate"
        static let calculateTag = "calculate-rate"
    }
    
    enum ResetAlert {
        static let title = "Reset Eligibility"
        static let message = "Are you sure you want to reset?"
        static let yesButtonTitle = "Reset"
        static let noButtonTitle = "Cancel"
        static let resetPrimaryButtonTitle = "Reset"
    }
    
    enum FinancialInfo {
        static let monthlyIncomeTitle = "Monthly Income"
        static let monthlyIncomePlaceholder = "What is your monthly income?"
        static let monthlyExpensesTitle = "Monthly Expenses"
        static let monthlyExpensesPlaceholder = "What is your monthly expenses?"
        static let existingDebtTitle = "Existing Debt"
        static let existingDebtPlaceholder = "How much is your existing debt?"
        static let creditScoreTitle = "Credit Score"
        static let creditScorePlaceholder = "What is your current credit score?"
    }
    
    enum LoanDetails {
        static let requestAmountTitle = "Request Amount"
        static let requestAmountPlaceholder = "What is your requested Amount?"
        static let loanTermTitle = "Loan Term"
        static let loanTermPlacholder = "What is the term (months)?"
        static let loanPurposeTitle = "Loan Purpose"
        static let loanPurposePlaceholder = "What is the purpose of the loan?"
    }
    
    enum PersonalInfo {
        static let ageTitle = "Age"
        static let agePlaceholder = "What is your age?"
        static let employmentStatusTitle = "Employment Status"
        static let employmentStatusPlaceholder = "What is your employment status?"
        static let employmentDurationTitle = "Employment Duration"
        static let employmentDurationPlaceholder = "How long have you been employed?"
    }
}

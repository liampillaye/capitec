//
//  LoanEligibilitySimulatorView.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct LoanEligibilitySimulatorPersonalInfoView: View {
    
    //MARK: PROPERTIES
    @StateObject var viewModel: LoanEligibilitySimulatorPersonalInfoViewModel
    
    @State private var age: String = ""
    @State private var employmentStatus: String? = nil
    @State private var employmentStatusSelected: Bool = false
    @State private var employmentDuration: String = ""
    @State private var showFinancialInfoView: Bool = false
    @State private var showEmploymentStatusActionSheet: Bool = false
    @State private var employmentStatusOption: String? = nil
    
    
    //MARK: BODY
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    //Navigation Bar
                    NavigationBarView(
                        title1: Constants.NavigationBar.LoanElilitySimulator.title,
                        title2: Constants.NavigationBar.LoanElilitySimulator.personalInfoTitle,
                        stepCount: 2,
                        showStepper: true).padding(.bottom)
                    
                    
                    Group {
                        //Age
                        TextInputView(title: Constants.PersonalInfo.ageTitle,
                                      placeholder: Constants.PersonalInfo.agePlaceholder,
                                      text: $age,
                                      error: $viewModel.age.error,
                                      keyboardType: .numberPad)
                        
                        //Employment Status
                        TextViewWithActionTrigger(title: Constants.PersonalInfo.employmentStatusTitle,
                                                  placeholder: employmentStatus ?? Constants.PersonalInfo.employmentStatusPlaceholder,
                                                  dataPopulated: $employmentStatusSelected,
                                                  error: $viewModel.employmentStatus.error,
                                                  keyboardType: .numberPad) {
                            showEmploymentStatusActionSheet = true
                        }
                        
                        //Employment Duration
                        TextInputView(title: Constants.PersonalInfo.employmentDurationTitle,
                                      placeholder: Constants.PersonalInfo.employmentDurationPlaceholder,
                                      text: $employmentDuration,
                                      error: $viewModel.employmentDuration.error,
                                      keyboardType: .numberPad)
                        
                    }//:GROUP
                    
                    PrimaryButton(buttonTitle: "Continue", isDisabled: false) {
                        viewModel.age.value = age
                        viewModel.employmentStatus.value = employmentStatus ?? ""
                        viewModel.employmentDuration.value = employmentDuration
                        Task {
                            showFinancialInfoView = viewModel.validate(personalInfo: PersonalInfo(
                                age: Int(age) ?? 0,
                                employmentStatus: employmentStatus ?? "",
                                employmentDuration: Int(employmentDuration) ?? 0))
                        }
                    }//: PrimaryButton
                }//: VSTACK
                .navigationDestination(isPresented: $showFinancialInfoView) {
                    let vm: LoanEligibilitySimulatorFinancialInfoViewModel = IoCContainer.resolve()
                    LoanEligibilitySimulatorFinancialInfoView(viewModel: vm)
                }
                .onAppear() {
                    Task {
                        try viewModel.fetchValidationRules()
                    }
                }
                .actionSheet(isPresented: $showEmploymentStatusActionSheet) {
                    ActionSheet(
                        title: Text("Employee Status"),
                        message: Text("What is your employment status?"),
                        buttons: viewModel.employeeStatusOptions.map { option in
                                .default(Text(option)) {
                                    employmentStatusSelected = true
                                    employmentStatus = option
                                }
                        }
                    )
                }
            }//:SCROLLVIEW
        }//: NAVIGATION STACK
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }//:BODY
}

//MARK: PREVIEW
#Preview {
    
    struct Preview: View {
        
        let store: ApplicationStore = ApplicationStore.instance
        let vm = LoanEligibilitySimulatorPersonalInfoViewModel(manager: MockLoanEligibilitySimulatorManager())
        
        var body: some View {
            LoanEligibilitySimulatorPersonalInfoView(viewModel: vm)
                .environmentObject(ApplicationStore.instance)
        }
    }
    
    return Preview()
}

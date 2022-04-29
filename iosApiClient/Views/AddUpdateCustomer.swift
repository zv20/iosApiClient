//
//  AddUpdateCustomer.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 28.04.22.
//

import SwiftUI

struct AddUpdateCustomer: View {
    
    @ObservedObject var viewModel: AddUpdateCustomerViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("Customer Name", text: $viewModel.customerName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button {
                viewModel.addUpdateAction {
                    presentationMode.wrappedValue.dismiss()
                    
                }
            } label: {
                Text (viewModel.buttonTitle)
            }
        }
    }
}


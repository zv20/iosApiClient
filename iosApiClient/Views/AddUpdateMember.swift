//
//  AddUpdateMember.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 8.05.22.
//

import SwiftUI

struct AddUpdateMember: View {


    @ObservedObject var viewModel: AddUpdateMemberViewModel
            
            @Environment(\.presentationMode) var presentationMode
            
            var body: some View {
                VStack {
                    TextField("Member Name", text: $viewModel.memberName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    TextField("Member Number", value: $viewModel.memberNumber, formatter: NumberFormatter())
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

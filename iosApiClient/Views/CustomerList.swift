//
//  CustomerList.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 28.04.22.
//

import SwiftUI

struct CustomerList: View {
    
    @StateObject var viewModel = CustomerListViewModel()
    
    @State var modal: ModalType? = nil
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.customers) {
                    customer in
                    Button {
                        print("selected a customer", "\(customer.name)")
                    } label: {
                        Text(customer.name)
                            .font(.title3)
                        foregroundColor(Color(.label))
                    }
                }
            }
            .navigationTitle(Text("Customers"))
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button{
                    modal = .add
                } label: {
                    Label("Add Customer", systemImage: "person.badge.plus")
                }
                  
                    
                    // second button
                    
                    Button{
                        Task {
                            do {
                                try await viewModel.fetchCustomer()
                            } catch {
                                print("Error: \(error)")
                            }
                        }
                    } label: {
                        Label("Refresh Customer", systemImage: "r.circle")
                    }
                    
                }
            }
            
        }
        .sheet(item: $modal, onDismiss: {
            // on dismiss code
            Task {
                do {
                    try await viewModel.fetchCustomer()
                } catch {
                    print("Error: \(error)")
                }
            }
            
        }) { modal in
            switch modal {
            case .add:
                AddUpdateCustomer(viewModel: AddUpdateCustomerViewModel())
            case .update(let customer):
                AddUpdateCustomer(viewModel: AddUpdateCustomerViewModel(currentCustomer: customer))
            }
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.fetchCustomer()
                } catch {
                    print("Error: \(error)")
                }
           
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerList()
    }
}

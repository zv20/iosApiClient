//
//  AddUpdateCustomerViewModel.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 28.04.22.
//

import Foundation
import SwiftUI

final class AddUpdateCustomerViewModel: ObservableObject {
    @Published var customerName = ""
    
    var customerID: UUID?
    
    
    var isUpdatig: Bool {
        customerID != nil
        
    }
    var buttonTitle: String {
        customerID != nil ? "Update Customer" : "Add Customer"
    }
    
    
    init() {}
    
    init(currentCustomer: Customer) {
        self.customerName = currentCustomer.name
        self.customerID = currentCustomer.id
    }
    
    func addCustomer() async throws {
        let urlString = Constants.baseURL + Endpoints.customers
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        let customer = Customer(id: nil, name: customerName)
    
        try await HttpClient.shared.sendData(to: url,
                                             object: customer,
                                             httpMetod: HttpMethods.POST.rawValue)
    }
    func addUpdateAction(completion: @escaping () -> Void) {
        Task {
            
            do {
                if isUpdatig {
                //updateCustomer()
            } else {
                try await addCustomer()
            }
            } catch {
                print("Error: \(error)")
                
            }
            completion()
        }
    }
}

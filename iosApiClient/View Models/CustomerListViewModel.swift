//
//  CustomerListViewModel.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 28.04.22.
//

import SwiftUI

class CustomerListViewModel: ObservableObject {
    @Published var customers = [Customer]()
     
    func fetchCustomer() async throws {
        let urlString = Constants.baseURL + Endpoints.customers
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let customerResponse: [Customer] = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async {
            self.customers = customerResponse
            
        }
    }
}

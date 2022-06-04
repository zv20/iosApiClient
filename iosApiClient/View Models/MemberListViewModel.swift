//
//  MemberListViewModel.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 8.05.22.
//

import SwiftUI

class MemberListViewModel: ObservableObject {
    @Published var members = [Member]()
     
    func fetchMember() async throws {
        let urlString = Constants.baseURL + Endpoints.members
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let memberResponse: [Member] = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async {
            self.members = memberResponse
            
        }
    }
}

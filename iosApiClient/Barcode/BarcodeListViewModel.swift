//
//  BarcodeListViewModel.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 20.05.22.
//

import SwiftUI

class BarcodeListViewModel: ObservableObject {
    @Published var barcodes = [Barcode]()
     
    func fetchBarcode() async throws {
        let urlString = Constants.baseURL + Endpoints.barcodes
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        
        let barcodeResponse: [Barcode] = try await HttpClient.shared.fetch(url: url)
        
        DispatchQueue.main.async {
            self.barcodes = barcodeResponse
            
        }
    }
}

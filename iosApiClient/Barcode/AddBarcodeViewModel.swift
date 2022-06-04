//
//  AddBarcodeViewModel.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 20.05.22.
//

import Foundation
import SwiftUI
import ScanBarcodes

final class AddBarcodeViewModel: ObservableObject {
    @Published var codeB = ""
   
    var barcodeID: UUID?
   
    init() {}
    
    init(currentBarcode: Barcode) {
        self.codeB = currentBarcode.codeB
        self.barcodeID = currentBarcode.id
     
    }
    
    func addBarcode() async throws {
        let urlString = Constants.baseURL + Endpoints.barcodes
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        let barcode = Barcode(id: nil, codeB: codeB)
    
        try await HttpClient.shared.sendData(to: url,
                                             object: barcode,
                                             httpMetod: HttpMethods.POST.rawValue)
    }
}

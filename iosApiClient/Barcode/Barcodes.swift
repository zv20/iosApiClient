//
//  Barcodes.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 20.05.22.
//

import SwiftUI

struct Barcodes: View {
 
        @StateObject var viewModel = BarcodeListViewModel()
    
        @State var modal: ModalType? = nil
        
        
        var body: some View {
            NavigationView {
                List {
                    ForEach(viewModel.barcodes) {
                        barcode in
                        NavigationLink(destination: {
                            Text("\(barcode.codeB)")
                        }, label: { Text(barcode.codeB)})
                    }
                }
               
                .navigationTitle(Text("Barcodes"))
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button{
                        
                        print("Barcode")
                    } label: {
                        Label("Add Barcode", systemImage: "person.badge.plus")
                    }
                        Button{
                           Task {
                               do {
                                    try await viewModel.fetchBarcode()
                               } catch {
                                   print("Error: \(error)")                                }
                           }
                       } label: {
                          Label("Refresh Barcode", systemImage: "r.circle")
                       }
                    }
                }
          

                        
            }
        }
}

       


struct Barcodes_Previews: PreviewProvider {
    static var previews: some View {
        Barcodes()
    }
}

//
//  ScanView.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 20.05.22.
//

import SwiftUI
import ScanBarcodes

struct ScanView: View {
        init(flashlightOn: Binding<Bool>, zoomLevel: Binding<Int>) {
            _flashlightOn = flashlightOn
            _zoomLevel = zoomLevel
    
    
        }
    @StateObject var viewModel =  AddBarcodeViewModel()
    

    
   @Binding var flashlightOn: Bool
    @Binding var zoomLevel: Int
    @State private var barcodeContent = "Scan a QR code"
    


    var body: some View {
        VStack {
//            HStack {
//                Button {
//                    self.flashlightOn.toggle()
//                } label: {
//                    Image(systemName: flashlightOn
//                          ? "bolt.circle.fill" : "bolt.slash.circle.fill")
//                        .resizable()
//                        .frame(width: 50, height: 50)
//                }
//                Picker(selection: $zoomLevel, label: Text("Zoom")) {
//                    ForEach(1...8, id: \.self) {
//                        Text("\($0)x")
//                    }
//                }
//            }
//            .pickerStyle(SegmentedPickerStyle())
//            .background(Color.black)
//            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
          
            ScanBarcodesView(
                barcodeTypes: [.code128, .qr, .codabar, .code39, .code93, .upce, .ean8],
                zoomLevel: $zoomLevel,
                flashlightOn: $flashlightOn,
                completion: barcodeResult)

           // Text(barcodeContent)
            
           
            TextField("Barcode", text: $barcodeContent)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                Button{
                   Task {
                       do {
                            try await viewModel.addBarcode()
                       } catch {
                           print("Error: \(error)")                                }
                   }
               } label: {
                  Label("Add Barcode", systemImage: "r.circle")
               
            }
        }
    }
    private func barcodeResult(result: Result<String, BarcodeScanError>) {
        if case let .success(code) = result {
            barcodeContent = code
        }
        
        
    }
}



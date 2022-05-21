//
//  Menu.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 13.05.22.
//

import SwiftUI

struct Menu: View {
    @State var flashlightOn = false
    @State var zoomLevel = 1
    
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: ScanView(
                    flashlightOn: $flashlightOn,
                    zoomLevel: $zoomLevel
                )
            ) {
                Text("Begin Scanning")
            }
        }
    }
}
struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}

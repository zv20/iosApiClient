//
//  MySettings.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 13.05.22.
//

import SwiftUI

struct MySettings: View {
    @State var isChecked:Bool = false

    func toggle(){isChecked = !isChecked}
    
    var body: some View {
        VStack{
        Text("Hello, Settings")
       
            
                Button(action: toggle){
                    HStack{
                        Image(systemName: isChecked ? "checkmark.square": "square")
                        Text("Tell")
                    }

                }

            }

        }
}
     
  

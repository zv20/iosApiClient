//
//  Home.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 8.05.22.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = MemberListViewModel()

    @State var modal: ModalType? = nil
    
    var body: some View {
    TabView {
            Menu()
                .tabItem {
                    Label("Menu", systemImage: "house")
                }
        
            Load()
                .tabItem {
                    Label("Load", systemImage: "plus")
                }
                    Members()
                        .tabItem {
                            Label("Members", systemImage: "person")
                        }
            Unload()
                .tabItem {
                    Label("Unload", systemImage: "minus")
                }
        MySettings()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    
    
        
    }
        
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

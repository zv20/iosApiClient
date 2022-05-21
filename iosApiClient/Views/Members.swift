//
//  Members.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 14.05.22.
//

import SwiftUI

struct Members: View {
 
        @StateObject var viewModel = MemberListViewModel()
    
        @State var modal: ModalType? = nil
        
        
        var body: some View {
            NavigationView {
                List {
                    ForEach(viewModel.members) {
                        member in
                        NavigationLink(destination: {
                            Text("\(member.name)")
                        }, label: { Text(member.name)})
                    }
                }
               
                .navigationTitle(Text("Members"))
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button{
                        
                        print("Member")
                    } label: {
                        Label("Add Member", systemImage: "person.badge.plus")
                    }
                        Button{
                           Task {
                               do {
                                    try await viewModel.fetchMember()
                               } catch {
                                   print("Error: \(error)")                                }
                           }
                       } label: {
                          Label("Refresh Customer", systemImage: "r.circle")
                       }
                    }
                }
          
     
                
                
                
                
               
                      
                        
                        
                       
                        
            }
        }
}

       


struct Members_Previews: PreviewProvider {
    static var previews: some View {
        Members()
    }
}

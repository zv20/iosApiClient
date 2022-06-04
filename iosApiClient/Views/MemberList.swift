//
//  MemberList.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 8.05.22.
//

import SwiftUI

struct MemberList: View {
   
        @StateObject var viewModel = MemberListViewModel()
    
        @State var modal: ModalType? = nil
        
        
        var body: some View {
            NavigationView {
                List {
                    ForEach(viewModel.members) {
                        member in
                        Button {
                            print("selected a member", "\(member.name)")
                        } label: {
                            Text(member.name)
                                .font(.title3)
                            foregroundColor(Color(.label))
                        }
                    }
                }
                .navigationTitle(Text("Members"))
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button{
                        modal = .add
                        print("Member")
                    } label: {
                        Label("Add Member", systemImage: "person.badge.plus")
                    }
                      
                        
                        //second button
                        
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
                        
                        // tre but
                        
                       
                        
                    }
                }
                
            }
            .sheet(item: $modal, onDismiss: {
                // on dismiss code
                Task {
                    do {
                        try await viewModel.fetchMember()
                    } catch {
                        print("Error: \(error)")
                    }
                }
                
            }) { modal in
                switch modal {
                case .add:
                    AddUpdateMember(viewModel: AddUpdateMemberViewModel())
                case .update(let member):
                    AddUpdateMember(viewModel: AddUpdateMemberViewModel(currentMember: member))
                
                }
            }
            .onAppear {
                Task {
                    do {
                        try await viewModel.fetchMember()
                    } catch {
                        print("Error: \(error)")
                        }
                    }
                }
            
        }
    }

struct MemberList_Previews: PreviewProvider {
    static var previews: some View {
        MemberList()
    }
}

//
//  AddUpdateMemberViewModel.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 8.05.22.
//

import Foundation
import SwiftUI

final class AddUpdateMemberViewModel: ObservableObject {
    @Published var memberName = ""
    @Published var memberEmail = ""
    @Published var memberFamily = ""
    @Published var memberNumber = 2
    @Published var memberSchool = ""
    @Published var memberDI = ""
    var memberID: UUID?
    
    
    var isUpdatig: Bool {
        memberID != nil
        
    }
    var buttonTitle: String {
        memberID != nil ? "Update Member" : "Add Member"
    }
    
    
    init() {}
    
    init(currentMember: Member) {
        self.memberName = currentMember.name
        self.memberID = currentMember.id
        self.memberEmail = currentMember.email
        self.memberFamily = currentMember.family
        self.memberNumber = currentMember.number
        self.memberSchool = currentMember.school
        self.memberDI = currentMember.memberUUID
    }
    
    func addMember() async throws {
        let urlString = Constants.baseURL + Endpoints.members
        
        guard let url = URL(string: urlString) else {
            throw HttpError.badURL
        }
        let member = Member(id: nil, name: memberName, family: memberFamily, email: memberEmail,number: memberNumber, school: memberSchool,   memberUUID: memberDI)
    
        try await HttpClient.shared.sendData(to: url,
                                             object: member,
                                             httpMetod: HttpMethods.POST.rawValue)
    }
    func addUpdateAction(completion: @escaping () -> Void) {
        Task {
            
            do {
                if isUpdatig {
                //updateCustomer()
            } else {
                try await addMember()
            }
            } catch {
                print("Error: \(error)")
                
            }
            completion()
        }
    }
}

//
//  AssignBackupContactsView.swift
//  GameSafe
//
//  Created by Alex Shillingford on 6/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI

struct AssignBackupContactsView: View {
    @Binding var contacts: [Contact]
    @State private var contactListPresented = false
    @State private var isMainContact = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Main Contact")
                    .font(.largeTitle).bold()
                Spacer()
            }
            .padding()
            
            List {
                ForEach(self.contacts, id: \.self) { (contact) in
                    BackupContactRow(contact: contact)
                }
            }
            .frame(height: 300)
            
            Spacer()
            
            Button(action: {
                self.contactListPresented.toggle()
            }) {
                Text("Assign Backup Contacts")
                    .font(.system(size: 30, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width / 1.1, height: 50)
                    .background(Color(#colorLiteral(red: 0, green: 0.9803921569, blue: 0.5960784314, alpha: 1)))
                    .clipShape(Capsule())
            }
            
            Spacer()
        }
        .sheet(isPresented: self.$contactListPresented) {
            EmbeddedContactPicker(contacts: self.$contacts, isMainContact: self.$isMainContact, isPresented: self.$contactListPresented)
        }
    }
}

struct AssignBackupContactsView_Previews: PreviewProvider {
    static var previews: some View {
        AssignBackupContactsView(contacts: .constant([]))
    }
}

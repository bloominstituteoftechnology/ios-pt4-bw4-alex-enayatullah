//
//  AssignMainContactView.swift
//  GameSafe
//
//  Created by Alex Shillingford on 6/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI

struct AssignMainContactView: View {
    @Binding var contacts: [Contact]
    @State var contactListPresented = false
    @State var isMainContact = true
    @State var favoriteContact: Contact?
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Main Contact")
                    .font(.largeTitle).bold()
                Spacer()
            }
            .padding()
            
            Text(self.favoriteContact?.name ?? "No Main Contact Assigned") // Contact given name
                .font(.headline).bold()
                .padding()
            
            Text(self.favoriteContact?.phoneNumber ?? "No phone number found") // Contact phone number
                .padding(.bottom, UIScreen.main.bounds.height / 4)
            
            
            Button(action: {
                self.contactListPresented.toggle()
            }) {
                Text("Assign Main Contact")
                    .font(.system(size: 30, weight: .semibold, design: .default))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width / 1.1, height: 50)
                    .background(Color(#colorLiteral(red: 0, green: 0.9803921569, blue: 0.5960784314, alpha: 1)))
                    .clipShape(Capsule())
            }
            
            Spacer()
        }
        .sheet(isPresented: self.$contactListPresented, onDismiss: {
            self.favoriteContactAssigner()
        }, content: {
            EmbeddedContactPicker(contacts: self.$contacts, isMainContact: self.$isMainContact, isPresented: self.$contactListPresented)
        })
        .onAppear {
            self.favoriteContactAssigner()
        }
    }
    
    func favoriteContactAssigner() {
        for contact in contacts {
            if contact.isMainContact {
                self.favoriteContact = contact
            }
        }
    }
}

struct AssignMainContactView_Previews: PreviewProvider {
    static var previews: some View {
        AssignMainContactView(contacts: .constant([]))
    }
}

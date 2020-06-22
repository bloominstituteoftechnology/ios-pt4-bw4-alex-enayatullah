//
//  Settings.swift
//  GameSafe
//
//  Created by Alex Shillingford on 6/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @Binding var contacts: [Contact]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 1) {
                    NavigationLink(destination: AssignMainContactView(contacts: self.$contacts)) {
                        SettingsOptionRow(setting: "Main Contact")
                    }
                    SettingsOptionRow(setting: "Backup Contacts")
                }
                .padding(.top, 1)
                .padding(.bottom, 30)
                
                VStack(spacing: 1) {
                    HStack {
                        Text("Difficulty")
                            .font(.title).bold()
                        Spacer()
                    }
                    .frame(height: 50)
                    .padding(.horizontal)
                    
                    SettingsOptionRow(setting: "Easy")
                    SettingsOptionRow(setting: "Medium")
                    SettingsOptionRow(setting: "Hard")
                }
                .padding(.bottom, 30)
                
                VStack(spacing: 1) {
                    HStack {
                        Text("Resources")
                            .font(.title).bold()
                        Spacer()
                    }
                    .frame(height: 50)
                    .padding(.horizontal)
                    
                    SettingsOptionRow(setting: "Review Instructions")
                }
            }
            .background(Color(#colorLiteral(red: 0.9561466575, green: 0.9561466575, blue: 0.9561466575, alpha: 1)))
            .navigationBarTitle("Settings")
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(contacts: .constant([]))
    }
}

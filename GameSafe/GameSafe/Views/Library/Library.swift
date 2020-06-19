//
//  Library.swift
//  GameSafe
//
//  Created by Alex Shillingford on 6/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI

struct Library: View {
    @State var difficultySelection = 0
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("High Score")
                        .font(.title).bold()
                    
                    Spacer()
                    
                    Text("0000000000")
                        .font(.title).bold()
                }
                .padding(.horizontal)
                
                HStack {
                    Picker(selection: $difficultySelection, label: Text("What is your favorite color?")) {
                        Text("Easy").tag(0)
                        Text("medium").tag(1)
                        Text("hard").tag(2)
                    }.pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                
                QuickStartButton()
                
                
            }
            .padding(.top, UIScreen.main.bounds.height * 0.1)
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.white)
    }
}

struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library()
    }
}

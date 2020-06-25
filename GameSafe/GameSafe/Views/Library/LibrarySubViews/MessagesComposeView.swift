//
//  MessagesComposeView.swift
//  GameSafe
//
//  Created by Alex Shillingford on 6/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI
import Messages
import MessageUI

struct MessagesComposeView: UIViewControllerRepresentable {
    @Binding var quickStartTapped: Bool
    let message: MSMessage
    let difficulty: String
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<MessagesComposeView>) -> MFMessageComposeViewController {
        let controller = MFMessageComposeViewController()
        controller.message = message
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: MFMessageComposeViewController, context: UIViewControllerRepresentableContext<MessagesComposeView>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        let parent: MessagesComposeView
        
        init(_ parent: MessagesComposeView) {
            self.parent = parent
        }
        
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            switch result {
            case .cancelled:
                print("Message was canceled")
            case .failed:
                print("Message had failed")
            case .sent:
                print("Message was sent")
            default:
                break
            }
        }
    }
}

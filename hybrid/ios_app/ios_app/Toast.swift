//
//  Toast.swift
//  ios_app
//
//  Created by barry on 2025/9/19.
//

import SwiftUI

class Toast: ObservableObject {
    static let shared = Toast()
    
    @Published var isShowing = false
    @Published var message = ""
    
    private var duration: TimeInterval = 2.0
    
    private init() {}
    
    func show(_ message: String, duration: TimeInterval = 2.0) {
        self.message = message
        self.duration = duration
        
        withAnimation {
            self.isShowing = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            withAnimation {
                self.isShowing = false
            }
        }
    }
}

struct ToastView: View {
    @ObservedObject var manager = Toast.shared
    
    var body: some View {
        if manager.isShowing {
            Text(manager.message)
                .padding()
                .background(Color.black.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(8)
                .transition(.move(edge: .bottom).combined(with: .opacity))
                .zIndex(999)
                .padding(.bottom, 50)
        }
    }
}

//
//  ContentView.swift
//  ios_app
//
//  Created by barry on 2025/9/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    NavigationLink("官方的集成方式") {
                        OfficialIntegrationView()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    NavigationLink("FlutterBoost的集成方式") {
                        FlutterBoostIntegrationView()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                }
            }
            ToastView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  OfficialIntegrationView.swift
//  ios_app
//
//  Created by barry on 2025/9/14.
//

import SwiftUI
import Flutter

//struct FlutterViewControllerRepresentable: UIViewControllerRepresentable {
//    @EnvironmentObject var flutterDependencies: FlutterDependencies
//
//    func makeUIViewController(context: Context) -> some UIViewController {
//        FlutterViewController(
//            engine: flutterDependencies.flutterEngine,
//            nibName: nil,
//            bundle: nil
//        )
//    }
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
//}

struct FlutterViewControllerRepresentable: UIViewControllerRepresentable {
    // Access the AppDelegate through the view environment.
    @EnvironmentObject var appDelegate: AppDelegate
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return FlutterViewController(
            engine: appDelegate.flutterEngine,
            nibName: nil,
            bundle: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}


struct OfficialIntegrationView: View {
    var body: some View {
        NavigationLink("跳转Flutter页面") {
            FlutterViewControllerRepresentable()
        }
        .buttonStyle(.borderedProminent)
        .tint(.blue)
    }
}

struct OfficialIntegrationView_Previews: PreviewProvider {
    static var previews: some View {
        OfficialIntegrationView()
    }
}

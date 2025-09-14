//
//  ios_appApp.swift
//  ios_app
//
//  Created by barry on 2025/9/14.
//

import SwiftUI
import Flutter
// The following library connects plugins with iOS platform code to this app.
import FlutterPluginRegistrant

//class FlutterDependencies: ObservableObject {
//    let flutterEngine = FlutterEngine(name: "my flutter engine")
//
//    init() {
//        // Runs the default Dart entrypoint with a default Flutter route.
//        flutterEngine.run()
//        // Connects plugins with iOS platform code to this app.
//        GeneratedPluginRegistrant.register(with: self.flutterEngine)
//    }
//}
//
//
//@main
//struct ios_appApp: App {
//    // flutterDependencies will be injected through the view environment.
//    @StateObject var flutterDependencies = FlutterDependencies()
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environmentObject(flutterDependencies)
//        }
//    }
//}


class AppDelegate: FlutterAppDelegate, ObservableObject {
  let flutterEngine = FlutterEngine(name: "my flutter engine")

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      // Runs the default Dart entrypoint with a default Flutter route.
      flutterEngine.run();
      // Used to connect plugins (only if you have plugins with iOS platform code).
      GeneratedPluginRegistrant.register(with: self.flutterEngine);
      return true;
    }
}

@main
struct MyApp: App {
  // Use this property wrapper to tell SwiftUI
  // it should use the AppDelegate class for the application delegate
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  var body: some Scene {
      WindowGroup {
        ContentView()
      }
  }
}

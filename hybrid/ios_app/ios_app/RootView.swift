//
//  RootView.swift
//  ios_app
//
//  Created by barry on 2025/9/19.
//

import SwiftUI
import flutter_boost

class RootNavigationController: UINavigationController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController, animated: Bool) {
        // SwiftUI 页面
        if viewController is UIHostingController<ContentView> {
            navigationController.setNavigationBarHidden(true, animated: animated)
            return
        }
        
        // FlutterBoost 页面
        if viewController is FBFlutterViewContainer {
            navigationController.setNavigationBarHidden(true, animated: animated)
            return
        }
        
        // Flutter 页面
        if viewController is FlutterViewController {
            navigationController.setNavigationBarHidden(true, animated: animated)
            return
        }
        
        // 原生页面显示导航栏
        navigationController.setNavigationBarHidden(false, animated: animated)
    }
}

struct RootView: UIViewControllerRepresentable {
    // Access the AppDelegate through the view environment.
    @EnvironmentObject var appDelegate: AppDelegate
    
    func makeUIViewController(context: Context) -> UINavigationController {
        // 把你现有的 ContentView 包成 HostingController
        let hosting = UIHostingController(rootView: ContentView())

        // 用一个 UINavigationController 包裹它
        let nav = RootNavigationController(rootViewController: hosting)
//        nav.navigationBar.isHidden = true

        appDelegate.setBoostDelegate(navigationController: nav)
        return nav
    }

    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // 不需要更新
    }
}


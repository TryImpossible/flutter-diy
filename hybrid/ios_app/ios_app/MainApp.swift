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
import flutter_boost

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
//struct MainApp: App {
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
    
    // 保留 boostDelegate 以便后续注入 navigationController
    private var boostDelegate: BoostDelegate?
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Runs the default Dart entrypoint with a default Flutter route.
            flutterEngine.run(withEntrypoint: nil, libraryURI: nil, initialRoute: nil, entrypointArgs: ["--mode=official"])
            // Used to connect plugins (only if you have plugins with iOS platform code).
            GeneratedPluginRegistrant.register(with: self.flutterEngine);
            
            //创建代理，做初始化操作
            let delegate = BoostDelegate()
            self.boostDelegate = delegate
            let options = FlutterBoostSetupOptions.createDefault()!
            options.dartEntryPointArgs = ["--mode=flutterboost"]
            options.warmUpEngine = false
            FlutterBoost.instance().setup(application, delegate: delegate, callback: { engine in
                print("futter boost engine is ready")
            }, options: options)
            return true;
        }
    
    public func setBoostDelegate(navigationController: UINavigationController?) {
        boostDelegate?.navigationController = navigationController
    }
}

class BoostDelegate: NSObject, FlutterBoostDelegate {
    
    ///您用来push的导航栏
    var navigationController:UINavigationController?
    
    ///用来存返回flutter侧返回结果的表
    var resultTable:Dictionary<String,([AnyHashable:Any]?)->Void> = [:];
    
    func pushNativeRoute(_ pageName: String!, arguments: [AnyHashable : Any]!) {
        if (pageName.isEmpty) {
            return
        }
        
        var targetViewController = UIViewController()
        //这里根据pageName来判断生成哪个vc，这里给个默认的了
        if (pageName == "/native-page") {
            let controller = OtherViewController()
            controller.data = arguments["data"] as? String ?? ""
            
            targetViewController = controller
        }
        
        //可以用参数来控制是push还是pop
        let isPresent = arguments["isPresent"] as? Bool ?? false
        let isAnimated = arguments["isAnimated"] as? Bool ?? true
        
        if(isPresent){
            self.navigationController?.present(targetViewController, animated: isAnimated, completion: nil)
        }else{
            self.navigationController?.pushViewController(targetViewController, animated: isAnimated)
        }
    }
    
    func pushFlutterRoute(_ options: FlutterBoostRouteOptions!) {
        let vc:FBFlutterViewContainer = FBFlutterViewContainer()
        vc.setName(options.pageName, uniqueId: options.uniqueId, params: options.arguments,opaque: options.opaque)
        
        //用参数来控制是push还是pop
        let isPresent = (options.arguments?["isPresent"] as? Bool)  ?? false
        let isAnimated = (options.arguments?["isAnimated"] as? Bool) ?? true
        
        //对这个页面设置结果
        resultTable[options.pageName] = options.onPageFinished;
        
        //如果是present模式 ，或者要不透明模式，那么就需要以present模式打开页面
        if(isPresent || !options.opaque){
            self.navigationController?.present(vc, animated: isAnimated, completion: nil)
        }else{
            self.navigationController?.pushViewController(vc, animated: isAnimated)
        }
    }
    
    func popRoute(_ options: FlutterBoostRouteOptions!) {
        //如果当前被present的vc是container，那么就执行dismiss逻辑
        if let vc = self.navigationController?.presentedViewController as? FBFlutterViewContainer,vc.uniqueIDString() == options.uniqueId{
            
            //这里分为两种情况，由于UIModalPresentationOverFullScreen下，生命周期显示会有问题
            //所以需要手动调用的场景，从而使下面底部的vc调用viewAppear相关逻辑
            if vc.modalPresentationStyle == .overFullScreen {
                
                //这里手动beginAppearanceTransition触发页面生命周期
                self.navigationController?.topViewController?.beginAppearanceTransition(true, animated: false)
                
                vc.dismiss(animated: true) {
                    self.navigationController?.topViewController?.endAppearanceTransition()
                }
            }else{
                //正常场景，直接dismiss
                vc.dismiss(animated: true, completion: nil)
            }
        }else{
            self.navigationController?.popViewController(animated: true)
        }
        //否则直接执行pop逻辑
        //这里在pop的时候将参数带出,并且从结果表中移除
        if let onPageFinshed = resultTable[options.pageName] {
            onPageFinshed(options.arguments)
            resultTable.removeValue(forKey: options.pageName)
        }
    }
}

@main
struct MainApp: App {
    // Use this property wrapper to tell SwiftUI
    // it should use the AppDelegate class for the application delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootView().edgesIgnoringSafeArea(.all)
        }
    }
}

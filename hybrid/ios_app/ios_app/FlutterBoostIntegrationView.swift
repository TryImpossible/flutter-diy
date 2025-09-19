//
//  FlutterBoostIntegrationView.swift
//  ios_app
//
//  Created by barry on 2025/9/17.
//

import SwiftUI
import Flutter
import flutter_boost

struct FlutterBoostIntegrationView: View {
    @State private var showAlert = true
    
    var body: some View {
        Button("跳转Flutter页面", action: gotoFlutter)
            .buttonStyle(.borderedProminent)
            .tint(.blue)
    }
    
    private func gotoFlutter() {
        print("Hello, World!")
        let options = FlutterBoostRouteOptions()
        options.pageName = "/main-page"
        options.arguments = ["data" :"来自原生的数据"]
        
        //页面是否透明（用于透明弹窗场景），若不设置，默认情况下为true
        options.opaque = true
        
        //这个是push操作完成的回调，而不是页面关闭的回调！！！！
        options.completion = { completion in
            print("open operation is completed")
        }
        
        //这个是页面关闭并且返回数据的回调，回调实际需要根据您的Delegate中的popRoute来调用
        options.onPageFinished = { dic in
            print("\(String(describing: dic))")
            Toast.shared.show("\(String(describing: dic))", duration: 1.0)
        }
        
        FlutterBoost.instance().open(options)
    }
}

struct FlutterBoostIntegrationView_Previews: PreviewProvider {
    static var previews: some View {
        FlutterBoostIntegrationView()
    }
}

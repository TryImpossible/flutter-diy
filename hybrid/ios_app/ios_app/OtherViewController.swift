//
//  OtherView.swift
//  ios_app
//
//  Created by barry on 2025/9/19.
//

import UIKit
import flutter_boost

class OtherViewController : UIViewController {
    
    // 添加一个可选字符串属性
    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white // 设置背景色
        
        // 创建一个 UILabel
        let label = UILabel()
        label.text = data ?? ""
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        // 添加到 view
        view.addSubview(label)
        
        // 设置居中约束
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        FlutterBoost.instance().sendResultToFlutter(withPageName: "/native-page", arguments: ["data":"原生回复数据给Flutter"]);
    }
}

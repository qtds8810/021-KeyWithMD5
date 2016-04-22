//
//  ViewController.swift
//  021-KeyWithMD5
//
//  Created by zhaoyou on 16/4/22.
//  Copyright © 2016年 zhaoyouwang. All rights reserved.
//

import UIKit
import CryptoSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupData()
    }

    private func setupData() {
        let host = "http://www.51zhaoyou.com/api?userid=13000000000&area=上 海&version=200"
        
        toEncrypt(host)
    }
    /**
     加密
     */
    private func toEncrypt(text: String?) {
        let arr = text?.componentsSeparatedByString("?")
        let paramsUrl = arr?.last//取出参数
        let keysWithValuesArr = paramsUrl!.componentsSeparatedByString("&")
        print(keysWithValuesArr)
        
        let sortedArr = keysWithValuesArr.sort(<)
        print("数组升序排序-----\(sortedArr)")
        
        var newStr = sortedArr.first!
        for i in 1..<sortedArr.count {
            newStr = newStr + "&" + sortedArr[i]
        }
        let newStr2 = newStr + "@app"
        let newStr3 = newStr2.stringByReplacingOccurrencesOfString("=", withString: "")
        print(newStr3)
        
        print(newStr3.toMd5())//自己扩展
        print(newStr3.md5())//第三方使用
    }


}


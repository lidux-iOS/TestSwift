//
//  TestAESViewController.swift
//  TestSwift
//
//  Created by dx l on 2019/2/12.
//  Copyright © 2019 dx l. All rights reserved.
//

import UIKit
import CommonCrypto

class TestAESViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        datsCrypt_aes()
    }
    

    
    func datsCrypt_aes() {
        
        /**
         *  op: 操作方式 ，加密：kCCEncrypt；解密：kCCDecrypt
         *  alg: 加密方式：
                 kCCAlgorithmAES128 = 0, /* Deprecated, name phased out due to ambiguity with key size */
                 kCCAlgorithmAES = 0,
                 kCCAlgorithmDES,
                 kCCAlgorithm3DES,
                 kCCAlgorithmCAST,
                 kCCAlgorithmRC4,
                 kCCAlgorithmRC2,
                 kCCAlgorithmBlowfish
         *  options：
                kCCOptionPKCS7Padding   = 0x0001,
                kCCOptionECBMode
         *
         *
         *
         *
         *
         *
         *
         *       CCCrypt(<#T##op: CCOperation##CCOperation#>, <#T##alg: CCAlgorithm##CCAlgorithm#>, <#T##options: CCOptions##CCOptions#>, <#T##key: UnsafeRawPointer!##UnsafeRawPointer!#>, <#T##keyLength: Int##Int#>, <#T##iv: UnsafeRawPointer!##UnsafeRawPointer!#>, <#T##dataIn: UnsafeRawPointer!##UnsafeRawPointer!#>, <#T##dataInLength: Int##Int#>, <#T##dataOut: UnsafeMutableRawPointer!##UnsafeMutableRawPointer!#>, <#T##dataOutAvailable: Int##Int#>, <#T##dataOutMoved: UnsafeMutablePointer<Int>!##UnsafeMutablePointer<Int>!#>)
         */
        
        
        let targetStr = "asdfghjkl"
        let targetData = targetStr.data(using: .utf8)
        // 密码、偏移量、填充、加密模式
        var encoded: [UInt8] = []
        do {
            encoded = try AES.init(key: "ts1ngz0ne2015NO1", iv: "0102030405060708", padding: .zeroPadding) .encrypt(targetData!.bytes)
        } catch {
            //hSPfYMSNswB9yRx8QBR/Cw==
        }
        let str = Data(encoded).base64EncodedString()
        print(str)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

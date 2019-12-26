//
//  ViewController.swift
//  testMaterial
//
//  Created by miguel tomairo on 12/3/19.
//  Copyright © 2019 miguel tomairo. All rights reserved.
//

import UIKit
import MaterialComponents

class ViewController: UIViewController {

//    @IBOutlet weak var containerView: UIView!
//    var textFieldControllerFloating: MDCTextInputControllerUnderline!
//    var textField2: MDCTextInputControllerOutlined!
    
    let button = MDCButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let textFieldFloating = MDCMultilineTextField()
//        textFieldFloating.textView?.delegate = self
//        textFieldFloating.placeholder = "Enter UserName"
//        textFieldFloating.expandsOnOverflow = false
//        textFieldControllerFloating = MDCTextInputControllerUnderline(textInput: textFieldFloating)
//        textFieldControllerFloating.characterCountMax = 15
//        textFieldControllerFloating.floatingPlaceholderActiveColor = UIColor.lightGray
//        textFieldControllerFloating.errorColor = .red
//
//        textFieldFloating.backgroundColor = .yellow
//        textFieldFloating.frame = CGRect(x: 30, y: 200, width: 250, height: 52)
//        view.addSubview(textFieldFloating)
        
        button.setElevation(ShadowElevation(rawValue: 6), for: .normal)
        button.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
        
        
        view.addSubview(button)
        
    }

}

//extension ViewController: UITextViewDelegate{
//    func textViewDidChange(_ textView: UITextView) {
//        let txt = textView.text.trimmingCharacters(in: .whitespaces)
//        textFieldControllerFloating.isFloatingEnabled = !txt.isEmpty
//    }
//}


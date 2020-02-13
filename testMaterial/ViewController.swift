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

    @IBOutlet weak var textFieldFloating: MDCMultilineTextField!
    @IBOutlet weak var alturaTextView: NSLayoutConstraint!
    
    var textFieldControllerFloating: MDCTextInputControllerOutlinedTextArea!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldFloating.textView?.delegate = self
            
        textFieldFloating.textView?.textContainer.maximumNumberOfLines = 4
        textFieldFloating.textView?.textContainer.lineBreakMode = .byWordWrapping

        textFieldFloating.placeholder = "Enter UserName"
        textFieldFloating.expandsOnOverflow = true
        
        
        textFieldFloating.layoutDelegate = self
        textFieldFloating.clearButtonMode = .never
        
        textFieldFloating.textView?.translatesAutoresizingMaskIntoConstraints = false
        textFieldFloating.textView?.sizeToFit()
        textFieldFloating.textView?.isScrollEnabled = false
        
        
        textFieldControllerFloating = MDCTextInputControllerOutlinedTextArea(textInput: textFieldFloating)
        textFieldControllerFloating.characterCountMax = 100
        textFieldControllerFloating.floatingPlaceholderActiveColor = UIColor.blue
        textFieldControllerFloating.errorColor = .red
        textFieldControllerFloating.isFloatingEnabled = true


//        NSLayoutConstraint(item: textFieldFloating.textView!, attribute: .bottom, relatedBy: .equal, toItem: textFieldFloating.borderView, attribute: .bottom, multiplier: 1.0, constant: -30).isActive = true

        textFieldFloating.backgroundColor = .white
        
//        textFieldFloating.translatesAutoresizingMaskIntoConstraints = false
//        let safeArea = view.safeAreaLayoutGuide
//        NSLayoutConstraint.activate([
//            textFieldFloating.topAnchor.constraint(equalTo: safeArea.topAnchor),
//            textFieldFloating.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
//            textFieldFloating.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
//        ])
        
//        textFieldFloating.frame = CGRect(x: 50, y: 200, width: 250, height: 100)
//        view.addSubview(textFieldFloating)
        
//        button.setElevation(ShadowElevation(rawValue: 6), for: .normal)
//        button.setElevation(ShadowElevation(rawValue: 12), for: .highlighted)
                
    }

}

extension ViewController: UITextViewDelegate{

    func textViewDidChange(_ textView: UITextView) {
        if textView.contentSize.height >= 200 {
            textView.isScrollEnabled = true
        }else {
            textView.frame.size.height = textView.contentSize.height
            textView.isScrollEnabled = false
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            let existingLines = textView.text.components(separatedBy: CharacterSet.newlines)
            let newLines = text.components(separatedBy: CharacterSet.newlines)
            let linesAfterChange = existingLines.count + newLines.count - 1
            if(text == "\n") {
                return linesAfterChange <= textView.textContainer.maximumNumberOfLines
            }

            let newText = (textView.text as NSString).replacingCharacters(in: range, with: text)
            let numberOfChars = newText.count
            return numberOfChars <= 101
    }
    
}

extension ViewController: MDCMultilineTextInputLayoutDelegate {
    
    func multilineTextField(_ multilineTextField: MDCMultilineTextInput, didChangeContentSize size: CGSize) {
        print("miguel: \(size)")
        alturaTextView.constant = size.height
    }
}

class MyMultilineTextField: MDCMultilineTextField {

    private var controller: MDCTextInputControllerOutlinedTextArea?
    private var placeholderText: String

    init(placeholder: String) {
        self.placeholderText = placeholder

        super.init(frame: .zero)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
        clearButtonMode = .whileEditing

        controller = MDCTextInputControllerOutlinedTextArea(textInput: self)
        controller?.placeholderText = placeholderText
    }
}

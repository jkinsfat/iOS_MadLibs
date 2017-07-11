//
//  grammarViewController.swift
//  madlibs
//
//  Created by Jason Kinsfather on 7/11/17.
//  Copyright © 2017 Jason Kinsfather. All rights reserved.
//

import Foundation
import UIKit
protocol grammarViewControllerDelegate: class {
    func grammarViewControllerDidCancel(_ controller: grammarViewController)
    func grammarViewController(_ controller: grammarViewController, didFinishEntering words: [String])
}
class grammarViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var textInputs: [UITextField]!
    @IBOutlet weak var submitButton: UIButton!
    
    weak var delegate: grammarViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<textInputs.count {
            textInputs[i].delegate = self
        }
//        submitButton.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        if newText.length > 0 {
            submitButton.isEnabled = true
        } else {
            submitButton.isEnabled = false
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text!.characters.count == 0 {
            return false
        }
        textField.resignFirstResponder()
        return false
    }
    @IBAction func done(_ sender: UIButton) {
        var words = [String]()
        for i in 0..<textInputs.count {
            words.append(textInputs[i].text!)
        }
        delegate?.grammarViewController(self, didFinishEntering: words)
        dismiss(animated: true, completion: nil)
    }
}

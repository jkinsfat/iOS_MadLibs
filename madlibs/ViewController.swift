//
//  ViewController.swift
//  madlibs
//
//  Created by Jason Kinsfather on 7/11/17.
//  Copyright © 2017 Jason Kinsfather. All rights reserved.
//

import UIKit

class ViewController: UIViewController, grammarViewControllerDelegate {

    @IBOutlet weak var sentenceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func composeButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "composeModal", sender: sender)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! grammarViewController
        controller.delegate = self
    }
    func grammarViewControllerDidCancel(_ controller: grammarViewController) {

    }
    func grammarViewController(_ controller: grammarViewController, didFinishEntering words: [String]) {
        sentenceLabel.text = "We are having a perfectly \(words[0]) time now. Later we will \(words[1]) and \(words[2]) in the \(words[3])"
    }

}


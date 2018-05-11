//
//  ResultViewController.swift
//  Quiz
//
//  Created by MauTsujimura on 2018/01/07.
//  Copyright © 2018年 MauTsujimura. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var correctAnswer: Int = 0
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLabel.text = String(correctAnswer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?
            .dismiss(animated: true, completion: nil)
    }
    

}

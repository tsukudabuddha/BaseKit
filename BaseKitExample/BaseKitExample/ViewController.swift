//
//  ViewController.swift
//  BaseKitExample
//
//  Created by Andrew Tsukuda on 2/9/20.
//  Copyright © 2020 Andrew Tsukuda. All rights reserved.
//

import BaseKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let exampleView = ExampleView()
        view.addSubview(exampleView)
        exampleView.pinToSuperview()
    }


}


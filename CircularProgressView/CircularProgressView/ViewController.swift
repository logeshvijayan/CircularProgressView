//
//  ViewController.swift
//  CircularProgressView
//
//  Created by logesh on 1/21/20.
//  Copyright © 2020 logesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var circleView = UICircularProgressView()
    override func viewDidLoad() {
        super.viewDidLoad()
        circleView.updateProgress(progress: 30)
        self.view.addSubview(circleView)
        // Do any additional setup after loading the view.
    }


}


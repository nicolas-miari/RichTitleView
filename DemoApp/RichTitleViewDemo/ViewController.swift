//
//  ViewController.swift
//  RichTitleView Demo
//
//  Created by Nicolás Miari on 2017/03/31.
//  Copyright © 2017 nicolasmiari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func changeTitle(_ sender: Any) {

        guard let titleView = self.navigationItem.titleView as? RichTitleView else {
            return
        }

        titleView.title = "Other"
    }

}


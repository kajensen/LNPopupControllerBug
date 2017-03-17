//
//  FirstViewController.swift
//  LNPopupControllerBug
//
//  Created by Kurt Jensen on 3/16/17.
//  Copyright © 2017 Arbor Apps. All rights reserved.
//

import UIKit
import LNPopupController

class FirstViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let vc = TableViewController()
        vc.view.backgroundColor = UIColor.blue
        let nc = UINavigationController(rootViewController: vc)
        tabBarController?.presentPopupBar(withContentViewController: nc, openPopup: true, animated: true, completion: nil)
    }

}


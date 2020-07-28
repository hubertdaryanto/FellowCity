//
//  ViewController.swift
//  BisaRenameGakYa
//
//  Created by Hubert Daryanto on 06/07/20.
//  Copyright © 2020 Hubert Daryanto. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //print("gak jadi gaes, soalnya jalans")
        
        
        let controller = UIHostingController(rootView: AppView())
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChild(controller)
        self.view.addSubview(controller.view)
        controller.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            controller.view.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            controller.view.heightAnchor.constraint(equalTo: self.view.heightAnchor),
            controller.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            controller.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
    }


}


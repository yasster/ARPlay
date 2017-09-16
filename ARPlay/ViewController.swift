//
//  ViewController.swift
//  ARPlay
//
//  Created by Alireza Alidousti on 2017-09-15.
//  Copyright © 2017 SFU. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ViewController: UIViewController {
    let origin = CoordinateSystem() // Model
    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


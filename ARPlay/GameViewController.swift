//
//  GameViewController.swift
//  ARPlay
//
//  Created by Alireza Alidousti on 2017-09-16.
//  Copyright © 2017 SFU. All rights reserved.
//

import UIKit
import SceneKit
import ARKit


class GameViewController: UIViewController,ARSCNViewDelegate {
    let game = Game() // Model
    
    @IBOutlet weak var sceneView: ARSCNView!

    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        sceneView.scene = SCNScene()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        addGrid();
    }
    
//    private func mapSpace(){
//        var store: [SCNNode] = []
//        for (x, slice) in game.space.enumerated() {
//            for (y, axis) in slice.enumerated() {
//                for (z, color) in axis.enumerated(){
//                    let cube: SCNNode
//                    switch color{
//                    case .Blue :
//                        cube =  cubeNode(0.03, color: UIColor.blue)
//                    case .Red :
//                        cube = cubeNode(0.03, color: UIColor.red)
//                    case .Green :
//                        cube = cubeNode(0.03, color: UIColor.green)
//                    case .Yellow :
//                        cube = cubeNode(0.03, color: UIColor.yellow)
//                    }
//                    cube.position = SCNVector3(cubeLength * Double(x), cubeLength * Double(y), cubeLength * Double(z))
//                    store.append(cube)
//                }
//            }
//        }
//        for node in store {
//            sceneView.scene.rootNode.addChildNode(node)
//        }
//    }
    
//    func cubeNode(_ scale: CGFloat,color: UIColor)->SCNNode{
//        let cubeGeometry = SCNBox(width: scale, height: scale, length: scale, chamferRadius: 0.0)
//
//        let material = SCNMaterial()
//        material.diffuse.contents = color
//        cubeGeometry.materials = [material]
//
//        return SCNNode(geometry: cubeGeometry)
//    }
    
    let cubeLength = 0.1
    let cudeDimontions = (x: 10, y: 10, z: 20)
    
    func addGrid(){
        
    }
}

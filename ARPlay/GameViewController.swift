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
    
//    @IBOutlet weak var rotation: SwipeView!{
//        didSet {
//            let rotationHandler = #selector(self.rotationHandler(byReactingTo:))
//            let rotationRecognizer = UISwipeGestureRecognizer(target: self, action: rotationHandler)
//            rotation.addGestureRecognizer(rotationRecognizer)
//        }
//    }
//
//    @IBOutlet weak var movement: SwipeView!{
//        didSet {
//            let movementHandler = #selector(self.movementHandler(byReactingTo:))
//            let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: movementHandler)
//            movement.addGestureRecognizer(swipeRecognizer)
//        }
//    }
//
//    @objc func movementHandler(byReactingTo swipeRecognizer: UISwipeGestureRecognizer){
//        switch swipeRecognizer.direction {
//        case .right:
//            print("right movement")
//        case .down:
//            break
//        case .up:
//            break
//        case .left:
//            break
//        default:
//            break
//        }
//    }
//
//    @objc func rotationHandler(byReactingTo swipeRecognizer: UISwipeGestureRecognizer){
//        switch swipeRecognizer.direction {
//        case .right:
//            print("right rotation")
//        case .down:
//            break
//        case .up:
//            break
//        case .left:
//            break
//        default:
//            break
//        }
//    }
    
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
//        addGrid();
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
    let cubeDimontions = (x: 10, y: 20, z: 10)
    
    func addGrid(){
        for x in 0...cubeDimontions.x {
            for y in 0...cubeDimontions.y {
                addLine(x: x, y: y, z: nil)
            }
        }
        
        for x in 0...cubeDimontions.x {
            for z in 0...cubeDimontions.z {
                addLine(x: x, y: nil, z: z)
            }
        }
        
        for y in 0...cubeDimontions.y {
            for z in 0...cubeDimontions.z {
                addLine(x: nil, y: y, z: z)
            }
        }
    }
    
//    func addLine(x: Int?, y: Int?, z: Int?){
//        // Y: height,up; X: lenght, right; Z: width, back
//        // https://developer.apple.com/documentation/scenekit/scnbox
//        // https://developer.apple.com/documentation/arkit/arconfiguration.worldalignment/2873776-gravityandheading
//        let material = SCNMaterial()
//        let scale: CGFloat = 0.002
//        material.diffuse.contents = UIColor.black.withAlphaComponent(0.3)
//        if z == nil {
//            let cubeGeometry = SCNBox(width: scale, height: CGFloat(cubeLength * Double(cubeDimontions.z)), length: scale, chamferRadius: 0.0)
//            cubeGeometry.materials = [material]
//            let node = SCNNode(geometry: cubeGeometry)
//            node.position = SCNVector3(Double(x!) * cubeLength, Double(y!) * cubeLength, Double(-cubeGeometry.width) - 0.3)
//            sceneView.scene.rootNode.addChildNode(node)
//        } else if y == nil {
//            let cubeGeometry = SCNBox(width: scale, height: scale, length: CGFloat(cubeLength * Double(cubeDimontions.y)), chamferRadius: 0.0)
//            cubeGeometry.materials = [material]
//            let node = SCNNode(geometry: cubeGeometry)
//            node.position = SCNVector3(Double(x!) * cubeLength, Double(cubeGeometry.height), Double(z!) * cubeLength - 0.3)
//            sceneView.scene.rootNode.addChildNode(node)
//        } else if x == nil {
//            let cubeGeometry = SCNBox(width: CGFloat(cubeLength * Double(cubeDimontions.x)), height: scale, length: scale, chamferRadius: 0.0)
//            cubeGeometry.materials = [material]
//            let node = SCNNode(geometry: cubeGeometry)
//            node.position = SCNVector3(Double(-cubeGeometry.length), Double(z!) * cubeLength, Double(y!) * cubeLength - 0.3)
//            sceneView.scene.rootNode.addChildNode(node)
//        }
//    }
}

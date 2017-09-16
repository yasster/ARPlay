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
    let game = Game()
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
    
    private func blub(arr: [BrainDead])->[SCNNode]{
        return arr.enumerated().map {(z, col) in
            let cube: SCNNode
            switch col{
            case .Blue :
                cube =  cubeNode(0.03, color: UIColor.blue.withAlphaComponent(0.3) )
            case .Red :
                cube = cubeNode(0.03, color: UIColor.red.withAlphaComponent(0.3) )
            case .Green :
                cube = cubeNode(0.03, color: UIColor.green.withAlphaComponent(0.3) )
            case .Yellow :
                cube = cubeNode(0.03, color: UIColor.yellow.withAlphaComponent(0.3) )
            }
            return cube
        }
    }
    
    private func mapSpace()->[SCNNode]{
        var store: [SCNNode] = []
        for (x, slice) in game.space.enumerated() {
            for (y, axis) in slice.enumerated() {
                for (z, color) in axis.enumerated(){
                    let cube: SCNNode
                    switch color{
                    case .Blue :
                        cube =  cubeNode(0.03, color: UIColor.blue.withAlphaComponent(0.3) )
                    case .Red :
                        cube = cubeNode(0.03, color: UIColor.red.withAlphaComponent(0.3) )
                    case .Green :
                        cube = cubeNode(0.03, color: UIColor.green.withAlphaComponent(0.3) )
                    case .Yellow :
                        cube = cubeNode(0.03, color: UIColor.yellow.withAlphaComponent(0.3) )
                    }
                    cube.position = SCNVector3(0.1 * Double(x), 0.1 * Double(y), 0.1 * Double(z))
                    store.append(cube)
                }
            }
        }
    }
    
        
    func cubeNode(_ scale: CGFloat,color: UIColor)->SCNNode{
        let cubeGeometry = SCNBox(width: scale, height: scale, length: scale, chamferRadius: 0.0)
        
        let greenMaterial = SCNMaterial()
        greenMaterial.diffuse.contents = color
        cubeGeometry.materials = [greenMaterial]
        
        return SCNNode(geometry: cubeGeometry)
    }


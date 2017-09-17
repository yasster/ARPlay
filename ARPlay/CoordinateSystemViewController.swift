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

class CoordinateSystemViewController: UIViewController, ARSCNViewDelegate {
    @IBOutlet weak var sceneView: ARSCNView! {
        didSet {
            let panHandler = #selector(CoordinateSystemViewController.moveObject(byReactingTo:))
            let panRecognizer = UIPanGestureRecognizer(target: self, action: panHandler)
            sceneView.addGestureRecognizer(panRecognizer)
        }
    }
    
    var activeMarker: SCNNode?
    var activeMarkerWrapper: SCNNode?
    @objc func moveObject(byReactingTo panRecognizer: UIPanGestureRecognizer){
        let location = panRecognizer.location(in: sceneView)
        switch panRecognizer.state {
        case .began:
            if let node = getARObject(at: location){
                activeMarker = node; break
            }
        case .changed:
            if let anchor = getNewAnchor(at: location){
                sceneView.session.add(anchor: anchor)
                activeMarker?.removeFromParentNode()
                if (activeMarker != nil && activeMarkerWrapper != nil) {
                    activeMarker!.position = SCNVector3(0,0,0)
                    activeMarkerWrapper!.addChildNode(activeMarker!)
                    mapNodeToParent[activeMarker!] = activeMarkerWrapper!
                }
            }
        case .ended:
            activeMarker = nil
            activeMarkerWrapper = nil
        default:
            break
        }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        //When an ARAnchor is added renderrer gets called with the matching SCNNode
        activeMarkerWrapper = node
    }
    
    func getARObject(at location: CGPoint)->SCNNode? {
        // If we hit an AR object
        if let hit = sceneView.hitTest(location, options: nil).first {
            return hit.node
        }
        return nil
    }
    
    func getNewAnchor(at location: CGPoint)->ARAnchor? {
        // Not hitting an AR object
        if let hit = sceneView.hitTest(location, types: .featurePoint).first {
            return ARAnchor(transform: hit.worldTransform)
        }
        return nil
    }
    
    func makeCube(_ scale: CGFloat, color: UIColor)->SCNNode{
        let cubeGeometry = SCNBox(width: scale, height: scale, length: scale, chamferRadius: 0.0)
        
        let greenMaterial = SCNMaterial()
        greenMaterial.diffuse.contents = color
        cubeGeometry.materials = [greenMaterial]
        
        return SCNNode(geometry: cubeGeometry)
    }
    
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
    
    let colors: Dictionary<String, UIColor> = [
        "Red": UIColor.red,
        "Green": UIColor.green,
        "Blue": UIColor.blue,
        "Yellow": UIColor.yellow
    ]
    
    var mapColorToNode: [SCNNode: String] = [:]
    var mapNodeToParent: [SCNNode : SCNNode] = [:]
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        for (key, color) in colors {
            let cube = makeCube(0.03, color: color)
            cube.position = SCNVector3(0.5-CGFloat(Float(arc4random()) / Float(UINT32_MAX)), 0, -1)
            sceneView.scene.rootNode.addChildNode(cube)
            mapColorToNode[cube] = key
            mapNodeToParent[cube] = sceneView.scene.rootNode
        }
    }
}

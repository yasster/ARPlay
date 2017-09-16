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

class CoordinateSystemViewController: UIViewController, ARSCNViewDelegate, ARSessionObserver {
    let origin = CoordinateSystem() // Model
    
    @IBOutlet weak var sceneView: ARSCNView! {
        didSet {
            let handler = #selector(CoordinateSystemViewController.moveObject(byReactingTo:))
            let panRecognizer = UIPanGestureRecognizer(target: self, action: handler)
            sceneView.addGestureRecognizer(panRecognizer)
        }
    }
    
    private var activeMarker: SCNNode?
    private var activeMarkerWrapper: SCNNode?
    @objc func moveObject(byReactingTo panRecognizer: UIPanGestureRecognizer){
        let location = panRecognizer.location(in: sceneView)
        switch panRecognizer.state {
        case .began:
            if let node = getARObject(at: location){
                activeMarker = node; break
            }
            if let anchor = getNewAnchor(at: location){
                sceneView.session.add(anchor: anchor)
                activeMarker = cubeNode()
                activeMarkerWrapper?.addChildNode(activeMarker!)
            }
        case .changed, .ended:
            if let anchor = getNewAnchor(at: location){
                sceneView.session.add(anchor: anchor)
                activeMarker?.removeFromParentNode()
                activeMarkerWrapper?.addChildNode(activeMarker!)
            }
        default:
            break
        }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        //When an ARAnchor is added renderrer gets called with the matching SCNNode
        activeMarkerWrapper = node
    }
    
    private func getARObject(at location: CGPoint)->SCNNode? {
        // If we hit an AR object
        if let hit = sceneView.hitTest(location, options: nil).first {
            return hit.node
        }
        return nil
    }
    
    private func getNewAnchor(at location: CGPoint)->ARAnchor? {
        // Not hitting an AR object
        if let hit = sceneView.hitTest(location, types: .featurePoint).first {
            return ARAnchor(transform: hit.worldTransform)
        }
        return nil
    }
    
    func cubeNode(_ scale: CGFloat = 0.03)->SCNNode{
        let cubeGeometry = SCNBox(width: scale, height: scale, length: scale, chamferRadius: 0.0)
        
        let greenMaterial = SCNMaterial()
        greenMaterial.diffuse.contents = UIColor.green.withAlphaComponent(0.3)
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
}

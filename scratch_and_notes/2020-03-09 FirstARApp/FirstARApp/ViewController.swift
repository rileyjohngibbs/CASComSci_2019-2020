//
//  ViewController.swift
//  FirstARApp
//
//  Created by Riley John Gibbs on 3/8/20.
//  Copyright © 2020 Riley John Gibbs. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sceneView.delegate = self
        let scene = SCNScene(named: "arresources.scnassets/blank.scn")!
        sceneView.scene = scene
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARImageTrackingConfiguration()
        setTrackingImages("TargetImages", for: configuration)
        sceneView.session.run(configuration)
    }
    
    func setTrackingImages(_ groupName: String, for configuration: ARImageTrackingConfiguration) {
        guard let trackingImages = ARReferenceImage.referenceImages(inGroupNamed: groupName, bundle: .main) else {
            print("No images found to add to tracking")
            return
        }
        configuration.trackingImages = trackingImages
        configuration.maximumNumberOfTrackedImages = 3
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sceneView.session.pause()
    }
    
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard let imageAnchor = anchor as? ARImageAnchor else {
            print("The anchor isn't an image")
            return nil
        }
        let node = SCNNode()
        overlayRedaction(on: node, fromAnchor: imageAnchor)
        return node
    }
    
    func overlayRedaction(on node: SCNNode, fromAnchor anchor: ARImageAnchor) {
        let plane = SCNPlane(width: anchor.referenceImage.physicalSize.width, height: anchor.referenceImage.physicalSize.height)
        plane.firstMaterial?.diffuse.contents = UIColor(white: 0.0, alpha: 1.0)
        let planeNode = SCNNode(geometry: plane)
        // planeNode.eulerAngles.x = -.pi / 2
        node.addChildNode(planeNode)
    }

}


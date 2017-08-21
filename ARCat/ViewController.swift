//
//  ViewController.swift
//  ARCat
//
//  Created by Mpalka on 18.08.2017.
//  Copyright © 2017 SoInteractive. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

class ViewController: UIViewController, ARSKViewDelegate {
    
    @IBOutlet var sceneView: ARSKView!
    let catSelectorView: CatSelectorView = CatSelectorView()
    var catType: CatTypes = .first
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and node count
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        // Load the SKScene from 'Scene.sks'
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
        
        self.view.addSubview(self.catSelectorView)
        self.catSelectorView.catSelectionDelegate = self
        //custom catNode init
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingSessionConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    func addCatNode(type: CatTypes) -> SKSpriteNode {
        var catNode: SKSpriteNode = SKSpriteNode()

        switch type {
        case .first:
            catNode = SKSpriteNode(imageNamed: "catNode")
            catNode.size = CGSize(width: 27.8, height: 26.4)
        case .second:
            catNode = SKSpriteNode(imageNamed: "catNode2")
            catNode.size = CGSize(width: 33.6, height: 27.6)
        case .third:
            catNode = SKSpriteNode(imageNamed: "catNode3")
            catNode.size = CGSize(width: 72.0, height: 38.5)
        }
        return catNode
    }
    // MARK: - ARSKViewDelegate
    
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        // Create and configure a node for the anchor added to the view's session.
        return self.addCatNode(type: self.catType)
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}

extension ViewController: CatSelectionProtocol {
    func catSelected(catType: CatTypes) {
        switch catType {
        case .first:
            self.catType = .first
        case .second:
            self.catType = .second
        case .third:
            self.catType = .third
        }
    }
    
    
}

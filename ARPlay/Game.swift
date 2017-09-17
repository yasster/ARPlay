//
//  Game.swift
//  ARPlay
//
//  Created by Alireza Alidousti on 2017-09-16.
//  Copyright © 2017 SFU. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class Position: NSObject {
    var x: Int = 0
    var y: Int = 0
    var z: Int = 0
    var col: Int = 0
    
    init(dict: [String: Int]?){
        if dict != nil {
            self.x = dict!["x"]!
            self.y = dict!["y"]!
            self.z = dict!["z"]!
            self.col = dict!["col"]!
        }
    }
}

class Game {
    var controller: GameViewController?
    var cellPos: [Position] = []
    init() {
        FirebaseApp.configure();
        let ref = Database.database().reference();
        ref.child("actualStateProcssed").observe(.value, with: { (snapshot) in
            self.cellPos = []
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshots {
                    if let posDict = snap.value as? Dictionary<String, Int> {
                        let pos = Position(dict: posDict)
                        self.cellPos.append(pos)
                    }
                }
            }
            self.controller?.mapSpace()
        });
    }
}

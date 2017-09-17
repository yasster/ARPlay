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

class Game {
    init() {
        FirebaseApp.configure();
        var ref = Database.database().reference();
        ref.child("actualState").observe(.value, with: { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            print(postDict);
        });
    }
    
    
//    var store = ref
//        func writeGame(dict: Dictionary<String, AnyObject>) {
//            var gameId = 10
//            var ref = Database.database().reference(withPath: "games/\(gameId)")
//            ref.setValue(dict)
//        }
    
    
}

class Position {
    var x, y, z: Int
    init(x: Int, y: Int, z: Int){
        self.x = x
        self.y = y
        self.z = z
    }
    
}

class Blocks: NSObject {
    var type: Int
    var pos: Position
    var shape: [Position]
    
    init(type: Int, pos: Position, shape: [Position]) {
        self.type = type
        self.pos = pos
        self.shape = shape
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String: String] else { return nil }
        guard let _type  = dict["type"]  else { return nil }
        guard let _pos = dict["position"] else { return nil }
        guard let _shape = dict["shape"] else { return nil }
        
//        if let type = Int(type) {
//            t
//        }
//        self.pos = pos
//        self. = title
//        self.body = body
//        self.starCount = 0 as AnyObject?
    }
    
    convenience override init() {
//        self.init(uid: "", author: "", title: "", body:  "")
    }
}

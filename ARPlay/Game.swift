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
            // ...
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

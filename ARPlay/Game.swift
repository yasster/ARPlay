//
//  Game.swift
//  ARPlay
//
//  Created by Alireza Alidousti on 2017-09-16.
//  Copyright © 2017 SFU. All rights reserved.
//

import Foundation

enum BrainDead {
    case Blue
    case Red
    case Green
    case Yellow
}
class Game {
    
    
    let space: [[[BrainDead]]] = [
        [
            [.Red, .Blue, .Green, .Yellow],
            [.Red, .Red , .Red, .Red],
            [.Blue, .Yellow, .Red, .Red]
            
        ]
    ]
    
}

//
//  Formatter.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 26/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation

class Formatter {
    static func createDistanceString(from distance: Double) -> String {
        var distanceString = ""
        
        if distance > 1000 {
            distanceString = "\(distance / 1000) km"
        }
        else {
            distanceString = "\(distance) m"
        }
        return distanceString
    }

}

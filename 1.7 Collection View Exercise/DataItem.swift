//
//  DataItem.swift
//  1.7 Collection View Exercise
//
//  Created by Isobel Hall on 11/08/2019.
//  Copyright © 2019 Isobel Hall. All rights reserved.
//

import UIKit

class DataItem {
    var title: String
    var kind: Kind
    var imageName: String
    
    init(title: String, kind: Kind, imageName: String) {
        self.title = title
        self.kind = kind
        self.imageName = imageName
    }
}

enum Kind: Int {
    case Fashion
    case Film
    case Default
    
    func description() -> String {
        switch self {
        case .Fashion:
            return "Fashion"
        case .Film:
            return "Film"
        case .Default:
            return "Default"
        }
    }
}

//
//  DataItemHeader.swift
//  1.7 Collection View Exercise
//
//  Created by Isobel Hall on 15/08/2019.
//  Copyright © 2019 Isobel Hall. All rights reserved.
//

import UIKit

class DataItemHeader: UICollectionReusableView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
}

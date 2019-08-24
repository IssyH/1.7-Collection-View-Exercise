//
//  DataItemCell.swift
//  1.7 Collection View Exercise
//
//  Created by Isobel Hall on 11/08/2019.
//  Copyright © 2019 Isobel Hall. All rights reserved.
//

import UIKit

class DataItemCell: UICollectionViewCell {
    
    @IBOutlet private weak var dataItemImageView: UIImageView!
    
    var dataItem: DataItem? {
        didSet {
            if let dataItem = dataItem {
                dataItemImageView.image = UIImage(named: dataItem.imageName)
            }
        }
    }
    
}

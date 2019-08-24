//
//  CollectionViewController.swift
//  1.7 Collection View Exercise
//
//  Created by Isobel Hall on 11/08/2019.
//  Copyright © 2019 Isobel Hall. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    //added variable to show fashion images
    var fashionDataItems = [DataItem]()
    var filmDataItems = [DataItem]()
    var allItems = [[DataItem]]()

    @IBAction func addButtonTapped(_ sender: AnyObject) {
    let item = DataItem(title: "New Item", kind: .Fashion, imageName: "default.jpeg")
    let index = allItems[0].count
        allItems[0].append(item)
        let indexPath = IndexPath(item: index, section: 0)
        collectionView?.insertItems(at: [indexPath])
    

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = collectionView!.frame.width / 3
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        
        for i in 1...6 {
            fashionDataItems.append(DataItem(title: "Fashion #\(i)", kind: Kind.Fashion, imageName: "fashion0\(i).jpeg"))
            print("Fashion index is 0\(i)")
            
        }
        
        for i in 1...6 {
            filmDataItems.append(DataItem(title: "Film #\(i)", kind: Kind.Film, imageName: "film0\(i).jpeg"))
            print("Film index is 0\(i)")
        
    }
            allItems.append(fashionDataItems)
            allItems.append(filmDataItems)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
    
        // Do any additional setup after loading the view.
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! DataItemCell
        let dataItem = allItems[indexPath.section][indexPath.item]
        cell.dataItem = dataItem
        
        return cell
        
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return allItems.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return allItems[section].count
    }


    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! DataItemHeader
        var title = ""
        if let kind = Kind(rawValue: indexPath.section) {
            title = kind.description()
        }
        sectionHeader.title = title
        
        return sectionHeader
    }
    
    //to reorder cells
    override func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = allItems[sourceIndexPath.section][sourceIndexPath.item]
        allItems[sourceIndexPath.section].remove(at: sourceIndexPath.item)
        allItems[destinationIndexPath.section].insert(item, at: destinationIndexPath.item)
        collectionView.reloadData()
        
    }
    //to delete cells
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        func showAlert(title: String)  {
            let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "Yes", style: .default, handler: { (action) in
                self.allItems[indexPath.section].remove(at: indexPath.item)
                self.collectionView?.deleteItems(at: [indexPath])
            }))
            
            alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        let item = allItems[indexPath.section][indexPath.row]
        showAlert(title: "Delete '\(item.kind)'?")
    }
    
}
    
    /*Added new sections to test the drag and drop functionality
}

func collectionView(_: UICollectionView, itemsForAddingTo: UIDragSession, at: IndexPath, point: CGPoint) -> [UIDragItem] {
    
    
}

func collectionView(_: UICollectionView, performDropWidth: UICollectionViewDropCoordinator) {*/
    
    

    
    // MARK: - UICollectionViewDragDelegate
    
    // MARK: UICollectionViewDelegate
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    /*override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */



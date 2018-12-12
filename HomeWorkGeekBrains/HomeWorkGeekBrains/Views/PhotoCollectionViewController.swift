//
//  PhotoCollectionViewController.swift
//  HomeWorkGeekBrains
//
//  Created by Kirill on 05/12/2018.
//  Copyright © 2018 Kirill. All rights reserved.
//

import UIKit

private let reuseIdentifier = "photoCell"

class PhotoCollectionViewController: UICollectionViewController {

    var friends: [UserModal]?
    var isOn = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
      //  self.collectionView!.register(PhotoCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return friends?.first?.photos?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell

        if let friend = friends?.first{
            if let photo = friend.photos?[indexPath.row] {
                cell.photoFriend.image = UIImage(named: photo.photoName!)
                cell.likesLabel.text = String(photo.likesCount!)
                
            }
        }
        cell.likesButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    

    @objc func buttonPressed(_ sender: UIButton) {
        guard  let indexPath = collectionView?.indexPath(for: ((sender.superview?.superview) as! PhotoCollectionViewCell)) else { return }
        
        activateButton(bool: !isOn, indexPath: indexPath)
    }

  
    func activateButton(bool: Bool, indexPath: IndexPath) {
        self.isOn = bool
        if let photo = friends?.first?.photos?[indexPath.row]{

                if !bool {
                    photo.likesCount -= 1
                } else {
                    photo.likesCount += 1
                }
            
            collectionView.reloadData()

            }
    }
    

    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
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

}

//
//  FriendsListTableViewController.swift
//  HomeWorkGeekBrains
//
//  Created by Kirill on 05/12/2018.
//  Copyright © 2018 Kirill. All rights reserved.
//

import UIKit

struct Section {
    let letter : String
    let friends : [UserModal]
}

class FriendsListTableViewController: UITableViewController {

    var friends: [UserModal]?
    var sections = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        friends = [
            UserModal(name: "Vaso", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 20), PhotoModal(photoName: "camera_200", likesCount: 203)]),
            UserModal(name: "Georg", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 100)]),
            UserModal(name: "Misha", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 330)]),
            UserModal(name: "Han", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 4)]),
            UserModal(name: "Anna", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 50)]),
            UserModal(name: "Dima", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 20), PhotoModal(photoName: "camera_200", likesCount: 203)]),
            UserModal(name: "Roma", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 100)]),
            UserModal(name: "Nata", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 330)]),
            UserModal(name: "Tata", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 4)]),
            UserModal(name: "Inna", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 50)]),
            UserModal(name: "Kirill", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 20), PhotoModal(photoName: "camera_200", likesCount: 203)]),
            UserModal(name: "Qwerty", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 100)]),
            UserModal(name: "Boris", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 330)]),
            UserModal(name: "Zoom", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 4)]),
            UserModal(name: "Lesha", image: "camera_200", photos: [PhotoModal(photoName: "habrhabr", likesCount: 50)])]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    
        var groupedDictionary = Dictionary(grouping: friends!, by:{$0.name.prefix(1)})
        let keys = groupedDictionary.keys.sorted()
        sections = keys.map{ Section(letter: String($0), friends: groupedDictionary[$0]!) }
        print(sections)

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sections[section].friends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath) as! FriendsListTableViewCell
        let section = sections[indexPath.section]
        let friend = section.friends[indexPath.row]
        
        cell.name.text = friend.name
        cell.avatar.image = UIImage(named: friend.image)
            
        
        return cell
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.map{$0.letter}
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        //let newItems =
        return sections[section].letter
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "friendSegue"{
            
            var friendsInfo = [UserModal]()
            let friendsFromPhotoCollection = segue.destination as? PhotoCollectionViewController
            
            guard let indexPath  =  self.tableView.indexPathForSelectedRow else { return }
            guard let friend = friends?[indexPath.row] else { return }
            friendsInfo.append(friend)
            friendsFromPhotoCollection?.friends = friendsInfo
            
            
        }
        
    }


}

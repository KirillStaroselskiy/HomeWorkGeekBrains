//
//  FriendModal.swift
//  HomeWorkGeekBrains
//
//  Created by Kirill on 05/12/2018.
//  Copyright © 2018 Kirill. All rights reserved.
//

import UIKit


class UserModal {
    
    var name: String!
    var image: String!
    var photos: [PhotoModal]?
    
    init(name: String, image: String, photos: [PhotoModal]) {
        self.name = name
        self.image = image
        self.photos = photos
    }
    
    
}

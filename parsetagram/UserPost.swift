//
//  UserPost.swift
//  parsetagram
//
//  Created by Dustyn August on 3/5/16.
//  Copyright © 2016 Dustyn August. All rights reserved.
//

import UIKit
import Parse

class UserPost: NSObject {
    
    
    var photo: UIImage?
    var author: PFUser?
    var caption: String?
    var likesCount: Int?
    var commentsCount: Int?
    var name: String?
    var cell: HomeTableViewCell?
    
    init(postObject: PFObject) {
        super.init()
        cell = HomeTableViewCell()
        print("This is it \(postObject)")
        caption = postObject["caption"] as? String
        author = postObject["author"] as! PFUser?

        likesCount = postObject["likesCount"] as? Int
        commentsCount = postObject["commentsCount"] as? Int
        name = postObject["name"] as? String
        
        if let newPhoto = postObject.valueForKey("media")! as? PFFile {
            newPhoto.getDataInBackgroundWithBlock({
                (imageData: NSData?, error: NSError?) -> Void in
                if (error == nil) {
                    let image = UIImage(data: imageData!)
                    
                    self.photo = image
                    
//                    self.cell!.photoImageView.image = image
//                    self.photo = image
//                    
                    self.cell?.userPost = self
                } else {
                    print("ERROR: could not get image \(error?.localizedDescription)")
                }
                }, progressBlock: { (int: Int32) -> Void in
            })
        }
    }
}

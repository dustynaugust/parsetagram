//
//  HomeTableViewCell.swift
//  parsetagram
//
//  Created by Dustyn August on 3/3/16.
//  Copyright © 2016 Dustyn August. All rights reserved.
//

import UIKit
import Parse

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var commentImageView: UIImageView!
    @IBOutlet weak var sentToImageView: UIImageView!
    @IBOutlet weak var handle2Label: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var object: PFObject? {
        didSet {
            userPost = Post(object: object!)
            userPost.cell = self;
        }
    }
    
    var userPost: Post! {
        didSet {
            print("did set caption and image?")
            photoImageView.image = userPost.image
            print("This is the image that is to be set: \(userPost.image)")
            captionLabel.text = userPost.caption
            handleLabel.text = userPost.author?.username
            handle2Label.text = userPost.author?.username
            
            print("")
            print("the user is: ")
            print(userPost.author?.username)
            print("")

        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

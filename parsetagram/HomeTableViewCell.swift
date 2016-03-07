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
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var commentImageView: UIImageView!
    @IBOutlet weak var sentToImageView: UIImageView!
    @IBOutlet weak var handle2Label: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    let captionCheck  = "Enter caption..."

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var postsObject: PFObject? {
        didSet {
            post = Post(postObject: postsObject!)
            post.cell = self;
        }
    }
    
    var post: Post! {
        didSet {
            photoImageView.image = post.photo
            print("This is the image that is to be set: \(post.photo)")
            // this causes the nil crash!! so userPost.photo must be nil...
            print("This is the image that is to be set: \((post.photo)!)")

            
            if post.caption == captionCheck {
                captionLabel.text = ""
            } else {
                captionLabel.text = post.caption
            }
            print("the caption is: \((captionLabel.text)!)")
            
            handleLabel.text = post.author?.username
            handle2Label.text = post.author?.username
            print("the user is: \((handleLabel.text)!)")
            print("")
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

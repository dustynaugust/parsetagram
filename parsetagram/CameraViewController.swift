//
//  CameraViewController.swift
//  parsetagram
//
//  Created by Dustyn August on 3/2/16.
//  Copyright © 2016 Dustyn August. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate {

    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var photoLibraryButton: UIButton!
    @IBOutlet weak var captionTextView: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
    let imgPickControl = UIImagePickerController()
    var image = UIImage()


    
    override func viewDidLoad() {
        
        captionTextView.delegate = self
        captionTextView.text = "Enter caption..."
        captionTextView.textColor = UIColor.lightGrayColor()
        
        imgPickControl.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            
            // Do something with the images (based on your use case)
            photoImageView.image = editedImage
            
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onCameraButton(sender: AnyObject) {
        imgPickControl.delegate = self
        imgPickControl.allowsEditing = true
        imgPickControl.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(imgPickControl, animated: true, completion: nil)
    }

    
    @IBAction func onPhotoLibrarybutton(sender: AnyObject) {
        imgPickControl.delegate = self
        imgPickControl.allowsEditing = true
        imgPickControl.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(imgPickControl, animated: true, completion: nil)
    }
    
    
     @IBAction func onSubmitButton(sender: AnyObject) {
        
        let newImage = Post.resize(image, newSize: CGSize(width: 300, height: 500))
        
        Post.postUserImage(newImage, withCaption: captionTextView.text) { (success: Bool, error: NSError?) -> Void in
            if success {
                self.photoImageView.image = nil
                self.captionTextView.text = nil
                self.tabBarController?.selectedIndex = 0
            } else {
                print("error in submit")
            }
        }
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        if captionTextView.textColor == UIColor.lightGrayColor() {
            captionTextView.text = nil
            captionTextView.textColor = UIColor.blackColor()
        }
    }
    
   

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
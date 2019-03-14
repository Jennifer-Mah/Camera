//  ViewController.swift
//  My Camera App
//
//  Created by Jennifer Mah on 2/26/19.
//  Copyright © 2019 Jennifer Mah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var PhotoLibrary: UIButton!
    @IBOutlet var Camera: UIButton!
    @IBOutlet var ImageDisplay: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

//    Acess camera library
    @IBAction func PhotoLibraryAction(_ sender: UIButton) {
        
        let picker=UIImagePickerController()
        
        picker.delegate=self
        picker.sourceType = .photoLibrary
        
        present(picker,animated: true,completion: nil)
    }
    
// Acess the camera
    @IBAction func CameraAction(_ sender: UIButton) {
        let picker=UIImagePickerController()
        picker.delegate=self
        picker.sourceType = .camera
        present(picker,animated: true,completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        ImageDisplay.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }


}

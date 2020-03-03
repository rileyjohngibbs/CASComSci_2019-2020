//
//  ViewController.swift
//  CameraFilter
//
//  Created by Dani Lubezki on 3/3/20.
//  Copyright © 2020 Dani Lubezki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBAction func Button(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            self.dismiss(animated: true, completion: nil)
            let image = info[UIImagePickerController.InfoKey.originalImage]as! UIImage
            imageView.image = image
        
            let inputImage = image
            let context = CIContext(options: nil)
            
            if let filter = CIFilter(name: "CISepiaTone") {
                let beginImage = CIImage(image: inputImage)
                filter.setDefaults()
                filter.setValue(beginImage, forKey: kCIInputImageKey)
                
                if let output = filter.outputImage {
                    if let cgimg = context.createCGImage(output, from: output.extent) {
                        let processedImage = UIImage(cgImage: CGImage)
                        imageView.image = processedImage
                    }
                }
            }
            
            
        }
    }
    


}


//
//  ViewController.swift
//  ContactsClone
//
//  Created by Riley John Gibbs on 2/16/20.
//  Copyright © 2020 Riley John Gibbs. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var takerController: UIImagePickerController!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AVCaptureDevice.requestAccess(for: .video, completionHandler: {(_) in return})
    }

    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        fuckMe()
    }
    
    func fuckMe() {
        takerController = UIImagePickerController()
        takerController.delegate = self
        takerController.sourceType = .camera
        present(takerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        takerController.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
    }
    
}


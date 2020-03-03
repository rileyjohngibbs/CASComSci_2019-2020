//
//  ViewController.swift
//  photoTaker
//
//  Created by Dani Lubezki on 2/20/20.
//  Copyright © 2020 Dani Lubezki. All rights reserved.
//
import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var takerController: UIImagePickerController!
    var photos: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                }
            }
            
        default:
            return
        }
    }
    @IBAction func cameraButton(_ sender: Any) {
        takeIt()
    }
   
    func takeIt() {
        takerController = UIImagePickerController()
        takerController.delegate = self
        takerController.sourceType = .camera
        present(takerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController( _ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        takerController.dismiss(animated: true, completion: nil)
        imageView.image = info[.originalImage] as? UIImage
        let image = info[.originalImage] as? UIImage
        photos.append(image!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if let  gallery = segue.destination as? picViewController, let sender = sender as? UIButton  {
            if sender == Button {
                gallery.images = photos
            }
                  
                  
              }
    }
}

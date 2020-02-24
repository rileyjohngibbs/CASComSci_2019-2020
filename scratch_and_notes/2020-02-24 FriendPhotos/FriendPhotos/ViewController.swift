//
//  ViewController.swift
//  FriendPhotos
//
//  Created by Riley John Gibbs on 2/23/20.
//  Copyright © 2020 Riley John Gibbs. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    var contacts: [FriendPhoto] = []
    var takerController: UIImagePickerController!
    var newestPhoto: UIImage?
    
    @IBOutlet weak var photosScrollView: UIScrollView!
    @IBOutlet weak var photosStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let viewFrame = self.view.frame
        photosScrollView.frame = CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: viewFrame.height)
    }
    
    @IBAction func newImagePress(_ sender: UIBarButtonItem) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                self.takePhoto()
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        self.takePhoto()
                    }
                }
            default:
                return
        }
    }
    
    func takePhoto() {
        takerController = UIImagePickerController()
        takerController.delegate = self
        takerController.sourceType = .camera
        present(takerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        takerController.dismiss(animated: true, completion: nil)
        let newFriend = FriendPhoto(name: "Friend \(contacts.count)", photo: info[.originalImage] as? UIImage)
        contacts.append(newFriend)
        addFriend(newFriend)
    }
    
    func addFriend(_ friend: FriendPhoto) {
        let viewFrame: CGRect = view.frame  // To disambiguate from method of same name
        let bgColor = [UIColor.black, UIColor.red, UIColor.blue, UIColor.green].randomElement()

        let nestedView = UIStackView()
        nestedView.distribution = .fillEqually
        nestedView.axis = .horizontal
        
        let newImageView = UIImageView(image: friend.photo)
        newImageView.contentMode = .scaleAspectFit
        newImageView.backgroundColor = bgColor
        nestedView.addArrangedSubview(newImageView)
        
        let newLabel = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: 20.0))
        newLabel.text = friend.name
        newLabel.textAlignment = .center
        newLabel.backgroundColor = bgColor
        nestedView.addArrangedSubview(newLabel)
        
        photosStackView.addArrangedSubview(nestedView)
        let stackRect = CGRect(x: 0, y: 0, width: viewFrame.width, height: CGFloat(contacts.count) * viewFrame.width / 2)
        photosStackView.frame = stackRect
        photosScrollView.contentSize = stackRect.size
    }

}

class FriendPhoto {
    var name: String
    var photo: UIImage?
    
    init(name: String, photo: UIImage?) {
        self.name = name
        self.photo = photo
    }
}

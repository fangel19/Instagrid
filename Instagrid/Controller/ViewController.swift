//
//  ViewController.swift
//  Instagrid
//
//  Created by angelique fourny on 15/08/2020.
//  Copyright © 2020 angelique fourny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var swipeLabel: UILabel!
    
    //Blue frame view for photo display
    @IBOutlet weak var bluePhotoFrameView: UIView!
    
    //Outlet of each button to add photos
    @IBOutlet weak var photoTopLeft: UIButton!
    @IBOutlet weak var photoTopRight: UIButton!
    @IBOutlet weak var photoDownLeft: UIButton!
    @IBOutlet weak var photoDownRight: UIButton!
    
    //Outlet button style
    @IBOutlet weak var buttonPhotoRectangleTop: UIButton!
    @IBOutlet weak var buttonPhotoRectangleDown: UIButton!
    @IBOutlet weak var buttonPhotoSquare: UIButton!
    
    //put a marker on the choice of photos positions
    var selectedPhotoView: UIImageView?
    private var buttonImage: UIButton?
    private var imagePicker: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeLabel.text = "^\nSwipe up to share"
        // Do any additional setup after loading the view.
    }
    
    // Configuring Button Styles
//    enum StyleGrid {
//        case rectangleTop, rectangleDown, square
//    }
    
 
    @IBAction func buttonImageTaped(_ sender: UIButton) {
        buttonImage = sender
        imagePicker = UIImagePickerController()
        imagePicker?.delegate = self
        imagePicker?.sourceType = .savedPhotosAlbum
        
        guard let secureImagePicker = imagePicker else { return }
        present(secureImagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func choiceOfPhotoDisplayStyle(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            buttonChoice(choice: "rectangleTop")
        case 2:
            buttonChoice(choice: "rectangleDown")
        case 3:
            buttonChoice(choice: "square")
        default:
            break
        }
    }
    
    func buttonChoice(choice: String) {
        switch choice {
        case "rectangleTop":
            photoTopRight.isHidden = true
            photoDownRight.isHidden = false
            
        case "rectangleDown":
            photoDownRight.isHidden = true
            photoTopRight.isHidden = false
            
        case "square":
            photoTopRight.isHidden = false
            photoDownRight.isHidden = false
        default:
            break
        }
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if  let pickImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.buttonImage?.setImage(nil, for: .normal)
            self.buttonImage?.setBackgroundImage(pickImage, for: .normal)
            
            self.dismiss(animated: true) {
                self.imagePicker = nil
                self.buttonImage = nil
            }
        }
    }
}

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
    
    //Button selected view
    
    @IBOutlet weak var buttonSelectedView1: UIImageView!
    @IBOutlet weak var buttonSelectedView2: UIImageView!
    @IBOutlet weak var buttonSelectedView3: UIImageView!
    
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
        setSwipeLabel(bool: UIApplication.shared.statusBarOrientation.isPortrait)
        addGestureRecognizer()
        // Do any additional setup after loading the view.
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        setSwipeLabel(bool: UIDevice.current.orientation.isPortrait)
    }
    
    private func setSwipeLabel(bool: Bool) {
        swipeLabel.text = (bool) ? "^\nSwipe up to share" : "<\nSwipe left to share"
    }
    
    private func addGestureRecognizer() {
        let swipeUpGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeFonction))
        swipeUpGestureRecognizer.direction = .up
        view.addGestureRecognizer(swipeUpGestureRecognizer)
        let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeFonction))
        swipeLeftGestureRecognizer.direction = .left
        view.addGestureRecognizer(swipeLeftGestureRecognizer)
    }
    @objc private func swipeFonction(_ recognizer: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isPortrait, recognizer.direction == .up {
            print("up")
        } else if UIDevice.current.orientation.isLandscape, recognizer.direction == .left {
            print("left")
        }
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
//        buttonImage?.setTitle("+", for: .normal)
    }
    
    
    @IBAction func choiceOfPhotoDisplayStyle(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            buttonChoice(choice: buttonPhotoRectangleTop)
        case 2:
            buttonChoice(choice: buttonPhotoRectangleDown)
        case 3:
            buttonChoice(choice: buttonPhotoSquare)
        default:
            break
        }
    }
    
    func buttonChoice(choice: UIButton) {
        switch choice {
        case buttonPhotoRectangleTop:
            photoTopRight.isHidden = true
            photoDownRight.isHidden = false
            
            buttonSelectedView1.isHidden = false
            buttonSelectedView2.isHidden = true
            buttonSelectedView3.isHidden = true
            
        case buttonPhotoRectangleDown:
            photoDownRight.isHidden = true
            photoTopRight.isHidden = false
            
            buttonSelectedView1.isHidden = true
            buttonSelectedView2.isHidden = false
            buttonSelectedView3.isHidden = true
            
        case buttonPhotoSquare:
            photoTopRight.isHidden = false
            photoDownRight.isHidden = false
            
            buttonSelectedView1.isHidden = true
            buttonSelectedView2.isHidden = true
            buttonSelectedView3.isHidden = false
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

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
    @IBOutlet weak var selectedPhotoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeLabel.text = "^\nSwipe up to share"
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButtonPhotoRectangleTop() {
        startChooseNewButtonView()
    }
    private func startChooseNewButtonView() {
        
    }
}


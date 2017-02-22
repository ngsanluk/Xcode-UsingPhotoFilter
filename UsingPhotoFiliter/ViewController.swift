//
//  ViewController.swift
//  UsingPhotoFiliter
//
//  Created by Sunny NG on 22/2/2017.
//  Copyright © 2017 Sunny NG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!
    
    
    @IBAction func applyFilter(_ sender: UISlider) {
        let effectValue = sender.value
        print("\(effectValue)")
        
        let context = CIContext(options: nil)
        let cImage = CIImage(cgImage: self.image.cgImage!)
        
        let sepiaTone = CIFilter(name: "CISepiaTone")
        sepiaTone?.setValue(cImage, forKey: "inputImage")
        
        
        sepiaTone?.setValue(effectValue, forKey: "inputIntensity")
        let result = sepiaTone?.value(forKey: "outputImage") as! CIImage
        
        let imageRef = context.createCGImage(result, from: CGRect(x: 0, y: 0, width: self.imageView.image!.size.width, height: self.imageView.image!.size.height))
        
        let image =  UIImage(cgImage: imageRef!)
        
        self.imageView.image = image
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.image = imageView.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


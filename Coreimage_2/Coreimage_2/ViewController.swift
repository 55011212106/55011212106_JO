//
//  ViewController.swift
//  Coreimage_2
//
//  Created by iStudents on 2/20/15.
//  Copyright (c) 2015 iStudents. All rights reserved.
//

import UIKit
import AssetsLibrary
class ViewController: UIViewController ,UINavigationControllerDelegate ,UIImagePickerControllerDelegate{

    
    
    
    
    @IBOutlet weak var UIImageCiew: UIImageView!
    
    @IBOutlet weak var amountSlider: UISlider!
    
    var context: CIContext!
    var filter: CIFilter!
    var beginImage: CIImage!
    var orientation: UIImageOrientation = .Up
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1
        let fileURL = NSBundle.mainBundle().URLForResource("x", withExtension: "png")
        
        //2
        beginImage = CIImage(contentsOfURL: fileURL)
        //3
        
        filter = CIFilter(name: "CISepiaTone")
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        filter.setValue(0.5, forKey: kCIInputIntensityKey)
        let outputImage = filter.outputImage
        
        //1
        context = CIContext(options:nil)
        let cgimg = context.createCGImage(outputImage, fromRect: outputImage.extent() )
        
        //2
        let newImage = UIImage(CGImage: cgimg)
        self.UIImageCiew.image = newImage
        
       // self.logAllFilters()
        
        
        
        
        
        
        
    }
    @IBAction func loadPhoto(sender: AnyObject) {
        
        
        let pickerC = UIImagePickerController()
        pickerC.delegate = self
        self.presentViewController(pickerC, animated: true, completion: nil)
        }
    
    
    
    
    
    @IBAction func sevePhoto(sender: AnyObject) {
        
        
        //1
        let imageToseve = filter.outputImage
        
        //2
        let softwareContext = CIContext(options: [kCIContextUseSoftwareRenderer: true])
        
        //3
        let cgimg = softwareContext.createCGImage(imageToseve, fromRect: imageToseve.extent())
        
        //4
        let library = ALAssetsLibrary()
        
        library.writeImageToSavedPhotosAlbum(cgimg, metadata: imageToseve.properties(), completionBlock: nil)
       //     writeImageToSavedPhotosAlbum(cgimg, metadata: imageToseve.properties, completionBlock: nil)
    }
    
    
    
    @IBAction func amountSliderValueChanged(sender: UISlider) {
        
        
        let sliderValue = sender.value
        
        let outputImage = self.oldPhoto(beginImage, withAmont: sliderValue)
        
        let cgimg = context.createCGImage(outputImage, fromRect: outputImage.extent())
        
        let newImage = UIImage(CGImage: cgimg, scale:1, orientation: orientation)
        self.UIImageCiew.image = newImage
        
        
        
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: NSDictionary!) {
        self.dismissViewControllerAnimated(true, completion: nil);
        
        let gotImage = info[UIImagePickerControllerOriginalImage] as UIImage
        
        beginImage = CIImage(image: gotImage)
        orientation = gotImage.imageOrientation
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        self.amountSliderValueChanged(amountSlider)
        
        
        
        
        
    }
    
    
    
    
    func oldPhoto(img: CIImage, withAmont intensity: Float) ->CIImage{
        
        let sepia = CIFilter(name: "CISepiaTone")
        sepia.setValue(img, forKey: kCIInputImageKey)
        sepia.setValue(intensity, forKey: "inputIntensity")
        
        let random = CIFilter(name: "CIRandomGenerator")
        
        let lighten = CIFilter(name: "CIColorControls")
        lighten.setValue(random.outputImage, forKey: kCIInputImageKey)
        lighten.setValue(1-intensity, forKey: "inputBrightness")
        lighten.setValue(0, forKey: "inputSaturation")
        
        let croppedImage = lighten.outputImage.imageByCroppingToRect(beginImage.extent())
        
        let composite = CIFilter(name: "CIHardLightBlendMode")
        composite.setValue(sepia.outputImage, forKey: kCIInputImageKey)
        composite.setValue(croppedImage, forKey: kCIInputBackgroundImageKey)
        
        let vignette = CIFilter(name: "CIVignette")
        vignette.setValue(composite.outputImage, forKey: kCIInputImageKey)
        vignette.setValue(intensity*2, forKey: "inputIntensity")
        vignette.setValue(intensity*30, forKey: "inputRadius")
        
        return vignette.outputImage
        
    
    }
    func logAllFilters(){
        
        let properties = CIFilter.filterNamesInCategory(kCICategoryBuiltIn)
        println(properties)
        
        for filterName: AnyObject in properties{
            let fltr = CIFilter(name: filterName as String)
            println(fltr.attributes())
        }
    }

    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


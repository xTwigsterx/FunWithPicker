﻿//
//  InterfaceController.swift
//  WatchPicker WatchKit Extension
//
//  Zachariah 
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    
    @IBOutlet var myPicker: WKInterfacePicker!
    @IBOutlet var myGroup: WKInterfaceGroup!
    @IBOutlet var myLabel: WKInterfaceLabel!
    
    @IBAction func pickerChanged(value: Int)
        
    {
        let myNumber: Int = value * 10
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .SpellOutStyle
        formatter.stringFromNumber(myNumber)
        myLabel.setText(formatter.stringFromNumber(myNumber))
    }
    
    override func awakeWithContext(context: AnyObject?)
    {
        super.awakeWithContext(context)
        
        var pickerItems = [WKPickerItem]()
        
        for index in 0...10
        {
            let pickerItem = WKPickerItem()
            pickerItem.contentImage = WKImage(imageName: "percent\(index)")
            pickerItems.append(pickerItem)
        }
        
        myPicker.setItems(pickerItems)
        
        var imageArray = [UIImage]()
        
        for index in 0...10
        {
            let image = UIImage(named: "progressarc\(index)")
            imageArray.append(image!)
        }
        
        let progressImages = UIImage.animatedImageWithImages(imageArray, duration: 0.0)
        myGroup.setBackgroundImage(progressImages)
        myPicker.setCoordinatedAnimations([myGroup])
        
    }
    
    override func willActivate()
    {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate()
    {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

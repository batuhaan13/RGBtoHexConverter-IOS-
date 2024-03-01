//
//  ViewController.swift
//  RGBtoHexConverter
//
//  Created by Batu on 7.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var redText: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var greenText: UITextField!
    @IBOutlet weak var blueText: UITextField!
    @IBOutlet weak var firstLabel: UILabel!
    
    var secilenIndex : Int = 0
    
    @IBOutlet weak var btnConvert: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnConvert(_ sender: Any) {
        if secilenIndex == 0 {
            //RGB'den HEX'e çevirme işlemi yapılacaktır.
            convertRGBtoHEX()
            
        } else {
            //HEX'ten RGB çevirme işlemi yapılacaktır.
            convertHEXtoRGB()
        }
        
        
    }
    
    
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        
        secilenIndex = sender.selectedSegmentIndex
        firstLabel.text?.removeAll()
        redText.text?.removeAll()
        greenText.text?.removeAll()
        blueText.text?.removeAll()
        resultLabel.backgroundColor = UIColor.white
        if secilenIndex == 0 {
            btnConvert.setTitle("RGB - HEX Çevir", for: UIControl.State.normal)
        } else {
            btnConvert.setTitle("HEX - RGB Çevir", for: UIControl.State.normal)
        }
        
        
    }
    func convertRGBtoHEX() {
        
        guard let redValue = UInt8(redText.text!) else {return}
        guard let greenValue = UInt8(greenText.text!) else {return}
        guard let blueValue = UInt8(blueText.text!) else {return}
        
        
        
        //buraya kadar gelinirse kullanıcı değerleri düzgün bir şekilde girmiştir.
        
        let redHex = String(format: "%2X", redValue)
        let greenHex = String(format: "%2X", greenValue)
        let blueHex = String(format: "%2X'", blueValue)
        firstLabel.text = "Hex Color : #\(redHex)\(greenHex)\(blueHex)"
        resultLabel.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
        
        
    }
    func convertHEXtoRGB() {
        guard let redValue = UInt8(redText.text!, radix: 16) else {return}
        guard let greenValue = UInt8(greenText.text!, radix: 16) else {return}
        guard let blueValue = UInt8(blueText.text!, radix: 16) else {return}
        
        //print("RED :\(redValue) \n GREEN : \(greenValue) \n BLUE : \(blueValue)")
        firstLabel.text = "RED : \(redValue) \n GREEN : \(greenValue) \n BLUE : \(blueValue)"
        resultLabel.backgroundColor = UIColor(red: CGFloat(redValue)/255, green: CGFloat(greenValue)/255, blue: CGFloat(blueValue)/255, alpha: 1)
    }
}



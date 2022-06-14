//
//  ViewController.swift
//  CalaulatorGram
//
//  Created by 박주영 on 2022/05/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabal: UILabel!
    var checkingLabel = false
    var previousNumber = 0.0
    var currentNumber = 0.0
    var currentType = 0
    var dotting = false
    @IBAction func buttonsTouch(_ sender: UIButton) {
        if sender.tag < 10 {
            if checkingLabel {
                let digit = textLabal.text
                textLabal.text = digit! + String(sender.tag)
                currentNumber = Double(textLabal.text!) ?? 0
            } else{
                textLabal.text = ""
                textLabal.text = String(sender.tag)
                checkingLabel = true
                currentNumber = Double(textLabal.text!) ?? 0
            }
        }
        switch(sender.tag){
        case 18:
            textLabal.text = "0"
            checkingLabel = false
        case 12,13,14,15:
            previousNumber = currentNumber
            checkingLabel = false
            currentType = sender.tag
        case 16:
            textLabal.text = removePoint(num: currentNumber * 0.01)
            previousNumber = currentNumber * 0.01
            currentNumber = currentNumber * 0.01
        case 17:
            textLabal.text = removePoint(num: -currentNumber)
            previousNumber = -currentNumber
            currentNumber = -currentNumber
        case 11:
            switch(currentType){
            case 12:
                textLabal.text = removePoint(num: previousNumber + currentNumber)
            case 13:
                textLabal.text = removePoint(num: previousNumber - currentNumber)
            case 14:
                textLabal.text = removePoint(num: previousNumber / currentNumber)
            case 15:
                textLabal.text = removePoint(num: previousNumber * currentNumber)
            default:
                return
            }
            currentNumber = Double(textLabal.text!) ?? 0
        default:
            return
        }
        func removePoint(num: Double) -> String{
                var floatNumString = String(num)
                    
                while floatNumString.last == "0" {
                    floatNumString.removeLast()
                               
                }
                if floatNumString.last == "."{
                    floatNumString.removeLast()
                }
                
                return floatNumString
            }
    }
    @IBAction func dot(_ sender: UIButton) {
        if  !dotting{
            textLabal.text = textLabal.text! + "."
            dotting = true
        }else{
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}


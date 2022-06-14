//
//  ViewController.swift
//  UpDownGameVersion2
//
//  Created by 박주영 on 2022/06/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var maxminLabel: UILabel!
    @IBOutlet weak var updownLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var buttons: UIButton!
    var checking = true
    var min = 0
    var max = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = ""
        updownLabel.text = ""
        maxminLabel.text = "0 ~ 100"
        // Do any additional setup after loading the view.
    }
    var randomNumber = Int.random(in: 0...100)
    @IBAction func TouchButton(_ sender: UIButton) {
        let currentNumber = numberLabel.text!
        if checking {
            numberLabel.text = String(sender.tag)
            checking = false
        } else{
            numberLabel.text = currentNumber + String(sender.tag)
        }
    }
    @IBAction func okButton(_ sender: UIButton) {
        if randomNumber > Int(numberLabel.text!) ?? 0{
            updownLabel.text = "UP"
            checking = true
            if(min < Int(numberLabel.text!) ?? 0){
                min = Int(numberLabel.text!) ?? 0
            }
        }
        else if randomNumber == Int(numberLabel.text!) ?? 0{
            updownLabel.text = "Great"
            checking = true
        }
        else{
            updownLabel.text = "Down"
            checking = true
            if(max > Int(numberLabel.text!) ?? 0){
                max = Int(numberLabel.text!) ?? 0
            }
        }
        maxminLabel.text = "\(min)~\(max)"
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        numberLabel.text = ""
    }
}


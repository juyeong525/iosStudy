//
//  ViewController.swift
//  mitjip
//
//  Created by 박주영 on 2022/06/09.
//
    
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FoodTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func myFoodListBarButton(_ sender: UIBarButtonItem) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "ListViewController") as? ListViewController else {
                return
            }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func clickPushButton(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController else {
                    return
                }
                vc.data = FoodTextField.text!
                self.navigationController?.pushViewController(vc, animated: true)
            }
}

//
//  ViewController.swift
//  moveScene
//
//  Created by 박주영 on 2022/05/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.title = "Fsdf"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.red]
    }

    @IBAction func moveModalView(_ button: UIButton) {
        let modalVC = self.storyboard?.instantiateViewController(withIdentifier: "modalView")
        modalVC?.modalPresentationStyle = .fullScreen
        self.present(modalVC!, animated: true)
    }
    @IBAction func movenavigationView(_ button: UIButton) {
        let navigationVC = self.storyboard?.instantiateViewController(withIdentifier: "navigationViewController")
        self.navigationController?.pushViewController(navigationVC!, animated: true)
    }
}


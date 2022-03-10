//
//  WelcomeVC.swift
//  GoodDayApp
//
//  Created by myungsun on 2022/03/03.
//

import UIKit

class WelcomeVC: UIViewController {

    // UIButton
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapStartButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "InitialSettingViews", bundle: nil)
        let nameVC = storyboard.instantiateViewController(withIdentifier: "NameVC")
        
        nameVC.modalPresentationStyle = .overFullScreen
        nameVC.modalTransitionStyle = .crossDissolve
        self.present(nameVC,animated: true,completion: nil)
    }
    


}

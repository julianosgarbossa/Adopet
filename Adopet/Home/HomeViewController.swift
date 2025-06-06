//
//  HomeViewController.swift
//  Adopet
//
//  Created by Giovanna Moeller on 11/02/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signIn.layer.cornerRadius = 8
        signUp.layer.cornerRadius = 8
    }


    @IBAction func signIn(_ sender: Any) {
        navigationController?.pushViewController(SignInViewController(), animated: true)
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}


//
//  ViewController.swift
//  VkNewsFeed
//
//  Created by Максим Лебедев on 20.10.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!
    
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authService = SceneDelegate.shared().authService
        
        view.backgroundColor = .white
        signInButton.layer.cornerRadius = 10
    }
    
    @IBAction func signInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
    
    
    
    
    
}


//
//  FollowerListViewController.swift
//  GithubFollowers
//
//  Created by Berk Macbook on 23.06.2022.
//

import UIKit

class FollowerListViewController: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            
            switch result {
            case .success(let followers):
                print(followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happend", message: error.rawValue, buttonTitle: "Ok")
                
            }
           
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

}

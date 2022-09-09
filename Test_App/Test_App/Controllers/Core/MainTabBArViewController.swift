//
//  ViewController.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-21.
//

import UIKit

class MainTabBArViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        setUpNabBar()
    }
    
//MARK: - Private function
    private func setUpNabBar() {
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: PurchaseViewController())
        let vc3 = UINavigationController(rootViewController: FavoriteViewController())
        let vc4 = UINavigationController(rootViewController: PersonInfoViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        vc2.tabBarItem.image = UIImage(named: "ic-bag")
        vc3.tabBarItem.image = UIImage(named: "ic-favorite")
        vc4.tabBarItem.image = UIImage(named: "ic-person")
        
        tabBar.backgroundColor = UIColor(named: "MyBlackBlue")
        tabBar.unselectedItemTintColor = .white
        
        tabBar.layer.cornerRadius = 5
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
    }
}
    

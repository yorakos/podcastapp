//
//  TabController.swift
//  finalp
//
//  Created by Акбота Жумагазина on 17.12.2023.
//

import UIKit


class TabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        tabBar.isTranslucent = false
    
        let firstViewController = ViewController()
        let secondViewController = HomeViewController()
        let thirdViewController = FavViewController()
        let forthViewController = SettingsViewController()

       
        viewControllers = [thirdViewController, secondViewController, firstViewController, forthViewController]

        setTabBarItem(for: firstViewController, title: "Profile", symbolName: "person.crop.circle.fill")
        setTabBarItem(for: secondViewController, title: "Main", symbolName: "house.circle.fill")
        setTabBarItem(for: thirdViewController, title: "Favourites", symbolName: "heart.circle.fill")
        setTabBarItem(for: forthViewController, title: "Settings", symbolName: "gearshape.fill")

        selectedIndex = 1
    }

    private func setTabBarItem(for viewController: UIViewController, title: String, symbolName: String) {
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 22, weight: .regular)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        viewController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: image)
    }
}

//
//  HomeDataSourceController+navbar.swift
//  twitter
//
//  Created by Nakib on 2/6/17.
//  Copyright © 2017 Nakib. All rights reserved.
//

import UIKit

extension HomeDataSourceController {
    func setupNavigation() {
        
        setupLeftNavItems()
        setupRightNavItems()
        setupMiscNav()
        
    }
    
    private func setupLeftNavItems() {
        //Left Button
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems() {
        //Right Buttons
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let searchButtonItem = UIBarButtonItem(customView: searchButton)
        let composeButtonItem = UIBarButtonItem(customView: composeButton)
        
        navigationItem.rightBarButtonItems = [composeButtonItem, searchButtonItem]
    }
    
    private func setupMiscNav() {
        //Title
        let titleImage = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImage.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImage.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImage
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = UIColor.white
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let navbarSepratorView = UIView()
        navbarSepratorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navbarSepratorView)
        
        navbarSepratorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
}

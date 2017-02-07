//
//  HomeDataSourceController.swift
//  twitter
//
//  Created by Nakib on 2/4/17.
//  Copyright © 2017 Nakib. All rights reserved.
//

import LBTAComponents


class HomeDataSourceController: DatasourceController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let words = HomeDataSouce()
        
        self.datasource = words
        
        setupNavigation()
    }
    
    private func setupNavigation() {
       
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
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let user = self.datasource?.item(indexPath) as? User {
            
            //calcualting cell heigh from user.bioText
            let approxBioTextWidth = self.view.frame.width - 50 - 12 - 12 - 2
            let size = CGSize(width: approxBioTextWidth, height: 1000)
            let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
            
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: self.view.frame.width, height: estimatedFrame.height + 66)
        }
        
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

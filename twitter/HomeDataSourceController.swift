//
//  HomeDataSourceController.swift
//  twitter
//
//  Created by Nakib on 2/4/17.
//  Copyright © 2017 Nakib. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSourceController: DatasourceController {
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies, something went wrong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigation()
        
        Service.sharedInstance.fetchHomeFeed { (homeDataSource, error) in
            
            if let error = error {
                self.errorMessageLabel.isHidden = false
                
                if let apiError = error as? APIError<Service.JSONError> {
                    if apiError.response?.statusCode == 404 {
                        self.errorMessageLabel.text = "Page Not Found"
                    }
                }
                
                return
            }
            
            self.datasource = homeDataSource
            
        }
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: self.view.frame.width, height: 64)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: self.view.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            guard let user = self.datasource?.item(indexPath) as? User else { return .zero }
                
            //calcualting cell heigh from user.bioText
            let estimatedHeight = self.estimatedHeightForText(user.bioText)
            
            return CGSize(width: self.view.frame.width, height: estimatedHeight + 66)
            
        }
        
        if indexPath.section == 1 {
            guard let tweet = self.datasource?.item(indexPath) as? Tweet else { return .zero }
            
            //calcualting cell heigh from tweet.message
            let estimatedHeight = self.estimatedHeightForText(tweet.message)
            
            return CGSize(width: self.view.frame.width, height: estimatedHeight + 74)
            
        }
        
        
        
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    private func estimatedHeightForText(_ text: String) -> CGFloat {
        let approxBioTextWidth = self.view.frame.width - 50 - 12 - 12 - 2
        let size = CGSize(width: approxBioTextWidth, height: 1000)
        let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return  estimatedFrame.height
    }

}

//
//  Cell.swift
//  twitter
//
//  Created by Nakib on 2/4/17.
//  Copyright © 2017 Nakib. All rights reserved.
//

import LBTAComponents


class UserFooter: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.purple
    }
}

class UserHeader: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.green
    }
}

class HomeCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            nameLabel.text = datasourceItem as? String
        }
    }
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func setupViews() {
        backgroundColor = UIColor.yellow
        
        addSubview(nameLabel)
        nameLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

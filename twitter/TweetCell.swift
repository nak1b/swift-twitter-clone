//
//  TweetCell.swift
//  twitter
//
//  Created by Nakib on 2/14/17.
//  Copyright © 2017 Nakib. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else { return }
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)])
            
            let usernameStr = " \(tweet.user.username)"
            attributedText.append(NSAttributedString(string: usernameStr, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.gray]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            
            let range = NSMakeRange(0, attributedText.string.characters.count)
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
            
            let messageStr = "\n\(tweet.message)"
            attributedText.append(NSAttributedString(string: messageStr, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]))
        
            
            messageTextView.attributedText = attributedText
            profileImageView.image = tweet.user.profileImage
        }
    }

    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Some sample text"
        textView.backgroundColor = .clear
        
        return textView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profile-image")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let replyButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "reply"), for: .normal)
        
        return button
    }()
    
    let retweetButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "retweet"), for: .normal)
        
        return button
    }()
    
    let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "like"), for: .normal)
        
        return button
    }()
    
    let directMessageButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "send_message"), for: .normal)
        
        return button
    }()

    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(self.topAnchor, left: profileImageView.rightAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant:  0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        setupBottomButtons()
    }
    
    fileprivate func setupBottomButtons() {
        let replyButtonContainerView = UIView()
        
        
        let retweetButtonContainerView = UIView()
        
        
        let likeButtonContainerView = UIView()
        
        
        let directMessageContainerView = UIView()
        
        
        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, directMessageContainerView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        addSubview(buttonStackView)
        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(directMessageButton)
        
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        directMessageButton.anchor(directMessageContainerView.topAnchor, left: directMessageContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
    }
}

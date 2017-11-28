//
//  demoCollectionViewCell.swift
//  myCollectionViewDemo
//
//  Created by zr on 2017/11/24.
//  Copyright © 2017年 ZR. All rights reserved.
//

import UIKit

class demoCollectionViewCell: UICollectionViewCell {
    
    lazy var myImageView: UIImageView = {
        let images = UIImageView()
        images.backgroundColor = .gray
        return images
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(myImageView)
        myImageView.addSubview(titleLabel)
        myImageView.frame = self.bounds
        titleLabel.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

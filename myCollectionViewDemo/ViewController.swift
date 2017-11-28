//
//  ViewController.swift
//  myCollectionViewDemo
//
//  Created by zr on 2017/11/24.
//  Copyright © 2017年 ZR. All rights reserved.
//

private let pWidth = 60
private let pHeight = 60

import UIKit

class ViewController: UIViewController {

    // 这是关于如何让 item 整屏滑动对模型的操作 就是让数组补齐一屏 把空的UI隐藏并对didSelect方法进行判断
    // 这里有第一屏不满少于5个对整个collectionview的高度进行改变
//    var activityModel = [lawActivityinfo]() {
//        didSet {
//            pageControl.numberOfPages = self.activityModel.count / 8 + 1
//            if activityModel.count < 5 {
//                self.mineLayout.rowCount = 1
//                let fix4 = activityModel.count % 4
//                let num4 = Int(4 - fix4)
//                if fix4 > 0 {
//                    for _ in 1...num4 {
//                        let model = lawActivityinfo()
//                        activityModel.append(model)
//                    }
//                }
//                self.collectionView.snp.updateConstraints({ (make) in
//                    make.height.equalTo(Screen.autoScaleH(h: 120))
//                })
//                pageControl.frame = CGRect(x: 0, y: Screen.autoScaleH(h: 120) + 3, width: Screen.width, height: 10)
//            } else {
//                self.mineLayout.rowCount = 2
//                let fix = activityModel.count % 8
//                let fixNum = Int(8 - fix)
//                if fix > 0 {
//                    for _ in 1...fixNum {
//                        let model = lawActivityinfo()
//                        activityModel.append(model)
//                    }
//                }
//                self.collectionView.snp.updateConstraints({ (make) in
//
//                    make.height.equalTo(Screen.autoScaleH(h: 230))
//                })
//                pageControl.frame = CGRect(x: 0, y: Screen.autoScaleH(h: 230) + 3, width: Screen.width, height: 10)
//
//            }
//            dog(activityModel.count)
//
//            collectionView.reloadData()
//        }
//    }
    
    let item = ["1", "2","3", "4","5", "6", "7", "8", "9", "10", "11", "12","13", "14"]
    
    lazy var collectionView: UICollectionView = {
        
        let layout = RuzUIcollectionViewFlowLayout()
        layout.itemSize = CGSize(width: pWidth, height: pHeight)
        layout.scrollDirection = .horizontal
        
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 260)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.decelerationRate = 10
        collectionView.register(demoCollectionViewCell.self, forCellWithReuseIdentifier: "demoCollectionViewCellID")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildUI()
    }
    
    func buildUI() {
        self.view.addSubview(collectionView)
    }

}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}
extension ViewController: UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.count
    }
    
}
extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "demoCollectionViewCellID", for: indexPath) as! demoCollectionViewCell
        cell.titleLabel.text = item[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pWidth, height: pHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 5, 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 35
    }
}

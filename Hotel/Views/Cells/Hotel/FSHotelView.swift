//
//  FSHotelCell.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 13/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import Foundation
import FSPagerView

class FSHotelView: UIView, FSPagerViewDelegate, FSPagerViewDataSource{
    
    var imagens: [UIImage] = []
    var pageView: FSPagerView!
    var auxImageView = CustomImageView() {
        didSet{
            imagens.append(auxImageView.image!)
        }
    }
    var urlsImages: [String]? {
        didSet{
            if let urls = urlsImages{
                for url in urls{
                    auxImageView.loadImageUsingUrlString(urlString: url)
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        pageView = FSPagerView()
        self.addSubview(pageView)
        pageView.translatesAutoresizingMaskIntoConstraints = false
        
        pageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        pageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
        pageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        pageView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        pageView.dataSource = self
        pageView.delegate = self
        pageView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        
        for i in 1..<6{
            imagens.append(UIImage(named: "hotel\(i)")!)
        }
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imagens.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pageView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView!.image = imagens[index]
        return cell
    }
}

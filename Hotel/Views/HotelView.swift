//
//  HotelView.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 12/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit
import FSPagerView

class HotelView: UIViewController, FSPagerViewDelegate, FSPagerViewDataSource {
    
    var imagens: [UIImage] = []
    var pageView: FSPagerView!
    var tableQuartos: UITableView!
    var viewHotelInfo: UIView!
    var scrool = UIScrollView()
    var mainView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureMainView()
        configurePageView()
        configureViewInfo()
        configureTableView()
        configureConstraints()
        configureScrool()

    }
    
    func configureMainView(){
        mainView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: (view.frame.width * 0.5625) + 200 + 400)
        
    }
    
    func configurePageView(){
        
        pageView = FSPagerView()
        mainView.addSubview(pageView)
        pageView.translatesAutoresizingMaskIntoConstraints = false
        
        pageView.dataSource = self
        pageView.delegate = self
        pageView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        
        for i in 1..<6{
            imagens.append(UIImage(named: "hotel\(i)")!)
        }
    }
    
    func configureViewInfo(){
        viewHotelInfo = UIView()
        viewHotelInfo.backgroundColor = UIColor.blue
        mainView.addSubview(viewHotelInfo)
    }
    
    func configureTableView(){
        tableQuartos = UITableView()
        mainView.addSubview(tableQuartos)
    }
    
    func configureConstraints(){
        let pageViewHeight = view.frame.width * 0.5625
        let navHeight = navigationController?.navigationBar.frame.height ?? 0
        
        mainView.addConstraintsWithVisualFormat(format: "H:|[v0]|", views: pageView)
        mainView.addConstraintsWithVisualFormat(format: "H:|[v0]|", views: viewHotelInfo)
        mainView.addConstraintsWithVisualFormat(format: "H:|[v0]|", views: tableQuartos)
        mainView.addConstraintsWithVisualFormat(format: "V:|[v0(\(pageViewHeight))]-0-[v1(200)]-0-[v2(400)]", views: pageView, viewHotelInfo, tableQuartos)
    }
    
    func configureScrool(){
        
        //scrool = UIScrollView()
        scrool.addSubview(mainView)
        scrool.backgroundColor = UIColor.white
        scrool.contentSize = CGSize(width: view.frame.width, height: mainView.bounds.height)
        self.view = scrool
        
    }
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imagens.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pageView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView!.image = imagens[index]
        return cell
    }
}

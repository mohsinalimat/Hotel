//
//  HotelViewTable.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 14/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import Foundation
import UIKit
import FSPagerView

class HotelViewTable: UITableViewController, FSPagerViewDelegate, FSPagerViewDataSource{
    
    var imagens: [UIImage] = []
    var pageView: FSPagerView!
    var viewModel: HoteisViewModel?
    var quartos: [Room] = []
    var hotelEscolhido = 0
    
    override func viewDidLoad() {
        
        quartos = (viewModel?.hoteis.value[hotelEscolhido].RoomTypes!)!
        
        pageView = FSPagerView()
        view.addSubview(pageView)
        pageView.translatesAutoresizingMaskIntoConstraints = false
        let pageViewHeight = view.frame.width * 0.5625
        
        view.addConstraintsWithVisualFormat(format: "H:|[v0]|", views: pageView)
        view.addConstraintsWithVisualFormat(format: "V:|[v0(\(pageViewHeight))]", views: pageView)
        
        pageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        pageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        pageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        pageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        pageView.dataSource = self
        pageView.delegate = self
        pageView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        
        for i in 1..<6{
            imagens.append(UIImage(named: "hotel\(i)")!)
        }
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imagens.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pageView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView!.image = imagens[index]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return view.frame.width * 0.5625
        } else if indexPath.row == 1{
            return 300
        }else{
            return 100
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quartos.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < 2 {
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            return cell!
            
        }else{

            let cell = tableView.dequeueReusableCell(withIdentifier: "cellQuartoHotel") as! CellQuartoHotel
            cell.urlImagem = quartos[indexPath.row].Photos?.first
            cell.lblNomeQuarto.text = quartos[indexPath.row].Name

            return cell
            
        }
    }
}

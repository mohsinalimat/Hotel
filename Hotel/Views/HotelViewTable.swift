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

protocol HeightCells {
    func expandirCell(row: HotelInfo)
    func contrairCell(row: HotelInfo)
}

class HotelViewTable: UITableViewController, FSPagerViewDelegate, FSPagerViewDataSource, HeightCells{
    
    
    var imagens: [UIImage] = []
    var pageView: FSPagerView!
    var viewModel: HoteisViewModel?
    var quartos: [Room] = []
    var hotelEscolhido = 0
    var imageViews: [CustomImageView] = []
    var urlsImages: [String]? {
        didSet{
            if let urls = urlsImages{
                for url in urls{
                    let custom = CustomImageView()
                    custom.loadImageUsingUrlString(urlString: url)
                    imageViews.append(custom)
                }
            }
        }
    }
    var pageControl: FSPageControl!
    
    var heightDescricao = 150
    var heightComodidades = 150
    var heightPoliticas = 220
    
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
        
        pageControl = FSPageControl(frame: CGRect(x: (view.frame.width / 2) - 40, y: (view.frame.width * 0.5625) - 30, width: 80, height: 40))
        pageControl.numberOfPages = (urlsImages?.count)!
        self.view.addSubview(pageControl)
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageViews.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pageView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView!.image = imageViews[index].image
        pageControl.currentPage = index
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            return view.frame.width * 0.5625
        } else if indexPath.row == 1{
            return 100
        }else if indexPath.row == 2{
            return CGFloat(heightDescricao)
        }else if indexPath.row == 3{
            return CGFloat(heightComodidades)
        }else if indexPath.row == 4{
            return CGFloat(heightPoliticas)
        }else if indexPath.row == 5{
            return 200
        }else{
            return 100
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quartos.count + 6
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            }
            return cell!
            
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellInfoHotel") as! CellHotelInfo
            cell.lblNomeHotel.text = viewModel?.hoteis.value[hotelEscolhido].Name
            return cell
            
        case 2:
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellDescricaoHotel") as! CellHotelDescricao
            cell.lblDescricao.text = viewModel?.hoteis.value[hotelEscolhido].Description
            cell.delegate = self
            return cell
            
        case 3:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellComodidadesHotel") as! CellHotelComodidades
            cell.yPosition = CGFloat(2)
            cell.auxView.subviews.forEach({ $0.removeFromSuperview() })
            cell.comodidades = viewModel?.hoteis.value[hotelEscolhido].Features
            cell.delegate = self
            return cell
            
        case 4:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellPoliticaHotel") as! CellHotelPoliticas
            cell.delegate = self
            cell.lblPolitica.text = viewModel?.hoteis.value[hotelEscolhido].Policies?.GeneralPolicy
            return cell
            
        case 5:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellContatoHotel") as! CellHotelContato
            cell.fone1 = (viewModel?.hoteis.value[hotelEscolhido].Phones?.MainPhone)!
            cell.fone2 = (viewModel?.hoteis.value[hotelEscolhido].Phones?.SecondaryPhone)!
            cell.bairro = (viewModel?.hoteis.value[hotelEscolhido].Address?.Neighborhood)!
            cell.cidade = (viewModel?.hoteis.value[hotelEscolhido].Address?.City)!
            cell.estado = (viewModel?.hoteis.value[hotelEscolhido].Address?.State)!
            cell.rua = (viewModel?.hoteis.value[hotelEscolhido].Address?.Street)!
            cell.pais = (viewModel?.hoteis.value[hotelEscolhido].Address?.Country)!
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellQuartoHotel") as! CellQuartoHotel
            cell.urlImagem = quartos[indexPath.row - 6].Photos?.first
            cell.lblNomeQuarto.text = quartos[indexPath.row - 6].Name
            
            return cell
        }
    }
    
    func expandirCell(row: HotelInfo){
        
        let index = IndexPath(row: row.rawValue, section: 0)
        
        switch row {
        case .descricao:
            
            let texto = viewModel?.hoteis.value[hotelEscolhido].Description
            let rect = NSString(string: texto!).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15)], context: nil)
            heightDescricao += Int(rect.height)
            tableView.reloadRows(at: [index], with: .automatic)
            let cell = tableView.cellForRow(at: index) as! CellHotelDescricao
            cell.btnVerMais!.setTitle("Ver menos", for: .normal)
            
        case .comodidades:
            
            let comodidades = viewModel?.hoteis.value[hotelEscolhido].Features
            heightComodidades = (comodidades?.count)! * 22
            tableView.reloadRows(at: [index], with: .automatic)
            let cell = tableView.cellForRow(at: index) as! CellHotelComodidades
            cell.btnVerMais!.setTitle("Ver menos", for: .normal)
            
        case .politicas:
            
            let texto = viewModel?.hoteis.value[hotelEscolhido].Policies?.GeneralPolicy
            let rect = NSString(string: texto!).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 15)], context: nil)
            heightPoliticas += Int(rect.height)
            tableView.reloadRows(at: [index], with: .automatic)
            let cell = tableView.cellForRow(at: index) as! CellHotelPoliticas
            cell.btnVerMais!.setTitle("Ver menos", for: .normal)
            
        default:
            break
        }
    }
    
    func contrairCell(row: HotelInfo){
        
        let index = IndexPath(row: row.rawValue, section: 0)
        switch row {
        case .descricao:
            
            heightDescricao = 150
            tableView.reloadRows(at: [index], with: .automatic)
            tableView.scrollToRow(at: index, at: .middle, animated: true)
            let cell = tableView.cellForRow(at: index) as! CellHotelDescricao
            cell.btnVerMais!.setTitle("Ver mais", for: .normal)
            
        case .comodidades:
            
            heightComodidades = 150
            tableView.reloadRows(at: [index], with: .automatic)
            tableView.scrollToRow(at: index, at: .middle, animated: true)
            let cell = tableView.cellForRow(at: index) as! CellHotelComodidades
            cell.btnVerMais!.setTitle("Ver mais", for: .normal)
            
        case .politicas:
            
            heightPoliticas = 220
            tableView.reloadRows(at: [index], with: .automatic)
            tableView.scrollToRow(at: index, at: .middle, animated: true)
            let cell = tableView.cellForRow(at: index) as! CellHotelPoliticas
            cell.btnVerMais!.setTitle("Ver mais", for: .normal)
        
        default:
            break
        }
    }
}

//
//  HoteisViewCollection.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 12/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class HoteisViewCollection: UIViewController {
    
    @IBOutlet weak var collectionHoteis: UICollectionView!
    var viewModel = HoteisViewModel()
    private var SEGUE_HOTEL = "segueToHotel"
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SEGUE_HOTEL{
            let vc = segue.destination as! HotelViewTable
            vc.hotelEscolhido = sender as! Int
            vc.urlsImages = viewModel.hoteis.value[sender as! Int].Photos
            vc.viewModel = viewModel
        }
    }
}

extension HoteisViewCollection: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: SEGUE_HOTEL, sender: indexPath.item)
    }
}

extension HoteisViewCollection: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.hoteis.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionHoteis.dequeueReusableCell(withReuseIdentifier: "cellHotelCollection", for: indexPath) as! CellHotelCollection
        cell.hotelName.text = viewModel.hoteis.value[indexPath.row].Name
        cell.urlImage = viewModel.hoteis.value[indexPath.row].Photos?.first
        return cell
    }
}

extension HoteisViewCollection: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 32, height: view.frame.width - 32)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width - 32, height: 16)
    }
    
}

//
//  HoteisView.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 09/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class HoteisView: UIViewController {
    
    @IBOutlet weak var tableHoteis: UITableView!
    var viewModel = HoteisViewModel()
    private var SEGUE_HOTEL = "segueToHotel"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SEGUE_HOTEL{
            
        }
    }
}

extension HoteisView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: SEGUE_HOTEL, sender: indexPath)
    }
}

extension HoteisView: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.hoteis.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableHoteis.dequeueReusableCell(withIdentifier: "cellHotel") as! CellHotel
        cell.hotelName.text = viewModel.hoteis.value[indexPath.row].Name
        cell.hotelImage.image = UIImage(named: "hotel")
        return cell
    }

}

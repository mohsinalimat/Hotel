//
//  HotelViewTable.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 14/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import Foundation
import UIKit

class HotelViewTable: UITableViewController{
    
    
    override func viewDidLoad() {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellPhotoHotel") as! CellFotoHotel
            return cell
        }else{
            return UITableViewCell()
        }
    }
}

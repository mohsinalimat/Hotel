//
//  CalendarioView.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 31/10/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarioView: UIViewController {
    
    @IBOutlet weak var calendario: JTAppleCalendarView!
    @IBOutlet weak var lblMes: UILabel!
    
    var parameterDate: Date?
    var isIda = true
    var selectedDate: Date!
    let formatter = DateFormatter()
    var delegate: DataEscolhidaProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        calendario.scrollToDate( parameterDate ?? Date() )
        calendario.selectDates( [parameterDate ?? Date()] )
        
        configureCalendar()
        configureLabels()
        configureNavigation()
        
        selectedDate = parameterDate ?? Date()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        if isIda{
            delegate.dataEscolhidaIda = selectedDate
        }else{
            delegate.dataEscolhidaVolta = selectedDate
        }
    }
    
    func configureNavigation(){
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func configureCalendar(){
        calendario.minimumLineSpacing = 0
        calendario.minimumInteritemSpacing = 0
    }
    
    func configureLabels(){
        calendario.visibleDates( {(visibleDates) in
            
            self.setupViewsFromCalendar(visibleDates: visibleDates)
            
        })
    }
    
    func setupViewsFromCalendar(visibleDates: DateSegmentInfo){
        
        let date = visibleDates.monthDates.first?.date
        
        formatter.dateFormat = "yyyy"
        //labelYear.text = formatter.string(from: date!)
        
        formatter.dateFormat = "MMMM"
        lblMes.text = formatter.string(from: date!)
    }
    
    func handleCellSelected(view: JTAppleCell, cellState: CellState){
        
        guard let validCell = view as? CellDia else {return}
        
        if cellState.isSelected{
            validCell.selectedView.isHidden = false
        }else{
            validCell.selectedView.isHidden = true
        }
    }
    
    func handleCellTextColor(view: JTAppleCell, cellState: CellState){
        
        guard let validCell = view as? CellDia else {return}
        
        let calendar = Calendar.current
        let result = calendar.compare(cellState.date, to: parameterDate ?? Date(), toGranularity: .day)
        
        if cellState.isSelected{
            validCell.dateLabel.textColor = UIColor.white
            
        }else{
            if cellState.dateBelongsTo == .thisMonth && (result == .orderedSame || result == .orderedDescending){
                validCell.dateLabel.textColor = UIColor.black
            }else{
                validCell.dateLabel.textColor = UIColor.lightGray
            }
        }
    }
}

extension CalendarioView: JTAppleCalendarViewDelegate{
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "customCell", for: indexPath) as! CellDia
        
        cell.dateLabel.text = cellState.text
        handleCellSelected(view: cell, cellState: cellState)
        handleCellTextColor(view: cell, cellState: cellState)
        
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        
        setupViewsFromCalendar(visibleDates: visibleDates)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, shouldSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) -> Bool {
        
        let calendar = Calendar.current
        let result = calendar.compare(date, to: parameterDate ?? Date(), toGranularity: .day)
        if result == .orderedSame || result == .orderedDescending{
            
            return true
        }else{
            
            return false
        }
    }
}

extension CalendarioView: JTAppleCalendarViewDataSource{
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        formatter.dateFormat = "dd MM yyyy"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = Date()//formatter.date(from: "22 09 2018")
        let endDate = Date().dateByAddingMonths(12)//formatter.date(from: "22 09 2020")
        
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        
        guard let validCell = cell as? CellDia else { return }
        
        let calendar = Calendar.current
        let result = calendar.compare(date, to: parameterDate ?? Date(), toGranularity: .day)
        if result == .orderedSame || result == .orderedDescending{
            
            handleCellSelected(view: validCell, cellState: cellState)
            handleCellTextColor(view: validCell, cellState: cellState)
            selectedDate = date
            
        }
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        
        guard let validCell = cell as? CellDia else {return}
        
        let calendar = Calendar.current
        let result = calendar.compare(date, to: parameterDate ?? Date(), toGranularity: .day)
        if result == .orderedSame || result == .orderedDescending{
            
            handleCellSelected(view: validCell, cellState: cellState)
            handleCellTextColor(view: validCell, cellState: cellState)
            
        }
    }
}

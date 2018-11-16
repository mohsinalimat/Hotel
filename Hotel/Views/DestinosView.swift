 //
 //  DestinosView.swift
 //  Hotel
 //
 //  Created by WOOBA-MAC1 on 01/11/18.
 //  Copyright © 2018 WOOBA-MAC1. All rights reserved.
 //
 
 import UIKit
 
 
 
 class DestinosView: UIViewController {
    
    @IBOutlet weak var tableHoteis: UITableView!
    
    let viewModel = DestinosViewModel()
    var delegate: HotelEscolhido?
    
    var hoteis: [Hotel] = []{
        didSet{
            tableHoteis.reloadData()
        }
    }
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        configureSearchController()
        if isViewLoaded{
            viewModel.hoteis.bind( {[unowned self] in self.hoteis = $0} )
        }
    }
    
    func configureSearchController(){
        
        searchController.searchBar.tintColor = .white

        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedStringKey.foregroundColor.rawValue: UIColor.white]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Buscar Hotel", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    }
    
    func configureNavigation(){
        
        navigationItem.title = "Buscador de Hotéis"
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        if #available(iOS 11.0, *) {
            searchController.searchResultsUpdater = self
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        } else {
            
        }
    }
 }
 
 extension DestinosView: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        if let texto = searchController.searchBar.text{
            if texto.count >= 3{
                viewModel.searchHotel(texto: texto)
            }
        }
    }
 }

 extension DestinosView: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hoteis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableHoteis.dequeueReusableCell(withIdentifier: "cellHotel")
        if cell == nil{
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellHotel")
        }
        
        cell?.textLabel?.text = hoteis[indexPath.row].Name ?? ""
        
        return cell!
    }
 }
 
 extension DestinosView: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard var del = delegate else { return }
        del.nomeHotel = hoteis[indexPath.row].Name
        navigationController?.popViewController(animated: true)
    }
 }

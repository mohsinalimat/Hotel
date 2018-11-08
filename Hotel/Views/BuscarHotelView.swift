//
//  ViewController.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 31/10/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

protocol DataEscolhidaProtocol {
    var dataEscolhidaIda: Date? {get set}
    var dataEscolhidaVolta: Date? {get set}
}

protocol HotelEscolhido {
    var nomeHotel: String? {get set}
}

class BuscarHotelView: UITableViewController, DataEscolhidaProtocol, HotelEscolhido {
    
    @IBOutlet weak var txtDestino: UITextField!
    @IBOutlet weak var txtDataIda: UITextField!
    @IBOutlet weak var txtDataVolta: UITextField!
    @IBOutlet weak var lblNumeroAdultos: UILabel!
    @IBOutlet weak var lblNumeroCriancas: UILabel!
    @IBOutlet weak var lblNumeroQuartos: UILabel!
    @IBOutlet weak var btnBuscarHoteis: UIButton!
    @IBOutlet weak var viewAdulto: UIView!
    @IBOutlet weak var viewCrianca: UIView!
    @IBOutlet weak var viewQuarto: UIView!
    
    private let SEGUE_CALENDAR = "segueToCalendario"
    private let SEGUE_DESTINO = "segueToDestino"
    private let SEGUE_HOSPEDAGEM = "segueToHospedagem"
    
    var flagIdaVolta = true
    var dataIda: Date?
    var dataVolta: Date?
    let formatter = DateFormatter()
    let calendar = Calendar.current
    var nomeHotel: String? {
        didSet{
            txtDestino.text = nomeHotel
        }
    }
    
    var diasDaSemana = ["Domingo", "Segunda", "Terça", "Quarta","Quinta","Sexta","Sábado"]
    var meses = ["Jan","Fev","Mar", "Abr", "Mai","Jun", "Jul","Ago", "Set", "Out", "Nov","Dez"]
    var adultNumber = 1
    var flagAlreadyChosenArrivalDate = false
    
    var numeroQuartos = 0{
        didSet{
            lblNumeroQuartos.text = String(numeroQuartos)
        }
    }
    
    var dataEscolhidaIda: Date? {
        didSet{
            
            dataIdaAtual = dataEscolhidaIda!
            dataIda = dataEscolhidaIda!
            
            let calendar = Calendar.current
            let result = calendar.compare(dataVoltaAtual, to: dataEscolhidaIda!, toGranularity: .day)
            if result == .orderedAscending{
                dataVoltaAtual = dataEscolhidaIda!.dateByAddingDays(1)
            }
            
        }
    }
    
    var dataEscolhidaVolta: Date? {
        didSet{
            dataVoltaAtual = dataEscolhidaVolta!
        }
    }
    
    var dataIdaAtual = Date() {
        didSet{
            //se a data de partida for maior ou igual a data de retorno, a data de retorno será a data de partida + 1
            let result2 = calendar.compare(dataIdaAtual, to: dataVoltaAtual, toGranularity: .day)
            if result2 == .orderedSame || result2 == .orderedDescending {
                dataVoltaAtual = dataIdaAtual.dateByAddingDays(1)
            }
            
            txtDataIda.text = "\(diasDaSemana[dataIdaAtual.weekday() - 1]), \(dataIdaAtual.day()) \(meses[dataIdaAtual.month() - 1]) \(dataIdaAtual.year())"
        }
    }
    
    var dataVoltaAtual = Date().dateByAddingDays(1){
        didSet{
            txtDataVolta.text = "\(diasDaSemana[dataVoltaAtual.weekday() - 1]), \(dataVoltaAtual.day()) \(meses[dataVoltaAtual.month() - 1]) \(dataVoltaAtual.year())"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        configureNavigation()
        configureButton()
        configureTextField()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SEGUE_CALENDAR{
            
            let viewC = segue.destination as! CalendarioView
            
            if flagIdaVolta {
                viewC.parameterDate = dataIdaAtual
                viewC.delegate = self
                viewC.isIda = true
                viewC.title = "Calendário Ida"
            }else{
                viewC.delegate = self
                viewC.parameterDate = dataIda
                viewC.isIda = false
                viewC.title = "Calendário Volta"
            }
            
        } else if segue.identifier == SEGUE_DESTINO {
            
            let viewC = segue.destination as! DestinosView
            viewC.delegate = self
            
        }else{
            
        }
    }
    
    func configureTextField(){
        txtDestino.delegate = self
        txtDataIda.delegate = self
        txtDataVolta.delegate = self
    }
    
    func configureViews(){
        
        let views = [viewAdulto, viewQuarto, viewCrianca]
        for view in views {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(chamarViewHospedagem))
            view?.layer.cornerRadius = 3
            view?.addGestureRecognizer(tapGesture)
        }
    }
    
    func configureButton(){
        btnBuscarHoteis.layer.cornerRadius = 3
    }
    
    func configureNavigation(){
        title = "Pesquisar Hotéis"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func chamarViewDestinos(){
        performSegue(withIdentifier: SEGUE_DESTINO, sender: self)
    }
    
    @objc func calendarioIda() {
        flagIdaVolta = true
        performSegue(withIdentifier: SEGUE_CALENDAR, sender: self)
    }
    
    @objc func calendarioVolta() {
        flagIdaVolta = false
        performSegue(withIdentifier: SEGUE_CALENDAR, sender: self)
    }
    
    @objc func chamarViewHospedagem(){
        performSegue(withIdentifier: SEGUE_HOSPEDAGEM, sender: self)
    }
}

extension BuscarHotelView: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        view.endEditing(true)
        
        switch textField {
        case txtDestino:
            chamarViewDestinos()
            break
        case txtDataVolta:
            calendarioVolta()
            break
        case txtDataIda:
            calendarioIda()
            break
        default:
            break
        }
    }
}

//
//  ViewCriancaIdade.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 07/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class ViewCriancaIdade: UIViewController {
    
    @IBOutlet weak var lblIdadeCrianca: UILabel!
    @IBOutlet weak var pickerIdade: UIPickerView!
    @IBOutlet weak var btnEscolherIdade: UIButton!
    @IBOutlet weak var viewPicker: UIView!
    
    let arrayIdade = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17]
    var crianca = 1
    var idadeEscolhida = 0
    var quarto = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureButton()
        configureNotification()
        lblIdadeCrianca.text = "Escolha a idade da criança \(crianca)"
    }
    
    func configureView(){
        viewPicker.layer.cornerRadius = 10
    }
    
    func configureButton(){
        btnEscolherIdade.layer.cornerRadius = 3
        btnEscolherIdade.addTarget(self, action: #selector(escolherIdade), for: .touchDown)
    }
    
    func configureNotification(){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @objc func escolherIdade(){
        let name = Notification.Name(notificationIdade)
        NotificationCenter.default.post(name: name, object: [crianca, idadeEscolhida, quarto])
        dismiss(animated: true, completion: nil)
        
    }
}

extension ViewCriancaIdade: UIPickerViewDelegate{
    
}

extension ViewCriancaIdade: UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayIdade.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        idadeEscolhida = arrayIdade[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(arrayIdade[row])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first?.view == view{
            self.dismiss(animated: true, completion: nil)
        }
    }
}

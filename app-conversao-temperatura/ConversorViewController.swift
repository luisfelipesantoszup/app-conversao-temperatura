//
//  ViewController.swift
//  app-conversao-temperatura
//
//  Created by Luis Felipe on 19/10/22.
//

import UIKit

class ConversorViewController: UIViewController {
    
    @IBOutlet weak var temperaturaCInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func botaoConverterCtoF(_ sender: UIButton) {
        if !checarSeCampoEstaEmBranco() && checarSeInputEhNumerico(value: temperaturaCInput.text!) {
            let temperaturaF = converterCtoF(temperatura: Double(temperaturaCInput.text!))
            let mensagem = "Valor convertido: \(String(format: "%.1f °F", temperaturaF))"
            
            exibirAlerta(titulo: "Pronto!", mensagem: mensagem)
        }
        else {
            exibirAlerta(titulo: "Erro!", mensagem: "Favor digitar um valor numérico.")
        }
    }
    
    @IBAction func botaoConverterCtoK(_ sender: UIButton) {
        if !checarSeCampoEstaEmBranco() && checarSeInputEhNumerico(value: temperaturaCInput.text!) {
            let temperaturaK = converterCtoK(temperatura: Double(temperaturaCInput.text!))
            let mensagem = "Valor convertido: \(String(format: "%.1f °K", temperaturaK))"
            
            exibirAlerta(titulo: "Pronto!", mensagem: mensagem)
        }
        else {
            exibirAlerta(titulo: "Erro!", mensagem: "Favor digitar um valor numérico.")
        }
    }
    
    func converterCtoF(temperatura: Double?) -> Double {
        return ((temperatura ?? 0) * 1.8) + 32
    }
    
    func converterCtoK(temperatura: Double?) -> Double {
        return (temperatura ?? 0) + 273.15
    }
    
    func exibirAlerta(titulo:String, mensagem: String) {
        
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    func checarSeCampoEstaEmBranco() -> Bool {
        return temperaturaCInput.text!.isEmpty ? true : false
    }
    
    func checarSeInputEhNumerico(value: String) -> Bool {
        let set = CharacterSet(charactersIn: value)
        return CharacterSet.decimalDigits.isSuperset(of: set) ? true : false
    }
}

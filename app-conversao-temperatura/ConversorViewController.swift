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
        if !checarCampoEmBranco() {
            let temperaturaF = converterCtoF(temperatura: Double(temperaturaCInput.text!))
            let mensagem = "Valor convertido: \(String(format: "%.1f °F", temperaturaF))"
            
            exibirAlertaDeConversao(mensagem: mensagem)
        }
        else {
            exibirAlertaDeCampoEmBranco()
        }
    }
    
    @IBAction func botaoConverterCtoK(_ sender: UIButton) {
        if !checarCampoEmBranco() {
            let temperaturaK = converterCtoK(temperatura: Double(temperaturaCInput.text!))
            let mensagem = "Valor convertido: \(String(format: "%.1f °K", temperaturaK))"
            
            exibirAlertaDeConversao(mensagem: mensagem)
        }
        else {
            exibirAlertaDeCampoEmBranco()
        }
    }
    
    func converterCtoF(temperatura: Double?) -> Double {
        return ((temperatura ?? 0) * 1.8) + 32
    }
    
    func converterCtoK(temperatura: Double?) -> Double {
        return (temperatura ?? 0) + 273.15
    }
    
    func exibirAlertaDeConversao(mensagem: String) {
        
        let alert = UIAlertController(title: "Pronto!", message: mensagem, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    func exibirAlertaDeCampoEmBranco() {
        let alert = UIAlertController(title: "Erro!", message: "Favor digitar um valor.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    func checarCampoEmBranco() -> Bool {
        return temperaturaCInput.text! == "" ? true : false
    }
}

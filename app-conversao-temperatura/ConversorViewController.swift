//
//  ViewController.swift
//  app-conversao-temperatura
//
//  Created by Luis Felipe on 19/10/22.
//

import UIKit

class ConversorViewController: UIViewController {
    
    typealias MensagemDeValidacao = String
    
    @IBOutlet weak var temperaturaCInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func botaoConverterCtoF(_ sender: UIButton) {
        
        switch validarCampo() {
            
        case(false, let mensagem):
            exibirAlerta("Erro!", mensagem)
            
        default:
            let temperaturaF = converterCtoF(Double(temperaturaCInput.text!))
            let mensagem = "Valor convertido: \(String(format: "%.1f °F", temperaturaF))."
            exibirAlerta("Pronto!", mensagem)
        }
    }
    
    @IBAction func botaoConverterCtoK(_ sender: UIButton) {
        
        switch validarCampo() {
            
        case(false, let mensagem):
            exibirAlerta("Erro!", mensagem)
            
        default:
            let temperaturaK = converterCtoK(Double(temperaturaCInput.text!))
            let mensagem = "Valor convertido: \(String(format: "%.1f °K", temperaturaK))."
            exibirAlerta("Pronto!", mensagem)
        }
    }
    
    func validarCampo() -> (Bool, MensagemDeValidacao?) {
        
        guard let tempInput = temperaturaCInput.text, !tempInput.isEmpty else {
            return (false, "O campo não pode estar vazio.")
        }
        
        guard let tempInput = temperaturaCInput.text, checarSeInputEhNumerico(tempInput) else {
            return (false, "Favor inserir um número.")
        }
        
        return (true, nil)
    }
    
    func converterCtoF(_ temperatura: Double?) -> Double {

        return ((temperatura ?? 0) * 1.8) + 32
    }
    
    func converterCtoK(_ temperatura: Double?) -> Double {
        
        return (temperatura ?? 0) + 273.15
    }
    
    func exibirAlerta(_ titulo: String, _ mensagem: String?) {
        
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    func checarSeInputEhNumerico(_ input: String) -> Bool {
        
        let set = CharacterSet(charactersIn: input)
        return CharacterSet.decimalDigits.isSuperset(of: set)
    }
}

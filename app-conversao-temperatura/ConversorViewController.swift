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
        // Do any additional setup after loading the view.
    }

    @IBAction func botaoConverterCtoF(_ sender: UIButton) {
        
        let temperaturaC = Double(temperaturaCInput.text!)
        let temperaturaF = converterCtoF(temperatura: temperaturaC)
        let mensagem = "Valor convertido: \(String(format: "%.1f °F", temperaturaF))"
        
        exibirAlerta(mensagem: mensagem)
    }
    
    @IBAction func botaoConverterCtoK(_ sender: UIButton) {
        
        let temperaturaC = Double(temperaturaCInput.text!)
        let temperaturaK = converterCtoK(temperatura: temperaturaC)
        let mensagem = "Valor convertido: \(String(format: "%.1f °K", temperaturaK))"
        
        exibirAlerta(mensagem: mensagem)
    }
    
    func converterCtoF(temperatura: Double?) -> Double {
        return ((temperatura ?? 0) * 1.8) + 32
    }
    
    func converterCtoK(temperatura: Double?) -> Double {
        return (temperatura ?? 0) + 273.15
    }
    
    func exibirAlerta(mensagem: String) {
        
        let alert = UIAlertController(title: "Pronto!", message: mensagem, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
}

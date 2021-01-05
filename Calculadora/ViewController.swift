
import UIKit

class ViewController: UIViewController {
    
    //MARK: - Propiedades
    
    @IBOutlet weak var resultadoLabel: UILabel!
    
    @IBOutlet weak var igualButton: UIButton!
    var numeroAlmacenado: Int = 0
    var operador: Operacion?
    
    //MARK: - Ciclo de vida de un ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        resultadoLabel.text = "0"
        igualButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        
    }


    @IBAction func botonNumericoTapped(_ sender: UIButton) {
        if resultadoLabel.text == "0" {
            resultadoLabel.text = sender.titleLabel?.text
        } else {
          //  guard let unNumber = sender.titleLabel?.text{return}
            let numero = resultadoLabel.text! + sender.titleLabel!.text!
            resultadoLabel.text = numero
            //resultadoLabel.text += sender.titleLabel?.text!
        }
    }
    
    
    @IBAction func operacionButtonTapped(_ sender: UIButton) {
        guard let numeroStr = resultadoLabel.text,
              let numero = Int(numeroStr),
              let simbolo = sender.titleLabel?.text
              else {
            return
        }
        operador = Operacion(rawValue: simbolo)
        numeroAlmacenado = numero
        resultadoLabel.text = "0"
    }
    
    
    @IBAction func igualButtonTapped(_ sender: UIButton) {
        guard let operacion = operador,
              let numeroStr = resultadoLabel.text,
              let numero2 = Int(numeroStr)
              else {
                return
              }
        let resultado = operacion.operar(numeroA: numeroAlmacenado, numeroB: numero2)
        resultadoLabel.text = "\(resultado)"
    }
}


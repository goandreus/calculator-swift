
import Foundation

enum Operacion: String {
    case suma = "+"
    case resta = "-"
    case multiplicacion = "*"
    case division = "/"
    
    func puedoOperar(numeroA: Int, numeroB: Int) -> Bool {
        switch self {
        case .division:
            return numeroB != 0
        default:
            return true
        }
    }
    
    func operar(numeroA a:Int, numeroB b:Int) -> Int {
        switch self  {
        case .suma:
            return a + b
        case .resta:
            return a - b
        case .multiplicacion:
            return a * b
        case .division:
            return a / b
        }
    }
}

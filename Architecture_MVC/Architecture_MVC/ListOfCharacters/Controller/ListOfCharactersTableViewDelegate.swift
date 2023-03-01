//
//  ListOfCharactersTableViewDelegate.swift
//  Architecture_MVC
//
//  Created by YeltsinMacPro13 on 1/03/23.
//

import Foundation
import UIKit

class ListOfCharactersTableViewDelegate: NSObject, UITableViewDelegate {
    
//    propiedad para saber cuando la celda a sido pulsada
    var didTapOnCell: ((Int) -> Void)?
    
//    dar el mismo tamano a la celda del TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
//    método para cuando la celda a sido pulsada
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
}

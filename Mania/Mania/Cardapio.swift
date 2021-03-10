//
//  Cardapio.swift
//  Mania
//
//  Created by Alexandre Cardoso on 09/03/21.
//

import Foundation
import UIKit

class Cardapio {
	var name: String
	var description: String
	var qtdServe: Int?
	var price: Double
	var image: UIImage
	
	init(name: String, description: String, qtdServe: Int? = 0, price: Double, image: UIImage) {
		self.name = name
		self.description = description
		self.qtdServe = qtdServe
		self.price = price
		self.image = image
	}
	
}

//
//  HomeController.swift
//  Mania
//
//  Created by Alexandre Cardoso on 09/03/21.
//

import Foundation
import UIKit

class HomeController {
	
	// MARK: - Variable
	var categorias: [String] = ["Destaque",
										 "Combo promocional",
										 "Nossos cortes (+3 acompanhamentos)",
										 "Churrasco Burger",
										 "Porções extras",
										 "Extras",
										 "Molhos extras",
										 "Bebidas"
	]
	
	var cardapios = [
		// Destaque
		[Cardapio(name: "Frango Jr com salada",
					 description: "Frango marinado, macio e suculento, feito no fogo forte (aprox. 130g in natura) com salada caesar (alface, queijo parmesão, croutons e molho caesar). Acompanha Limonada natural com maracujá 500ml",
					 price: 34.80,
					 image: UIImage(named: "destaque-1") ?? UIImage() ),
		 
		 Cardapio(name: "Especial - (até 2 pessoas)",
					 description: "2 tiras de sobrecoxa de frango desossadas (aprox. 120g in natura) 2 tiras de linguiça de pernil            em um formato mais fino que o tradicional 2 pães de alho",
					 qtdServe: 2,
					 price: 70.00,
					 image: UIImage(named: "destaque-2") ?? UIImage() ),
		 
		 Cardapio(name: "Prime - (até 2 pessoas)",
					 description: "1 chorizo corte retirado do centro do contra-filet com uma “tira” de gordura lateral (aprox. 200g in natura)",
					 qtdServe: 2,
					 price: 135.00,
					 image: UIImage(named: "destaque-3") ?? UIImage() )
		],
		
		// Combo promocional
		[Cardapio(name: "Combo Cheese Burger + Coca-Cola",
					 description: "Hambúrguer de 150g grelhado no fogo forte e temperado com sal grosso, duas fatias de queijo prato e molho especial de churrasco.",
					 qtdServe: 1,
					 price: 34.80,
					 image: UIImage(named: "promocao-1") ?? UIImage() ),
		 
		 Cardapio(name: "Frango Jr com salada",
					 description: "Frango marinado, macio e suculento, feito no fogo forte (aprox. 130g in natura) com salada caesar (alface, queijo parmesão, croutons e molho caesar). Acompanha Limonada natural com maracujá 500ml",
					 price: 34.80,
					 image: UIImage(named: "promocao-2") ?? UIImage() ),
		],
		
		// Nossos Cortes
		[Cardapio(name: "Ancho Black 250",
					 description: "Um bife ancho com aprox. De 250g in natura da raça black angus. O famoso corte argentino, do começo do contra filet, com gordura entremeada e um sabor fantástico. (+3 acompanhamentos)",
					 price: 56.90,
					 image: UIImage(named: "cortes-1") ?? UIImage() ),
		 
		 Cardapio(name: "Angus Short-Rib",
					 description: "De short só tem o nome! Aproximadamente 450g de um delicioso filet retirado da parte nobre da costela do boi, com uma pequena tira de osso grelhado na churrasqueira + 3 acompanhamentos",
					 price: 66.90,
					 image: UIImage(named: "cortes-2") ?? UIImage() ),
		 
		 Cardapio(name: "Bife de chorizo de Angus",
					 description: "Um dos cortes mais pedidos da culinária argentina, retirado do centro do contra-filet com uma tira de gordura lateral que garante um sabor diferenciado (aprox. 200g in natura). (+3 acompanhamentos)",
					 price: 49.90,
					 image: UIImage(named: "cortes-3") ?? UIImage() ),
		 
		 Cardapio(name: "Chicken - (Barbecue ou Chimichurri)",
					 description: "Um caprichado filet de frango, tenro e macio, com duas opções de molho: barbecue ou chimichurri. Fantástico! (aprox. 300g in natura). (+3 acompanhamentos)",
					 price: 40.90,
					 image: UIImage(named: "cortes-4") ?? UIImage() )
		],
		
		// Churrasco Burger
		[Cardapio(name: "Cheese Bacon",
					 description: "Hambúrguer de 150g grelhado no fogo forte e temperado com sal grosso, duas fatias de queijo prato, quatro fatias de bacon e molho especial de churrasco.",
					 price: 32.90,
					 image: UIImage(named: "lanche-1") ?? UIImage() ),
		 
		 Cardapio(name: "Cheese egg salad",
					 description: "Hambúrguer de 150g grelhado no fogo forte e temperado com sal grosso, duas fatias de queijo, ovo frito, alface, cebola e molho especial de churrasco.",
					 price: 30.90,
					 image: UIImage(named: "lanche-2") ?? UIImage() )
		],
		
		// Porções extras
		[Cardapio(name: "Linguiça (1 und)",
					 description: "Linguiça de pernil fininha grelhada no fogo forte",
					 price: 5.90,
					 image: UIImage(named: "porcao-1") ?? UIImage() ),
		 
		 Cardapio(name: "Linguiça (2 und)",
					 description: "Duas linguiças de pernil fininhas grelhadas no fogo forte",
					 price: 9.90,
					 image: UIImage(named: "porcao-2") ?? UIImage() ),
		 
		 Cardapio(name: "Pão de alho (6 und)",
					 description: "Porção com 6 unidade do nosso delicioso pão de alho bolinha assado",
					 price: 11.90,
					 image: UIImage(named: "porcao-3") ?? UIImage() )
		],
		
		// Extras
		[Cardapio(name: "Arroz branco",
					 description: "Porção individual",
					 price: 6.90,
					 image: UIImage(named: "extra-1") ?? UIImage() ),
		 
		 Cardapio(name: "Farofa",
					 description: "Porção individual",
					 price: 6.90,
					 image: UIImage(named: "extra-2") ?? UIImage() ),
		 
		 Cardapio(name: "Salada Prime",
					 description: "Alface, tomate, cebola roxa, cenoura, batata palha, queijo, molho da casa (novo - azeite, mostarda e limão)",
					 price: 15.90,
					 image: UIImage(named: "extra-3") ?? UIImage() ),
		 
		 Cardapio(name: "Saladinha com o molho da casa",
					 description: "Alface, tomate, cebola roxa, cenoura com molho da casa (novo - azeite, mostarda e limão)",
					 price: 6.90,
					 image: UIImage(named: "extra-4") ?? UIImage() )
		],
		
		// Molhos extras
		[Cardapio(name: "Molho barbecue",
					 description: "Molho barbecue extra",
					 price: 4.90,
					 image: UIImage(named: "molho-1") ?? UIImage() ),
		 
		 Cardapio(name: "Molho chimichurri",
					 description: "Molho chimichurri extra",
					 price: 4.90,
					 image: UIImage(named: "molho-2") ?? UIImage() )
		],
		
		// Bebidas
		[Cardapio(name: "Becks", description: "Ibu = 20 Venda proibida para menores de 18 anos. Aprecie com Moderação.",
					 price: 9.90,
					 image: UIImage(named: "bebida-1") ?? UIImage() ),
		 
		 Cardapio(name: "Limonada natural",
					 description: "Limonada natural adoçada com stevia 500ml",
					 price: 7.90,
					 image: UIImage(named: "bebida-2") ?? UIImage() ),
		 
		 Cardapio(name: "Passion lemonade",
					 description: "Limonada natural com maracujá 500ml",
					 price: 9.90,
					 image: UIImage(named: "bebida-3") ?? UIImage() ),
		 
		 Cardapio(name: "Coca cola sem açúcar lata", description: "350ml", price: 6.90,
					 image: UIImage(named: "bebida-4") ?? UIImage() ),
		 
		 Cardapio(name: "Fanta guaraná lata", description: "350ml", price: 6.90,
					 image: UIImage(named: "bebida-5") ?? UIImage() )
		]
		
	]
	
	
	// MARK: - Function
	func getCountCategoria() -> Int {
		return self.categorias.count
	}
	
	func getNameCategoria(index: Int) -> String {
		return self.categorias[index]
	}
	
	func getCountPratosCategoria(index: Int) -> Int {
		return self.cardapios[index].count
	}
	
	func getPrato(categoria: Int, index: Int) -> Cardapio {
		return self.cardapios[categoria][index]
	}
	
}

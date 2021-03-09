//
//  HomeViewController.swift
//  Mania
//
//  Created by Alexandre Cardoso on 09/03/21.
//

import UIKit

class HomeViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var anuncioTableView: UITableView!
	@IBOutlet weak var cardapioTableView: UITableView!
	
	// MARK: - Variable
	var cardapios = [Cardapio]()
	let recomendados: [Cardapio] = [ Cardapio(nome: "Filet de Frango", peso: 130, preco: 15.90),
												Cardapio(nome: "New York Angus Prime", peso: 130, preco: 15.90),
												Cardapio(nome: "Linguiça de Pernil", peso: 200, preco: 21.90),
												Cardapio(nome: "Chicken & Barbecue", peso: 270, preco: 26.90)
	]
	let cortes: [Cardapio] = [ Cardapio(nome: "Filet de Frango", peso: 130, preco: 15.90),
										Cardapio(nome: "New York Angus Prime", peso: 130, preco: 15.90)
	]
	let lanches: [Cardapio] = [ Cardapio(nome: "Mc Lanche Feliz", peso: 130, preco: 15.90)
	]
	let bedidas: [Cardapio] = [ Cardapio(nome: "Refrigerante", peso: 130, preco: 15.90)
	]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configTableView()
		cardapios = recomendados
	}
	
	// MARK: - Function
	private func configTableView() {
		self.anuncioTableView.delegate = self
		self.anuncioTableView.dataSource = self
		self.anuncioTableView.isScrollEnabled = false
		self.anuncioTableView.register(PromocaoTableViewCell.nib(),
												 forCellReuseIdentifier: PromocaoTableViewCell.identifier)
		self.anuncioTableView.register(CategoriaTableViewCell.nib(),
												 forCellReuseIdentifier: CategoriaTableViewCell.identifier)
		
		self.cardapioTableView.delegate = self
		self.cardapioTableView.dataSource = self
		self.cardapioTableView.backgroundColor = .black
		self.cardapioTableView.register(CardapioTableViewCell.nib(),
												  forCellReuseIdentifier: CardapioTableViewCell.identifier)
	}
	
}


// MARK: - Extension TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		if tableView == anuncioTableView {
			return 2
		} else {
			return self.cardapios.count
		}
		
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		if tableView == anuncioTableView {
			
			if indexPath.row == 0 {
				guard let cell = tableView.dequeueReusableCell(withIdentifier: PromocaoTableViewCell.identifier,
																			  for: indexPath) as? PromocaoTableViewCell
				else { return UITableViewCell() }
				return cell
			} else {
				guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoriaTableViewCell.identifier,
																			  for: indexPath) as? CategoriaTableViewCell
				else { return UITableViewCell() }
				cell.delegate = self
				return cell
			}
			
		} else {
			
			let cardapio = self.cardapios[indexPath.row]
			guard let cell = tableView.dequeueReusableCell(withIdentifier: CardapioTableViewCell.identifier,
																		  for: indexPath) as? CardapioTableViewCell
			else { return UITableViewCell() }
			cell.setupCell(prato: cardapio)
			return cell
			
		}
		
	}
	
}


// MARK: - Extension CateTableView
extension HomeViewController: CategoriaProtocol {
	
	func getIndexCategoria(_ index: Int) {
		print("Index: \(index)")
		
		switch index {
			// Recomendado
			case 0:
				self.cardapios.removeAll()
				self.cardapios = self.recomendados
				
			// Cortes
			case 1:
				self.cardapios.removeAll()
				self.cardapios = self.cortes
				
			// Lanches
			case 2:
				self.cardapios.removeAll()
				self.cardapios = self.lanches
				
			// Bebidas
			case 3:
				self.cardapios.removeAll()
				self.cardapios = self.bedidas
				
			default:
				self.cardapios.removeAll()
				self.cardapios = self.recomendados
		}
		
		self.cardapioTableView.reloadData()
	}
	
}

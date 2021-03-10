//
//  HomeViewController.swift
//  Mania
//
//  Created by Alexandre Cardoso on 09/03/21.
//

import UIKit

class HomeViewController: UIViewController {
	
	// MARK: - IBOutlet
	@IBOutlet weak var mesaLabel: UILabel!
	@IBOutlet weak var comandaLabel: UILabel!
	@IBOutlet weak var categoriaCollectionView: UICollectionView!
	@IBOutlet weak var pratosTableView: UITableView!
	
	// MARK: - Variable
	var controller: HomeController = HomeController()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configCollectionView()
		configTableView()
	}
	
	// MARK: - Function
	private func configCollectionView() {
		self.categoriaCollectionView.delegate = self
		self.categoriaCollectionView.dataSource = self
		self.categoriaCollectionView.showsHorizontalScrollIndicator = false
		self.categoriaCollectionView.register(CategoriaCollectionViewCell.nib(),
														  forCellWithReuseIdentifier: CategoriaCollectionViewCell.identifier)
	}
	
	private func configTableView() {
		self.pratosTableView.delegate = self
		self.pratosTableView.dataSource = self
		
		self.pratosTableView.register(DestaqueTableViewCell.nib(),
												forCellReuseIdentifier: DestaqueTableViewCell.identifier)
		self.pratosTableView.register(PratosTableViewCell.nib(),
												forCellReuseIdentifier: PratosTableViewCell.identifier)
	}
	
}


// MARK: - Extension CollectionView
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return controller.getCountCategoria()
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let nameCategoria = self.controller.getNameCategoria(index: indexPath.row)
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriaCollectionViewCell.identifier,
																			 for: indexPath) as? CategoriaCollectionViewCell
		else { return UICollectionViewCell() }
		
		cell.setupCell(categoria: nameCategoria)
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		switch indexPath.row {
			case 1:
				return CGSize(width: 180, height: 50)
			case 2:
				return CGSize(width: 300, height: 50)
			default:
				return CGSize(width: 150, height: 50)
		}
		
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("Categoria Selecionada - \(self.controller.getNameCategoria(index: indexPath.row))")
		
		let posicao = IndexPath(item: 0, section: indexPath.row)
		self.pratosTableView.scrollToRow(at: posicao, at: .top, animated: true)
	}
	
}


// MARK: - Extension TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return self.controller.getCountCategoria()
	}
	
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return self.controller.getNameCategoria(index: section)
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 50
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return 1
		}
		return self.controller.getCountPratosCategoria(index: section)
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let prato = self.controller.getPrato(categoria: indexPath.section, index: indexPath.row)
		
		if indexPath.section == 0 {
			guard let cell = tableView.dequeueReusableCell(withIdentifier: DestaqueTableViewCell.identifier,
																		  for: indexPath) as? DestaqueTableViewCell
			else { return UITableViewCell() }
			return cell
		}
		
		guard let cell = tableView.dequeueReusableCell(withIdentifier: PratosTableViewCell.identifier,
																	  for: indexPath) as? PratosTableViewCell
		else { return UITableViewCell() }
		
		cell.setupTableCell(prato: prato)
		return cell
	}
	
}

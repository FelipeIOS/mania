//
//  CateTableViewCell.swift
//  TesteMania
//
//  Created by Alexandre Cardoso on 08/03/21.
//

import UIKit

protocol CategoriaProtocol {
	func getIndexCategoria(_ index: Int)
}

class CategoriaTableViewCell: UITableViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var categoriaCollectionView: UICollectionView!
	
	// MARK: - Variable
	static let identifier: String = "CategoriaTableViewCell"
	let categorias: [String] = ["Recomendados", "Cortes", "Lanches", "Bebidas"]
	var delegate: CategoriaProtocol?
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configCollectionView()
	}
	
	private func configCollectionView() {
		self.categoriaCollectionView.delegate = self
		self.categoriaCollectionView.dataSource = self
		self.categoriaCollectionView.showsHorizontalScrollIndicator = false
		self.categoriaCollectionView.backgroundColor = .black
		self.categoriaCollectionView.register(CategoriaCollectionViewCell.nib(),
														  forCellWithReuseIdentifier: CategoriaCollectionViewCell.identifier)
	}
	
}


// MARK: - Extension CollectionView
extension CategoriaTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		self.categorias.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let categoria = self.categorias[indexPath.row]
		
		guard let cellCat = collectionView.dequeueReusableCell(
					withReuseIdentifier: CategoriaCollectionViewCell.identifier,
					for: indexPath) as? CategoriaCollectionViewCell
		else { return UICollectionViewCell() }
		
		cellCat.setupCell(categoria: categoria)
		
		return cellCat
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 135, height: 50)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		print("Catergoria: \(categorias[indexPath.row])")
		self.delegate?.getIndexCategoria(indexPath.row)
	}
	
}


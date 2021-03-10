//
//  DestaqueTableViewCell.swift
//  TesteMania
//
//  Created by Alexandre Cardoso on 09/03/21.
//

import UIKit

class DestaqueTableViewCell: UITableViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var destaqueCollectionView: UICollectionView!
	
	// MARK: - Variable
	static let identifier: String = "DestaqueTableViewCell"
	let controller: HomeController = HomeController()
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configCollectionView()
	}
	
	
	// MARK: - Function
	private func configCollectionView() {
		self.destaqueCollectionView.delegate = self
		self.destaqueCollectionView.dataSource = self
		self.destaqueCollectionView.register(DestaqueCollectionViewCell.nib(),
														 forCellWithReuseIdentifier: DestaqueCollectionViewCell.identifier)
	}
	
}


// MARK: - Extension CollectionView
extension DestaqueTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.controller.getCountPratosCategoria(index: 0)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let prato = self.controller.getPrato(categoria: 0, index: indexPath.row)
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DestaqueCollectionViewCell.identifier,
																			 for: indexPath) as? DestaqueCollectionViewCell
		else { return UICollectionViewCell() }
		
		cell.setupCollectionCell(prato: prato)
		
		return cell
	}
	
}

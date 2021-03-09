//
//  PromocaoTableViewCell.swift
//  Mania
//
//  Created by Alexandre Cardoso on 09/03/21.
//

import UIKit

class PromocaoTableViewCell: UITableViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var promocaoCollectionView: UICollectionView!
	
	// MARK: - Variable
	static let identifier: String = "PromocaoTableViewCell"
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configCollectionView()
	}
	
	private func configCollectionView() {
		self.promocaoCollectionView.delegate = self
		self.promocaoCollectionView.dataSource = self
		self.promocaoCollectionView.showsHorizontalScrollIndicator = false
		self.promocaoCollectionView.backgroundColor = .black
		self.promocaoCollectionView.register(PromocaoCollectionViewCell.nib(),
														 forCellWithReuseIdentifier: PromocaoCollectionViewCell.identifier)
	}
	
}



// MARK: - Extension CollectionView
extension PromocaoTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 4
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromocaoCollectionViewCell.identifier,
																			 for: indexPath) as? PromocaoCollectionViewCell
		else { return UICollectionViewCell() }
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width - 40, height: 180)
	}
	
}

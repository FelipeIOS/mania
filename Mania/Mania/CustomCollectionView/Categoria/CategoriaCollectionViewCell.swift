//
//  CategoriaCollectionViewCell.swift
//  TesteMania
//
//  Created by Alexandre Cardoso on 07/03/21.
//

import UIKit

class CategoriaCollectionViewCell: UICollectionViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var cellView: UIView!
	@IBOutlet weak var nameLabel: UILabel!
	
	static let identifier: String = "CategoriaCollectionViewCell"
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		configView()
	}
	
	private func configView() {
		self.cellView.layer.cornerRadius = 5
	}
	
	func setupCell(categoria: String) {
		self.nameLabel.text = categoria
	}
	
}

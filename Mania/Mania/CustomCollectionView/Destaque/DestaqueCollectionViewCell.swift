//
//  DestaqueCollectionViewCell.swift
//  TesteMania
//
//  Created by Alexandre Cardoso on 09/03/21.
//

import UIKit

class DestaqueCollectionViewCell: UICollectionViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var cellView: UIView!
	@IBOutlet weak var pratoImageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var qtdServeLabel: UILabel!
	
	// MARK: - Variable
	static let identifier: String = "DestaqueCollectionViewCell"
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configView()
	}
	
	
	// MARK: - Function
	private func configView() {
		self.cellView.layer.borderWidth = 1.5
		self.cellView.layer.borderColor = UIColor.lightGray.cgColor
		self.cellView.layer.cornerRadius = 5
	}
	
	func setupCollectionCell(prato: Cardapio) {
		self.pratoImageView.image = prato.image
		self.nameLabel.text = prato.name
		self.descriptionLabel.text = prato.description
		self.priceLabel.text = "R$ \(prato.price)"
		
		if let qtd = prato.qtdServe, qtd >= 1 {
			if qtd == 1 {
				self.qtdServeLabel.text = "Serve \(qtd) pessoa"
			} else if qtd > 1 {
				self.qtdServeLabel.text = "Serve \(qtd) pessoas"
			}
		}
		
	}
	
}

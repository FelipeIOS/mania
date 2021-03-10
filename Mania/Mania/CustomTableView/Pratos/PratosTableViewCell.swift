//
//  PratosTableViewCell.swift
//  TesteMania
//
//  Created by Alexandre Cardoso on 09/03/21.
//

import UIKit

class PratosTableViewCell: UITableViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var pratoImageView: UIImageView!
	@IBOutlet weak var descriptionLabl: UILabel!
	@IBOutlet weak var qtdServeLabel: UILabel!
	@IBOutlet weak var pricelLabel: UILabel!
	
	// MARK: - Variable
	static let identifier: String = "PratosTableViewCell"
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		configImageView()
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		// Configure the view for the selected state
	}
	
	// MARK: - Function
	private func configImageView() {
		self.pratoImageView.layer.cornerRadius = 5
		self.pratoImageView.layer.borderWidth = 1.5
		self.pratoImageView.layer.borderColor = UIColor.lightGray.cgColor
	}
	
	func setupTableCell(prato: Cardapio) {
		self.nameLabel.text = prato.name
		self.pratoImageView.image = prato.image
		self.descriptionLabl.text = prato.description
		self.pricelLabel.text = "R$ \(prato.price)"
		
		if let qtd = prato.qtdServe, qtd >= 1 {
			if qtd == 1 {
				self.qtdServeLabel.text = "Serve \(qtd) pessoa"
			} else {
				self.qtdServeLabel.text = "Serve \(qtd) pessoas"
			}
		}
	}
	
}

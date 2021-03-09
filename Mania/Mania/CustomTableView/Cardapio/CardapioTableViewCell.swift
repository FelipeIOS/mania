//
//  CardapioTableViewCell.swift
//  TesteMania
//
//  Created by Alexandre Cardoso on 07/03/21.
//

import UIKit

class CardapioTableViewCell: UITableViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var cellView: UIView!
	@IBOutlet weak var fotoImageView: UIImageView!
	@IBOutlet weak var nomeLabel: UILabel!
	@IBOutlet weak var pesoLabel: UILabel!
	@IBOutlet weak var precoLabel: UILabel!
	
	// MARK: - Variable
	static let identifier: String = "CardapioTableViewCell"
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		configView()
	}
	
	private func configView() {
		self.cellView.layer.cornerRadius = 10
		self.cellView.layer.borderWidth = 1.5
		self.cellView.layer.borderColor = UIColor.red.cgColor
	}
	
	func setupCell(prato: Cardapio) {
		self.fotoImageView.image = UIImage(systemName: "person.3.fill")
		self.nomeLabel.text = prato.nome
		self.pesoLabel.text = "Aprox. \(prato.peso) gramas"
		self.precoLabel.text = "R$ \(prato.preco)"
	}
	
}

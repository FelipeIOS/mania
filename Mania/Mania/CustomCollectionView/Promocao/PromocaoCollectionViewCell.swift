//
//  PromocaoCollectionViewCell.swift
//  Mania
//
//  Created by Alexandre Cardoso on 09/03/21.
//

import UIKit

class PromocaoCollectionViewCell: UICollectionViewCell {
	
	// MARK: - IBOutlet
	@IBOutlet weak var cellView: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	
	// MARK: - Variable
	static let identifier: String = "PromocaoCollectionViewCell"
	
	static func nib() -> UINib {
		return UINib(nibName: self.identifier, bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		configView()
	}
	
	private func configView() {
		self.cellView.layer.cornerRadius = 10
		self.cellView.layer.borderColor = UIColor.red.cgColor
		self.cellView.layer.borderWidth = 1.5
	}
	
	func setupCell(title: String) {
		self.titleLabel.text = title
	}
	
}

//
//  Cell.swift
//  Weather
//
//  Created by Anton Ivanov on 21.09.2022.
//

import UIKit

protocol CollectionViewCellDelegate {
	func update(_ weather: YWResponse)
}

class CollectionViewCell: UICollectionViewCell {

	class var identifier: String {
		return "CollectionViewCell"
	}

	private lazy var blurEffectView: UIVisualEffectView = {
		let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)

		let blurEffectView = UIVisualEffectView(effect: blurEffect)

		blurEffectView.frame = contentView.bounds
		blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		blurEffectView.layer.cornerRadius = 15
		blurEffectView.clipsToBounds = true

		return blurEffectView
	}()

	public lazy var title: UILabel = {
		let label = UILabel(
			frame: CGRect(
				x: 35,
				y: 15,
				width: self.contentView.frame.width - 50,
				height: 15
			)
		)

		label.text = "--"
		label.font = UIFont.systemFont(ofSize: 15)
		label.textColor = .systemGray

		return label
	}()

	public lazy var imageView: UIImageView = {
		let imageView = UIImageView(
			frame: CGRect(
				x: 15,
				y: 15,
				width: 15,
				height: 15
			)
		)

		imageView.image = UIImage(systemName: "circle.fill")
		imageView.tintColor = .systemGray
		imageView.contentMode = .center

		return imageView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.contentView.backgroundColor = nil
		self.contentView.addSubview(self.blurEffectView)
		self.contentView.addSubview(self.imageView)
		self.contentView.addSubview(self.title)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
	}

	override func prepareForReuse() {
		super.prepareForReuse()

		self.title.text = "--"
		self.imageView.image = UIImage(systemName: "circle.fill")
	}

	func update(_ weather: YWResponse) {

	}


}


extension CollectionViewCell: CollectionViewCellDelegate {

}


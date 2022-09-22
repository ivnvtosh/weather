//
//  ForecastValueCollectionViewCell.swift
//  Weather
//
//  Created by Anton Ivanov on 22.09.2022.
//

import UIKit

class ForecastValueCollectionViewCell: UICollectionViewCell {

	class var identifier: String {
		return "ForecastValueCollectionViewCell"
	}

	public lazy var title: UILabel = {
		let label = UILabel(
			frame: CGRect(
				x: 15,
				y: 45,
				width: self.contentView.frame.width,
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

		return imageView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.contentView.layer.cornerRadius = 15
		self.contentView.backgroundColor = .systemGray5

		self.contentView.addSubview(self.title)
		self.contentView.addSubview(self.imageView)
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


}


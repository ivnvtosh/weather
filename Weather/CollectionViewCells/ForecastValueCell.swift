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

	public lazy var hour: UILabel = {
		let label = UILabel(
			frame: CGRect(
				x: 0,
				y: 15,
				width: self.contentView.frame.width,
				height: 15
			)
		)

		label.text = "--"
		label.font = UIFont.systemFont(ofSize: 15)
		label.textColor = .systemGray
		label.textAlignment = .center

		return label
	}()

	public lazy var imageView: UIImageView = {
		let imageView = UIImageView(
			frame: CGRect(
				x: 0,
				y: 45,
				width: self.contentView.frame.width,
				height: 15
			)
		)

		imageView.image = UIImage(systemName: "circle.fill")
		imageView.tintColor = .systemGray
		imageView.contentMode = .center

		return imageView
	}()

	public lazy var temperature: UILabel = {
		let label = UILabel(
			frame: CGRect(
				x: 0,
				y: 75,
				width: self.contentView.frame.width,
				height: 15
			)
		)

		label.text = "--"
		label.font = UIFont.systemFont(ofSize: 15)
		label.textColor = .white
		label.textAlignment = .center

		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.contentView.layer.cornerRadius = 15
		self.contentView.backgroundColor = .systemGray5

		self.contentView.addSubview(self.hour)
		self.contentView.addSubview(self.imageView)
		self.contentView.addSubview(self.temperature)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
	}

	override func prepareForReuse() {
		super.prepareForReuse()

		self.hour.text = "--"
		self.imageView.image = UIImage(systemName: "circle.fill")
		self.temperature.text = "--"
	}


}


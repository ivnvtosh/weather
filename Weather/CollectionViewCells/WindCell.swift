//
//  WindCell.swift
//  Weather
//
//  Created by Anton Ivanov on 25.09.2022.
//

import UIKit

class WindCollectionViewCell: CollectionViewCell {

	class override var identifier: String {
		return "WindCollectionViewCell"
	}

	public lazy var speed: UILabel = {
		let label = UILabel(
			frame: CGRect(
				x: 15,
				y: 45,
				width: self.contentView.frame.width - 30,
				height: 40
			)
		)

		label.text = "--"
		label.font = UIFont.systemFont(ofSize: 40)
		label.textColor = .white

		return label
	}()

	public lazy var direction: UIImageView = {
		let frame = self.contentView.frame

		let imageView = UIImageView(
			frame: CGRect(
				x: frame.width - frame.width / 4 - 15,
				y: frame.height - frame.width / 4 - 15,
				width: frame.width / 4,
				height: frame.width / 4
			)
		)

		imageView.image = UIImage(systemName: "circle")
		imageView.tintColor = .white

		return imageView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.title.text = "WIND"
		self.imageView.image = UIImage(systemName: "wind")

		self.contentView.addSubview(self.speed)
		self.contentView.addSubview(self.direction)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
	}

	override func prepareForReuse() {
		super.prepareForReuse()

		self.speed.text = "--"
	}

	override func update(_ weather: YWResponse) {
		guard let fact = weather.fact else {
			return
		}

		guard let windSpeed = fact.windSpeed else {
			return
		}

		guard let windDirection = fact.windDirection else {
			return
		}

//		guard let windGust = fact.windGust else {
//			return
//		}

		self.speed.text = String(windSpeed) + " m/s"

		switch windDirection {
		case .north:
			self.direction.image = UIImage(systemName: "arrow.up.circle")
		case .northeast:
			self.direction.image = UIImage(systemName: "arrow.upright.circle")
		case .east:
			self.direction.image = UIImage(systemName: "arrow.right.circle")
		case .southeast:
			self.direction.image = UIImage(systemName: "arrow.down.right.circle")
		case .south:
			self.direction.image = UIImage(systemName: "arrow.down.circle")
		case .southwest:
			self.direction.image = UIImage(systemName: "arrow.down.left.circle")
		case .west:
			self.direction.image = UIImage(systemName: "arrow.left.circle")
		case .northwest:
			self.direction.image = UIImage(systemName: "arrow.up.left.circle")
		case .calm:
			self.direction.image = UIImage(systemName: "record.circle")
		}

	}


}


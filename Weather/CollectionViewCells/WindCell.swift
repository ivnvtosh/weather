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

	override var weather: YWResponse?  {
		didSet {
			guard let fact = weather?.fact else { return }

			if let windSpeed = fact.windSpeed {
				self.speed.text = String(windSpeed) + " m/s".localized()
			}

			if let windDirection = fact.windDirection {
				self.direction.image = windDirection.image
			}

//			if let windGust = fact.windGust {
//				self. = String(windGust)
//			}
		}
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

		self.contentView.addSubview(self.speed)
		self.contentView.addSubview(self.direction)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()

		self.title.text = "WIND".localized()
		self.imageView.image = UIImage(systemName: "wind")
	}

	override func prepareForReuse() {
		super.prepareForReuse()

		self.speed.text = ""
		self.direction.image = nil
	}


}


extension WindDirection {
	var image: UIImage? {
		switch self {
		case .north:
			return UIImage(systemName: "arrow.up.circle")
		case .northeast:
			return UIImage(systemName: "arrow.upright.circle")
		case .east:
			return UIImage(systemName: "arrow.right.circle")
		case .southeast:
			return UIImage(systemName: "arrow.down.right.circle")
		case .south:
			return UIImage(systemName: "arrow.down.circle")
		case .southwest:
			return UIImage(systemName: "arrow.down.left.circle")
		case .west:
			return UIImage(systemName: "arrow.left.circle")
		case .northwest:
			return UIImage(systemName: "arrow.up.left.circle")
		case .calm:
			return UIImage(systemName: "record.circle")
		}
	}
}


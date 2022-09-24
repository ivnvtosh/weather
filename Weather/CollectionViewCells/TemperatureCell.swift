//
//  TemperatureCell.swift
//  Weather
//
//  Created by Anton Ivanov on 25.09.2022.
//

import UIKit

class TemperatureCollectionViewCell: CollectionViewCell {

	class override var identifier: String {
		return "TemperatureCollectionViewCell"
	}

	public lazy var temperature: UILabel = {
		let label = UILabel(
			frame: CGRect(
				x: 15,
				y: 45,
				width: self.contentView.frame.width - 30,
				height: 60
			)
		)

		label.text = "--"
		label.font = UIFont.systemFont(ofSize: 60)
		label.textColor = .white

		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.title.text = "TEMPERATURE"
		self.imageView.image = UIImage(systemName: "thermometer")

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

		self.temperature.text = "--"
	}

	override func update(_ weather: YWResponse) {
		guard let temperature = weather.fact?.temperature else {
			return
		}

		self.temperature.text = String(temperature) + "°"
	}


}


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

	override var weather: YWResponse?  {
		didSet {
			if let temperature = weather?.fact?.temperature {
				self.temperature.text = String(temperature) + "°"
			}
		}
	}

	public lazy var temperature: UILabel = {
		let label = UILabel()

		label.font = UIFont.systemFont(ofSize: 60)
		label.textColor = .white

		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.contentView.addSubview(self.temperature)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()

		self.title.text = "TEMPERATURE".localized()
		self.imageView.image = UIImage(systemName: "thermometer")

		let frame = self.contentView.frame

		self.temperature.frame = CGRect(
			x: 15,
			y: 45,
			width: frame.width - 30,
			height: 60
		)
	}

	override func prepareForReuse() {
		super.prepareForReuse()

		self.temperature.text = ""
	}


}


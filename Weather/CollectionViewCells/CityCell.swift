//
//  CityCell.swift
//  Weather
//
//  Created by Anton Ivanov on 25.09.2022.
//

import UIKit
import CoreLocation

class CityCollectionViewCell: CollectionViewCell {

	class override var identifier: String {
		return "CityCollectionViewCell"
	}

	public lazy var city: UILabel = {
		let label = UILabel(
			frame: CGRect(
				x: 15,
				y: 30,
				width: self.contentView.frame.width - 30,
				height: self.contentView.frame.height - 60
			)
		)

		label.text = "--"
		label.font = UIFont.systemFont(ofSize: 60)
		label.textColor = .white
		label.textAlignment = .center

		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.title.text = "CITY"
		self.imageView.image = UIImage(systemName: "person.fill")

		self.contentView.addSubview(self.city)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
	}

	override func prepareForReuse() {
		super.prepareForReuse()

		self.city.text = "--"
	}

	override func update(_ weather: YWResponse) {
		guard let latitude = weather.info?.latitude,
			  let longitude = weather.info?.longitude else {
			return
		}

		let geoCoder = CLGeocoder()
		let location = CLLocation(latitude: latitude, longitude: longitude)

		geoCoder.reverseGeocodeLocation(
				location,
				completionHandler: { [weak self] (placemarks, error) -> Void in
					if let error = error {
						print(error)
						return
					}

					guard let placeMark = placemarks?.first else {
						return
					}

					DispatchQueue.main.async {
						self?.city.text = placeMark.locality
					}
			}
		)
	}


}


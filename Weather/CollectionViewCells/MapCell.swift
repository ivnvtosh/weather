//
//  MapCell.swift
//  Weather
//
//  Created by Anton Ivanov on 22.09.2022.
//

import UIKit
import MapKit

class MapCollectionViewCell: CollectionViewCell {

	class override var identifier: String {
		return "MapCollectionViewCell"
	}

	override var weather: YWResponse?  {
		didSet {
			guard let latitude = weather?.info?.latitude,
				  let longitude = weather?.info?.longitude else { return }

			let region = MKCoordinateRegion(
				center: CLLocationCoordinate2D(
					latitude: latitude,
					longitude: longitude
				),
				latitudinalMeters: 10000,
				longitudinalMeters: 10000
			)

			self.mapView.setRegion(region, animated: true)
		}
	}

	private lazy var mapView: MKMapView = {
		let mapView = MKMapView()

		mapView.layer.cornerRadius = 15
		mapView.isScrollEnabled = false
		mapView.isZoomEnabled = false
		mapView.isPitchEnabled = false
		mapView.isRotateEnabled = false

		return mapView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.contentView.addSubview(self.mapView)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()

		self.title.text = "MAP".localized()
		self.imageView.image = UIImage(systemName: "map.fill")

		let frame = self.contentView.frame

		self.mapView.frame = CGRect(
			x: 15,
			y: 45,
			width: frame.width - 30,
			height: frame.height - 60
		)
	}

	override func prepareForReuse() {
		super.prepareForReuse()
	}


}


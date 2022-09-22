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

	private lazy var mapView: MKMapView = {
		let mapView = MKMapView()

		mapView.isScrollEnabled = false

		return mapView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.contentView.addSubview(self.mapView)
		self.mapView.layer.cornerRadius = 15
		self.imageView.image = UIImage(systemName: "map.fill")
		self.title.text = "MAP"
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()

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


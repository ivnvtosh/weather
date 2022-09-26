//
//  ForecastCell.swift
//  Weather
//
//  Created by Anton Ivanov on 22.09.2022.
//

import UIKit

class ForecastCollectionViewCell: CollectionViewCell {

	class override var identifier: String {
		return "ForecastCollectionViewCell"
	}

	override var weather: YWResponse?  {
		didSet {
			guard let hours = weather?.forecasts?[0].hours else { return }
			self.hours = hours
			self.collectionView.reloadData()
		}
	}

	private var hours = Hours()

	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()

		layout.scrollDirection = .horizontal

		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

		collectionView.register(
			ForecastValueCollectionViewCell.self,
			forCellWithReuseIdentifier: ForecastValueCollectionViewCell.identifier
		)

		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.showsVerticalScrollIndicator = false
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.backgroundColor = nil

		return collectionView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.contentView.addSubview(self.collectionView)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()

		self.title.text = "FORECAST"
		self.imageView.image = UIImage(systemName: "sun.min.fill")

		let frame = self.contentView.frame

		self.collectionView.frame = CGRect(
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


extension ForecastCollectionViewCell: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return hours.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: ForecastValueCollectionViewCell.identifier,
			for: indexPath
		) as! ForecastValueCollectionViewCell

		if let hour = hours[indexPath.item].hour {
			cell.hour.text = hour
		}

//		if let icon = hours[indexPath.item].icon {
//			let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(icon).svg")!
//
//			DispatchQueue.global().async {
//				if let data = try? Data(contentsOf: url) {
//					let image = UIImage(data: data)
//					DispatchQueue.main.async {
//						cell.imageView.image = image
//					}
//				}
//			}
//		}

		if let temperature = hours[indexPath.item].temperature {
			cell.temperature.text = String(temperature) + "°"
		}

		return cell
	}


}


extension ForecastCollectionViewCell: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let numberOfCells = 6
		let width = (self.collectionView.frame.width - CGFloat(numberOfCells - 1) * 10) / CGFloat(numberOfCells)
		let height = self.collectionView.frame.height

		return CGSize(width: width, height: height)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 10
	}


}


extension ForecastCollectionViewCell: UICollectionViewDelegate {

}


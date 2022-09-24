//
//  ViewController.swift
//  Weather
//
//  Created by Anton Ivanov on 21.09.2022.
//

import UIKit

class ViewController: UIViewController {

	private let weatherService: WeatherService = YWService(key: Storage.key!)

	var delegateTemperature: TemperatureCollectionViewCellDelegate?

	public var weather: YWResponse? {
		didSet {
			DispatchQueue.main.async {
				self.delegateTemperature?.update(self.weather?.fact?.temperature)
			}

		}
	}

	private lazy var imageView: UIImageView = {
		let imageView = UIImageView()

		imageView.image = UIImage(named: "iOS 15 dark")

		return imageView
	}()

	private lazy var collectionView: UICollectionView = {
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

		collectionView.register(
			CollectionViewCell.self,
			forCellWithReuseIdentifier: CollectionViewCell.identifier
		)
		collectionView.register(
			DataCollectionViewCell.self,
			forCellWithReuseIdentifier: DataCollectionViewCell.identifier
		)
		collectionView.register(
			TemperatureCollectionViewCell.self,
			forCellWithReuseIdentifier: TemperatureCollectionViewCell.identifier
		)
		collectionView.register(
			ForecastCollectionViewCell.self,
			forCellWithReuseIdentifier: ForecastCollectionViewCell.identifier
		)
		collectionView.register(
			MapCollectionViewCell.self,
			forCellWithReuseIdentifier: MapCollectionViewCell.identifier
		)
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.showsVerticalScrollIndicator = false
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.backgroundColor = nil

		return collectionView
	}()

	private func updateWeather() {
		let request = YWRequest(55.75396, 37.620393)
		request.extra = true

		self.weatherService.weather(with: request) { [weak self] response, error in
			if let error = error {
				print(error)
				return
			}

			guard let response = response else {
				return
			}

			self?.weather = response
		}
	}

	// MARK: UIViewController Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.addSubview(self.imageView)
		self.view.addSubview(self.collectionView)

		updateWeather()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		guard let frame = self.view.window?.windowScene?.screen.bounds else { return }

		self.imageView.frame = frame
		self.collectionView.frame = frame
	}


}


extension ViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch indexPath.item {
		case 0:
			let cell = collectionView.dequeueReusableCell(
				withReuseIdentifier: TemperatureCollectionViewCell.identifier,
				for: indexPath
			) as! TemperatureCollectionViewCell

			self.delegateTemperature = cell

			return cell

		case 2:
			let cell = collectionView.dequeueReusableCell(
				withReuseIdentifier: ForecastCollectionViewCell.identifier,
				for: indexPath
			) as! ForecastCollectionViewCell

			return cell

		case 5:
			let cell = collectionView.dequeueReusableCell(
				withReuseIdentifier: MapCollectionViewCell.identifier,
				for: indexPath
			) as! MapCollectionViewCell

			return cell

		default:
			let cell = collectionView.dequeueReusableCell(
				withReuseIdentifier: CollectionViewCell.identifier,
				for: indexPath
			) as! CollectionViewCell

			return cell

		}
	}


}


extension ViewController: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let size = self.view.frame.size
		let length = CGFloat.minimum(size.width, size.height) / 2 - 25

		switch indexPath.item {
		case 2:
			return CGSize(width: length * 2 + 10, height: length)
		case 5:
			return CGSize(width: length * 2 + 10, height: length * 2 + 10)
		default:
			return CGSize(width: length, height: length)
		}
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
	}


}


extension ViewController: UICollectionViewDelegate {

}


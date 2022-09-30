//
//  ViewController.swift
//  Weather
//
//  Created by Anton Ivanov on 21.09.2022.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
	func update(key: String)
}

class ViewController: UIViewController {

	private var weatherService: WeatherService? {
		didSet {
			updateWeather()
		}
	}

	private var cells = [
		CityCollectionViewCell.self,
		TemperatureCollectionViewCell.self,
		WindCollectionViewCell.self,
		ForecastCollectionViewCell.self,
		ForecastWeekCollectionViewCell.self,
		MapCollectionViewCell.self,
	]

	private var delegates = [String : CollectionViewCellDelegate]()

	private var key: String? {
		didSet {
			guard let key = key else { return }
			self.weatherService = YWService(key: key)
		}
	}

	private var weather: YWResponse? {
		didSet {
			guard let weather = weather else {
				return
			}

			DispatchQueue.main.async {
				for (_, delegate) in self.delegates {
					delegate.update(weather)
				}
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

		for cell in self.cells {
			collectionView.register(cell, forCellWithReuseIdentifier: cell.identifier)
		}

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

		self.weatherService?.weather(with: request) { [weak self] response, error in
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

		if let key = Storage.key {
			self.key = key
		} else {
			let cell = KeyCollectionViewCell.self
			collectionView.register(cell, forCellWithReuseIdentifier: cell.identifier)
			self.cells.insert(cell, at: 0)
			collectionView.reloadData()
		}
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
		return cells.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let identifier = cells[indexPath.item].identifier

		let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: identifier,
			for: indexPath
		) as! CollectionViewCell

		cell.weather = weather

		self.delegates[identifier] = cell

		if identifier == "KeyCollectionViewCell" {
			let cell = cell as! KeyCollectionViewCell
			cell.delegate = self
		}

		return cell
	}
}


extension ViewController: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let identifier = cells[indexPath.item].identifier

		let frame = self.view.frame
		let length = CGFloat.minimum(frame.width, frame.height) / 2 - 25

		switch identifier {
		case "KeyCollectionViewCell", "CityCollectionViewCell", "ForecastCollectionViewCell":
			return CGSize(width: length * 2 + 10, height: length)
		case "ForecastWeekCollectionViewCell", "MapCollectionViewCell":
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


extension ViewController: ViewControllerDelegate {
	func update(key: String) {
		Storage.key = key

		self.key = key
		self.cells.removeFirst()

		let indexPath = IndexPath(item: 0, section: 0)
		DispatchQueue.main.async {
			self.collectionView.deleteItems(at: [indexPath])
		}
	}
}


//
//  ViewController.swift
//  Weather
//
//  Created by Anton Ivanov on 21.09.2022.
//

import UIKit

class ViewController: UIViewController {



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

		return collectionView
	}()

	// MARK: UIViewController Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.addSubview(self.collectionView)
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		guard let frame = self.view.window?.windowScene?.screen.bounds else { return }

		self.collectionView.frame = frame
	}


}


extension ViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch indexPath.item {
		case 1:
			return collectionView.dequeueReusableCell(
				withReuseIdentifier: CollectionViewCell.identifier,
				for: indexPath
			) as! CollectionViewCell
		case 2:
			return collectionView.dequeueReusableCell(
				withReuseIdentifier: ForecastCollectionViewCell.identifier,
				for: indexPath
			) as! ForecastCollectionViewCell
		case 5:
			return collectionView.dequeueReusableCell(
				withReuseIdentifier: MapCollectionViewCell.identifier,
				for: indexPath
			) as! MapCollectionViewCell
		default:
			return collectionView.dequeueReusableCell(
				withReuseIdentifier: DataCollectionViewCell.identifier,
				for: indexPath
			) as! DataCollectionViewCell
		}
	}


}


extension ViewController: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let length = CGFloat.minimum(self.view.frame.size.width, self.view.frame.size.height) / 2 - 25

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


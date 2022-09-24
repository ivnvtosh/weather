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

		self.title.text = "FORECAST"
		self.imageView.image = UIImage(systemName: "sun.min.fill")
		self.contentView.addSubview(self.collectionView)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()

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

	override func update(_ weather: YWResponse) {

	}


}


extension ForecastCollectionViewCell: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell =  collectionView.dequeueReusableCell(
			withReuseIdentifier: ForecastValueCollectionViewCell.identifier,
			for: indexPath
		) as! ForecastValueCollectionViewCell

		return cell
	}


}


extension ForecastCollectionViewCell: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let numberOfCells = 4
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


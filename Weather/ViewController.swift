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
			DataCollectionViewCell.self,
			forCellWithReuseIdentifier: DataCollectionViewCell.identifier
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
		let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: DataCollectionViewCell.identifier,
			for: indexPath
		) as! DataCollectionViewCell

		return cell
	}


}


extension ViewController: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let length = CGFloat.minimum(self.view.frame.size.width, self.view.frame.size.height) / 2 - 25

		return CGSize(width: length, height: length)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 20, bottom: 10, right: 20)
	}


}

extension ViewController: UICollectionViewDelegate {

}


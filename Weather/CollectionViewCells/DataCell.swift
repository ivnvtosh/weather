//
//  DataCell.swift
//  Weather
//
//  Created by Anton Ivanov on 21.09.2022.
//

import UIKit

class DataCollectionViewCell: CollectionViewCell {

	class override var identifier: String {
		return "DataCollectionViewCell"
	}

	public lazy var data: UILabel = {
		let label = UILabel(
			frame: CGRect(
				x: 15,
				y: 45,
				width: self.contentView.frame.width - 30,
				height: 60
			)
		)

		label.text = "--"
		label.font = UIFont.systemFont(ofSize: 60)
		label.textColor = .white

		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.contentView.addSubview(self.data)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
	}

	override func prepareForReuse() {
		super.prepareForReuse()

		self.data.text = "--"
	}


}


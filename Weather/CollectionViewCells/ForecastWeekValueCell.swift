//
//  ForecastWeekValueCell.swift
//  Weather
//
//  Created by Anton Ivanov on 25.09.2022.
//

import UIKit

class ForecastWeekValueTableViewCell: UITableViewCell {

	class var identifier: String {
		return "ForecastWeekValueTableViewCell"
	}

	public lazy var day: UILabel = {
		let label = UILabel(
			frame: CGRect(
				x: 0,
				y: 0,
				width:  self.contentView.frame.height,
				height: self.contentView.frame.height
			)
		)

		label.text = "--"
		label.font = UIFont.systemFont(ofSize: 20)
		label.textColor = .white
		label.textAlignment = .left

		return label
	}()

	public lazy var temperature: UILabel = {
		let label = UILabel(
			frame: CGRect(
				x: self.contentView.frame.height + 20,
				y: 0,
				width:  self.contentView.frame.height,
				height: self.contentView.frame.height
			)
		)

		label.text = "--"
		label.font = UIFont.systemFont(ofSize: 20)
		label.textColor = .white

		return label
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

		self.backgroundColor = .clear

		self.contentView.addSubview(self.day)
		self.contentView.addSubview(self.temperature)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()
	}

	override func prepareForReuse() {
		super.prepareForReuse()

		self.day.text = "--"
		self.temperature.text = "--"
	}


}


//
//  ForecastWeekCell.swift
//  Weather
//
//  Created by Anton Ivanov on 25.09.2022.
//

import UIKit

class ForecastWeekCollectionViewCell: CollectionViewCell {

	class override var identifier: String {
		return "ForecastWeekCollectionViewCell"
	}

	override var weather: YWResponse?  {
		didSet {
			guard let forecasts = weather?.forecasts else { return }
			self.forecasts = forecasts
			self.tableView.reloadData()
		}
	}

	private var forecasts = Forecasts()

	public lazy var tableView: UITableView = {
		let tableView = UITableView(
			frame: CGRect(
				x: 15,
				y: 45,
				width: self.contentView.frame.width - 30,
				height:  self.contentView.frame.height - 60
			)
		)

		tableView.register(
			ForecastWeekValueTableViewCell.self,
			forCellReuseIdentifier: ForecastWeekValueTableViewCell.identifier
		)

		tableView.delegate = self
		tableView.dataSource = self
		tableView.showsVerticalScrollIndicator = false
		tableView.showsHorizontalScrollIndicator = false
		tableView.backgroundColor = .clear
		tableView.rowHeight = self.contentView.frame.height / 7 - 7
		tableView.isScrollEnabled = false

		return tableView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.contentView.addSubview(self.tableView)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()

		self.title.text = "FORECAST WEAK".localized()
		self.imageView.image = UIImage(systemName: "sun.max.fill")
	}

	override func prepareForReuse() {
		super.prepareForReuse()
	}


}

extension ForecastWeekCollectionViewCell: UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(
			withIdentifier: ForecastWeekValueTableViewCell.identifier,
			for: indexPath
		) as! ForecastWeekValueTableViewCell

		cell.selectionStyle = .none

		let forecast = self.forecasts[indexPath.row]

		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"

		if let date = dateFormatter.date(from: forecast.date!) {
			let day = Calendar.current.component(.weekday, from: date)
			switch day {
			case 1:
				cell.day.text = "Sat".localized()
			case 2:
				cell.day.text = "Sun".localized()
			case 3:
				cell.day.text = "Mon".localized()
			case 4:
				cell.day.text = "Tue".localized()
			case 5:
				cell.day.text = "Wed".localized()
			case 6:
				cell.day.text = "Thu".localized()
			case 7:
				cell.day.text = "Fri".localized()
			default:
				cell.day.text = "--"
			}
		}

		if let temperature = forecast.parts?.day?.temperatureAvg {
			cell.temperature.text = String(temperature) + "°"
		}
		
		return cell
	}


}


extension ForecastWeekCollectionViewCell: UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return forecasts.count
	}
}


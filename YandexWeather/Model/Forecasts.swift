//
//  Forecasts.swift
//  Yandex Weather
//
//  Created by Anton Ivanov on 14.09.2022.
//

import Foundation

// MARK: - Forecast
public struct Forecast: Codable {
	public let date: String?
	public let dateTs: Int?
	public let week: Int?
	public let sunrise: String?
	public let sunset: String?
	public let riseBegin: String?
	public let setEnd: String?
	public let moonCode: Int?
	public let moonText: String?
	public let parts: Parts?
	public let hours: Hours?
	public let biomet: Biomet?

	enum CodingKeys: String, CodingKey {
		case date
		case dateTs = "date_ts"
		case week
		case sunrise
		case sunset
		case riseBegin = "rise_begin"
		case setEnd = "set_end"
		case moonCode = "moon_code"
		case moonText = "moon_text"
		case parts
		case hours
		case biomet
	}
}

// MARK: - Forecasts
public typealias Forecasts = [Forecast]


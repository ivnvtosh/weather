//
//  Response.swift
//  YandexWeather
//
//  Created by Anton Ivanov on 20.09.2022.
//

import Foundation

// MARK: - YWResponse
public struct YWResponse: Codable {
	public let now: Int?
	public let nowDt: String?
	public let info: Info?
	public let geoObject: GeoObject?
	public let yesterday: Yesterday?
	public let fact: Fact?
	public let forecasts: Forecasts?

	enum CodingKeys: String, CodingKey {
		case now
		case nowDt = "now_dt"
		case info
		case geoObject = "geo_object"
		case yesterday
		case fact
		case forecasts
	}
}


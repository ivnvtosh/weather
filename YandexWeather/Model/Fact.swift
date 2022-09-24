//
//  Fact.swift
//  Yandex Weather
//
//  Created by Anton Ivanov on 14.09.2022.
//

import Foundation

// MARK: - Fact
public struct Fact: Codable {
	public let obsTime: Int?
	public let uptime: Int?
	public let temperature: Int?
	public let feelsLike: Int?
	public let icon: String?
	public let condition: Condition?
	public let cloudness: Double?
	public let precType: Int?
	public let precProb: Int?
	public let precStrength: Double?
	public let isThunder: Bool?
	public let windSpeed: Double?
	public let windDirection: WindDirection?
	public let pressureMm: Int?
	public let pressurePa: Int?
	public let humidity: Int?
	public let daytime: Daytime?
	public let polar: Bool?
	public let season: Season?
	public let source: String?
	public let accumPrec: AccumPrec?
	public let soilMoisture: Double?
	public let soilTemperature: Int?
	public let uvIndex: Int?
	public let windGust: Double?

	enum CodingKeys: String, CodingKey {
		case obsTime = "obs_time"
		case uptime
		case temperature = "temp"
		case feelsLike = "feels_like"
		case icon
		case condition
		case cloudness
		case precType = "prec_type"
		case precProb = "prec_prob"
		case precStrength = "prec_strength"
		case isThunder = "is_thunder"
		case windSpeed = "wind_speed"
		case windDirection = "wind_dir"
		case pressureMm = "pressure_mm"
		case pressurePa = "pressure_pa"
		case humidity
		case daytime
		case polar
		case season
		case source
		case accumPrec = "accum_prec"
		case soilMoisture = "soil_moisture"
		case soilTemperature = "soil_temp"
		case uvIndex = "uv_index"
		case windGust = "wind_gust"
	}
}


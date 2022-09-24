//
//  Day.swift
//  Weather
//
//  Created by Anton Ivanov on 24.09.2022.
//

import Foundation

// MARK: - Day
public struct Day: Codable {
	public let source: String?
	public let temperatureMin: Int?
	public let temperatureAvg: Int?
	public let temperatureMax: Int?
	public let windSpeed: Double?
	public let windGust: Double?
	public let windDirection: WindDirection?
	public let pressureMm: Int?
	public let pressurePa: Int?
	public let humidity: Int?
	public let soilTemperature: Int?
	public let soilMoisture: Double?
	public let precMm: Double?
	public let precProb: Int?
	public let precPeriod: Int?
	public let cloudness: Double?
	public let precType: Int?
	public let precStrength: Double?
	public let icon: String?
	public let condition: Condition?
	public let uvIndex: Int?
	public let feelsLike: Int?
	public let daytime: Daytime?
	public let polar: Bool?

	enum CodingKeys: String, CodingKey {
		case source = "_source"
		case temperatureMin = "temp_min"
		case temperatureAvg = "temp_avg"
		case temperatureMax = "temp_max"
		case windSpeed = "wind_speed"
		case windGust = "wind_gust"
		case windDirection = "wind_dir"
		case pressureMm = "pressure_mm"
		case pressurePa = "pressure_pa"
		case humidity
		case soilTemperature = "soil_temp"
		case soilMoisture = "soil_moisture"
		case precMm = "prec_mm"
		case precProb = "prec_prob"
		case precPeriod = "prec_period"
		case cloudness
		case precType = "prec_type"
		case precStrength = "prec_strength"
		case icon
		case condition
		case uvIndex = "uv_index"
		case feelsLike = "feels_like"
		case daytime
		case polar
	}
}


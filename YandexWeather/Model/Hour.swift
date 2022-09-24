//
//  Hour.swift
//  Weather
//
//  Created by Anton Ivanov on 24.09.2022.
//

import Foundation

// MARK: - Hour
public struct Hour: Codable {
	public let hour: String?
	public let hourTs: Int?
	public let temperature: Int?
	public let feelsLike: Int?
	public let icon: String?
	public let condition: Condition?
	public let cloudness: Double?
	public let precType: Int?
	public let precStrength: Double?
	public let isThunder: Bool?
	public let windDirection: WindDirection?
	public let windSpeed: Double?
	public let windGust: Double?
	public let pressureMm: Int?
	public let pressurePa: Int?
	public let humidity: Int?
	public let uvIndex: Int?
	public let soilTemperature: Int?
	public let soilMoisture: Double?
	public let precMm: Double?
	public let precPeriod: Int?
	public let precProb: Int?

	enum CodingKeys: String, CodingKey {
		case hour
		case hourTs = "hour_ts"
		case temperature = "temp"
		case feelsLike = "feels_like"
		case icon
		case condition
		case cloudness
		case precType = "prec_type"
		case precStrength = "prec_strength"
		case isThunder = "is_thunder"
		case windDirection = "wind_dir"
		case windSpeed = "wind_speed"
		case windGust = "wind_gust"
		case pressureMm = "pressure_mm"
		case pressurePa = "pressure_pa"
		case humidity
		case uvIndex = "uv_index"
		case soilTemperature = "soil_temp"
		case soilMoisture = "soil_moisture"
		case precMm = "prec_mm"
		case precPeriod = "prec_period"
		case precProb = "prec_prob"
	}
}

// MARK: - Hours
public typealias Hours = [Hour]


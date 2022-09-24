//
//  YandexWeatherQuery.swift
//  YandexWeather
//
//  Created by Anton Ivanov on 20.09.2022.
//

import Foundation

// MARK: - YWRequest
public class YWRequest {

	public let latitude: Double
	public let longitude: Double
	public var language: Language?
	public var limit: Int?
	public var hours: Int?
	public var extra: Bool?

	public init(_ latitude: Double, _ longitude: Double) {
		self.latitude = latitude
		self.longitude = longitude
	}

	public enum Language: String {
		case russia = "ru_RU"
		case ukraine = "ru_UA"
		case ukrainianForUkraine = "uk_UA"
		case belarus = "be_BY"
		case kazakhstan = "kk_KZ"
		case turkey = "tr_TR"
		case english = "en_US"
	}


}


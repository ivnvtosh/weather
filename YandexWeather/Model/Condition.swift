//
//  Condition.swift
//  YandexWeather
//
//  Created by Anton Ivanov on 20.09.2022.
//

import Foundation

// MARK: - Condition
public enum Condition: String, Codable {
	case clear
	case partlyCloudy = "partly-cloudy"
	case cloudy
	case overcast
	case drizzle
	case lightRain = "light-rain"
	case rain
	case moderateRain = "moderate-rain"
	case heavyRain = "heavy-rain"
	case continuousHeavyRain = "continuous-heavy-rain"
	case showers
	case sleet = "wet-snow"
	case lightSnow = "light-snow"
	case snow
	case snowfall = "snow-showers"
	case hail
	case thunderstorm
	case thunderstormWithRain = "thunderstorm-with-rain"
	case thunderstormAndHail = "thunderstorm-with-hail"
}


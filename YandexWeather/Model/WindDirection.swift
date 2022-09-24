//
//  WindDirection.swift
//  YandexWeather
//
//  Created by Anton Ivanov on 20.09.2022.
//

import Foundation

// MARK: - WindDirection
public enum WindDirection: String, Codable {
	case northwest = "nw"
	case north = "n"
	case northeast = "ne"
	case east = "e"
	case southeast = "se"
	case south = "s"
	case southwest = "sw"
	case west = "w"
	case calm = "c"
}


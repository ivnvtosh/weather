//
//  Parts.swift
//  Weather
//
//  Created by Anton Ivanov on 24.09.2022.
//

import Foundation

// MARK: - Parts
public struct Parts: Codable {
	public let dayShort: Day?
	public let evening: Day?
	public let night: Day?
	public let morning: Day?
	public let day: Day?
	public let nightShort: Day?

	enum CodingKeys: String, CodingKey {
		case dayShort = "day_short"
		case evening
		case night
		case morning
		case day
		case nightShort = "night_short"
	}
}


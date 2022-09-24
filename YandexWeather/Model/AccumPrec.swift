//
//  AccumPrec.swift
//  Weather
//
//  Created by Anton Ivanov on 24.09.2022.
//

import Foundation

// MARK: - AccumPrec
public struct AccumPrec: Codable {
	public let one: Double?
	public let two: Double?
	public let seven: Double?

	enum CodingKeys: String, CodingKey {
		case one = "1"
		case two = "3"
		case seven = "7"
	}
}


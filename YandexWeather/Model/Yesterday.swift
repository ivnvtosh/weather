//
//  Yesterday.swift
//  Weather
//
//  Created by Anton Ivanov on 24.09.2022.
//

import Foundation

// MARK: - Yesterday
public struct Yesterday: Codable {
	public let temperature: Int?

	enum CodingKeys: String, CodingKey {
		case temperature = "temp"
	}
}


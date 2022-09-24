//
//  Tzinfo.swift
//  Weather
//
//  Created by Anton Ivanov on 24.09.2022.
//

import Foundation

// MARK: - Tzinfo
public struct Tzinfo: Codable {
	public let name: String?
	public let abbr: String?
	public let dst: Bool?
	public let offset: Int?
}


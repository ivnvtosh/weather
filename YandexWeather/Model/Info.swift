//
//  Info.swift
//  Yandex Weather
//
//  Created by Anton Ivanov on 14.09.2022.
//

import Foundation

// MARK: - Info
public struct Info: Codable {
	public let n: Bool?
	public let geoid: Int?
	public let url: String?
	public let latitude: Double?
	public let longitude: Double?
	public let tzinfo: Tzinfo?
	public let defPressureMm : Int?
	public let defPressurePa: Int?
	public let slug: String?
	public let zoom: Int?
	public let nr: Bool?
	public let ns: Bool?
	public let nsr: Bool?
	public let p: Bool?
	public let f: Bool?
	public let h: Bool?

	enum CodingKeys: String, CodingKey {
		case n
		case geoid
		case url
		case latitude = "lat"
		case longitude = "lon"
		case tzinfo
		case defPressureMm = "def_pressure_mm"
		case defPressurePa = "def_pressure_pa"
		case slug
		case zoom
		case nr
		case ns
		case nsr
		case p
		case f
		case h = "_h"
	}
}


//
//  GeoObject.swift
//  Weather
//
//  Created by Anton Ivanov on 24.09.2022.
//

import Foundation

// MARK: - GeoObject
public struct GeoObject: Codable {
	public let district: Country?
	public let locality: Country?
	public let province: Country?
	public let country: Country?
}


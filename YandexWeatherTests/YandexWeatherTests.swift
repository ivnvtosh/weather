//
//  YandexWeatherTests.swift
//  YandexWeatherTests
//
//  Created by Anton Ivanov on 23.09.2022.
//

import XCTest
@testable import Weather

final class YandexWeatherTests: XCTestCase {

	var weatherService: WeatherService!

    override func setUpWithError() throws {
		try super.setUpWithError()

		guard let key = Storage.key else {
			throw XCTSkip("Enter key from: https://developer.tech.yandex.ru/services/18")
		}

		self.weatherService = YWService(key: key)
    }

    override func tearDownWithError() throws {
		self.weatherService = nil

		try super.tearDownWithError()
    }


	func testDecoder() throws {
		let promise = expectation(description: "Timeout")

		let request = YWRequest(55.75396, 37.620393)
		request.extra = true

		self.weatherService.weather(with: request) { response, error in
			promise.fulfill()

			if let error = error {
				XCTFail("Error: \(error)")
				return
			}

			guard let response = response else {
				XCTFail("Error")
				return
			}

			if response.now == nil {
				XCTFail("Error")
			}
		}

		waitForExpectations(timeout: 10)
	}


}


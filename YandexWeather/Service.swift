//
//  Service.swift
//  Yandex Weather
//
//  Created by Anton Ivanov on 14.09.2022.
//

import UIKit

// MARK: - WeatherService
public protocol WeatherService {
	func weather(with items: YWRequest, completion: @escaping (YWResponse?, Error?) -> Void)
}

// MARK: - YWService
public class YWService: WeatherService {

	private let base = "https://api.weather.yandex.ru"
	private let path = "/v2/forecast"
	private let method = "GET"
	private let header: [String : String]

	public init(key: String) {
		self.header = ["X-Yandex-API-Key" : key]
	}

	private enum YWError: Error {
		case invalidBaseOrPath
		case cantOpenURL
		case invalidURL
		case noData
		case failedToDecode(String)
	}

	private func weatherTask<T: Decodable>(with request: URLRequest, completion: @escaping (T?, Error?) -> Void) {
		URLSession.shared.dataTask(with: request) { data, response, error in
			if let error = error {
				completion(nil, error)
			}

			guard let data = data else {
				completion(nil, YWError.noData)
				return
			}

			guard let object = try? JSONDecoder().decode(T.self, from: data) else {
				completion(nil, YWError.failedToDecode(String(data: data, encoding: .utf8) ?? "Unknown encoding"))
				return
			}

			completion(object, nil)
		}.resume()
	}

	private func getQueryItems(_ items: YWRequest) -> [URLQueryItem] {
		var queryItems = [URLQueryItem]()

		queryItems.append(URLQueryItem(name: "lat", value: String(items.latitude)))
		queryItems.append(URLQueryItem(name: "lon", value: String(items.longitude)))
		if let language = items.language {
			queryItems.append(URLQueryItem(name: "lang", value: String(language.rawValue)))
		}
		if let limit = items.limit {
			queryItems.append(URLQueryItem(name: "limit", value: String(limit)))
		}
		if let hours = items.hours {
			queryItems.append(URLQueryItem(name: "hours", value: String(hours)))
		}
		if let extra = items.extra {
			queryItems.append(URLQueryItem(name: "extra", value: String(extra)))
		}

		return queryItems
	}

	public func weather(with items: YWRequest, completion: @escaping (YWResponse?, Error?) -> Void) {
		guard let urlComponents = NSURLComponents(string: base + path) else {
			completion(nil, YWError.invalidBaseOrPath)
			return
		}

		urlComponents.queryItems = getQueryItems(items)

		guard let url = urlComponents.url else {
			completion(nil, YWError.invalidURL)
			return
		}

		guard UIApplication.shared.canOpenURL(url) else {
			completion(nil, YWError.cantOpenURL)
			return
		}

		var request = URLRequest(url: url)
		request.httpMethod = self.method
		request.allHTTPHeaderFields = self.header

		weatherTask(with: request, completion: completion)
	}


}


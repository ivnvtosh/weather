//
//  Storage.swift
//  Weather
//
//  Created by Anton Ivanov on 24.09.2022.
//

import Foundation

final class Storage {

	static var key: String? {
		get {
			return UserDefaults.standard.string(forKey: "key")
		}

		set {
			if let key = newValue {
				UserDefaults.standard.set(key, forKey: "key")
			} else {
				UserDefaults.standard.removeObject(forKey: "key")
			}
		}
	}


}


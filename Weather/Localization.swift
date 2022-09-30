//
//  Localization.swift
//  Weather
//
//  Created by Anton Ivanov on 30.09.2022.
//

import Foundation

extension String {
	public func localized() -> String {
		NSLocalizedString(self, comment: self)
	}
}


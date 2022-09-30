//
//  KeyCell.swift
//  Weather
//
//  Created by Anton Ivanov on 29.09.2022.
//

import UIKit

class KeyCollectionViewCell: CollectionViewCell {

	class override var identifier: String {
		return "KeyCollectionViewCell"
	}

	public weak var delegate: ViewControllerDelegate?

	@objc
	private func myTargetFunction(_ sender: UITextField) {
		guard let key = sender.text else { return }
		self.delegate?.update(key: key)
	}

	private lazy var textField: UITextField = {
		let textField = UITextField(
			frame: CGRect(
				x: 15,
				y: 45,
				width: self.contentView.frame.width - 30,
				height: 30
			)
		)

		textField.placeholder = "Enter a key".localized()
		textField.adjustsFontSizeToFitWidth = true
		textField.minimumFontSize = 10
		textField.delegate = self
		textField.addTarget(
			self,
			action: #selector(myTargetFunction(_:)),
			for: .editingDidEndOnExit
		)

		return textField
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.contentView.addSubview(self.textField)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func layoutSubviews() {
		super.layoutSubviews()

		self.title.text = "KEY".localized()
		self.imageView.image = UIImage(systemName: "key.fill")
	}

	override func prepareForReuse() {
		super.prepareForReuse()

	}


}


extension KeyCollectionViewCell: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		guard let text = textField.text else { return false }
		return  text.count == 36
	}

	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		guard let text = textField.text else { return true }
		if text.count + string.count <= 36 { return true }
		guard let character = string.last else { return true }
		if character == "\n" { return true }
		return false
	}
}


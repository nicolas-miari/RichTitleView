//
//  RichTitleView.swift
//  RichTitleView
//
//  Created by Nicolás Miari on 2017/03/31.
//  Copyright © 2017 nicolasmiari. All rights reserved.
//

import UIKit

class RichTitleView: UIView {

    ///
    private var iconImageView: UIImageView!

    ///
    private var titleLabel: UILabel!

    var title: String? {
        set (newvalue) {
            titleLabel?.text = newvalue
            titleLabel?.sizeToFit()
            self.sizeToFit()
        }
        get {
            return titleLabel.text
        }
    }

    override func sizeToFit() {
        let oldCenter = self.center

        super.sizeToFit()

        self.center = oldCenter
    }

    /*
    private var temporaryCenter: CGPoint = .zero
    override var frame: CGRect {
        willSet {
            temporaryCenter = self.center
        }
        didSet {
            print("Did Set Frame!: \(frame)")
            self.center = temporaryCenter
        }
    }*/

    ///
    init(title: String, image: UIImage?) {
        super.init(frame: CGRect.zero)

        //self.backgroundColor = UIColor.blue

        iconImageView = UIImageView(image: image)

        self.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false

        iconImageView.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0).isActive = true

        titleLabel = UILabel(frame: CGRect.zero)

        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        //titleLabel.backgroundColor = UIColor.yellow
        titleLabel.text          = title
        titleLabel.font          = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .left
        titleLabel.sizeToFit()

        titleLabel.leftAnchor.constraint(equalTo: iconImageView!.rightAnchor, constant: 8.0).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0.0).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

        self.layoutIfNeeded()
        self.sizeToFit()
        self.translatesAutoresizingMaskIntoConstraints = true
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let iconFrame  = (iconImageView?.frame ?? CGRect.zero)

        titleLabel?.sizeToFit()
        let labelFrame = (titleLabel?.frame ?? CGRect.zero)

        let width  = iconFrame.width + 8.0 + labelFrame.width
        let height = iconFrame.height

        return CGSize(width: width, height: height)
    }

    /// Do not use; Only here to appease the compiler.
    /// Always use `init(frame:)`
    required init?(coder aDecoder: NSCoder) {
        self.iconImageView = UIImageView(image: nil)
        self.titleLabel = UILabel(frame: CGRect.zero)

        super.init(coder: aDecoder)
        assert(false, "RichTitleView does not support initialization from Storyboard; instantiate programmatically using init(frame:).")
    }
}

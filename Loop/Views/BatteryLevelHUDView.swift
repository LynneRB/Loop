//
//  BatteryLevelHUDView.swift
//  Naterade
//
//  Created by Nathan Racklyeft on 5/2/16.
//  Copyright © 2016 Nathan Racklyeft. All rights reserved.
//

import UIKit


final class BatteryLevelHUDView: HUDView {

    @IBOutlet private var levelMaskView: LevelMaskView!

    override func awakeFromNib() {
        super.awakeFromNib()

        tintColor = .unknownColor
    }

    private lazy var numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent

        return formatter
    }()


    var batteryLevel: Double? {
        didSet {
            if let value = batteryLevel, let level = numberFormatter.string(from: NSNumber(value: value)) {
                caption.text = level
            } else {
                caption.text = nil
            }

            switch batteryLevel {
            case .none:
                tintColor = .unknownColor
            case let x? where x > 0.25:
                tintColor = .secondaryLabelColor
            case let x? where x > 0.10:
                tintColor = .agingColor
            default:
                tintColor = .staleColor
            }

            levelMaskView.value = batteryLevel ?? 1.0
        }
    }

}

//
//  CGUtils.swift
//  Pentago
//
//  Created by Fredrik on 7/9/18.
//  Copyright © 2018 Fredrik. All rights reserved.
//

import Foundation

extension CGRect {
    var center: CGPoint {
        return CGPoint(
            x: minX + (width / 2),
            y: minY + (height / 2)
        )
    }
}

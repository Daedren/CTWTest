//
//  BaseViewCell.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation

public protocol BaseViewCell {
    static var reuseIdentifier: String { get }
    static var identifier: String { get }
}

public extension BaseViewCell {
    static var reuseIdentifier: String { return String(describing: self) }
    static var identifier: String { return String(describing: self) }
}

//
//  Translator.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/16/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

protocol Translator: class {
    associatedtype Input
    associatedtype Output

    static func translate(_ entity: Input) -> Output
}

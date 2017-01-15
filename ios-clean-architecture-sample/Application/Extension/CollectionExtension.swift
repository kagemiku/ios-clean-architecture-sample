//
//  CollectionExtension.swift
//  ios-clean-architecture-sample
//
//  Created by KAGE on 1/15/17.
//  Copyright © 2017 KAGE. All rights reserved.
//

import Foundation

extension Collection where Indices.Iterator.Element == Index {
    subscript(safe index: Index) -> Generator.Element? {
        return self.indices.contains(index) ? self[index] : nil
    }
}

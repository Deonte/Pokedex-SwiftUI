//
//  Strings+ext.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import Foundation

extension String {
    func removeN() -> String {
        return self.replacingOccurrences(of: "\n", with: " ")
    }
}

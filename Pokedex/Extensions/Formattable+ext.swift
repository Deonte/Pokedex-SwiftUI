//
//  Formattable+ext.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import Foundation

protocol Formattable {
    func format(pattern: String) -> String
}

extension Formattable where Self: CVarArg {
    func format(pattern: String) -> String {
        return String(format: pattern, arguments: [self])
    }
}

extension Int: Formattable { }
extension Double: Formattable { }
extension Float: Formattable { }

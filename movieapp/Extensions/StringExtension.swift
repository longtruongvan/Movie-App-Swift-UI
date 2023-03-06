//
//  StringExtension.swift
//  movieapp
//
//  Created by LongTV on 06/03/2023.
//

import SwiftUI

extension String {
    func add(value: String) -> AttributedString {
        var currentData: String = self
        var collapseText = AttributedString(currentData)
        var more = AttributedString("read more")


        var strings = AttributedString("")

        more.foregroundColor = Color(red: 0.631, green: 0.953, blue: 0.996)
        strings.append(collapseText)
        strings.append(more)
        return strings;
    }
}

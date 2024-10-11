//
//  Continent.swift
//  FindFlagApp
//
//  Created by Aldongarov Nuraskhan on 08.10.2024.
//

import Foundation
import SwiftUI

struct Continent {
    let name: String
    var countries: [Country]

    mutating func addCountry(_ country: Country) {
        countries.append(country)
    }
}

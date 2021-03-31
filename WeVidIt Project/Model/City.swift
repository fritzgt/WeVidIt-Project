//
//  CityModel.swift
//  WeVidIt Project
//
//  Created by FGT MAC on 3/31/21.
//

import Foundation

enum Cities: String {
    case Cannes, Venice, Berlin, Other
}

struct City: Hashable {
    var cityName: Cities
    var isSelected: Bool = false
    
    mutating func toggle() {
            self.isSelected = !isSelected
    }
}

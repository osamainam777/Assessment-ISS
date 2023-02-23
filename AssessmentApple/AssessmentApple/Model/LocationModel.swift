//
//  LocationModel.swift
//  AssessmentApple
//
//  Created by Usama Inaam Rasheed on 2/22/23.
//

import Foundation

struct LocationModel: Codable {
    let message: String?
    let timestamp: Int?
    let iss_position: Position?
}

struct Position: Codable {
    var latitude: String? = ""
    var longitude: String? = ""
}

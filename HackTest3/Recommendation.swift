//
//  Recommendation.swift
//  HackTest3
//
//  Created by Justin Yoo on 1/30/22.
//

import Foundation

struct Recommendation: Codable {
    var price:Float?
    var origin:Place?
    var destination:Place?
    var date:String?
}

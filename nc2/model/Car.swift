//
//  Car.swift
//  nc2
//
//  Created by Apanda Saragih on 24/05/23.
//

import Foundation

struct Car: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let description: String
}

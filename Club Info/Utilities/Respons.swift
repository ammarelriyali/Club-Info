//
//  Respons.swift
//  Club Info
//
//  Created by ammar on 01/06/2023.
//

import Foundation
struct Respons<T:Decodable>: Decodable{
    var success : Int?
    var result : [T]?
}

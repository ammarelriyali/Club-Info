//
//  ServiceProtocol.swift
//  Club Info
//
//  Created by ammar on 01/06/2023.
//

import Foundation
protocol ServiceProtocol{
    func fetchData<T: Decodable>(for sport : SportType, queryItems: [URLQueryItem], completionHandler: @escaping (Result<[T]?, Error>) -> Void)

}

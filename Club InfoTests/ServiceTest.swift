//
//  ServiceTest.swift
//  Club InfoTests
//
//  Created by ammar on 01/06/2023.
//

import XCTest
@testable import Club_Info

final class ServiceTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testLoadDataFromURL(){
        let queryItems = [URLQueryItem(name: "met", value: "Leagues")]
        let exp = expectation(description: "waiting for the API")
        Service.instans.fetchData(for: SportType.Football, queryItems: queryItems){
            (result: Result<[League]?, Error>) in
            switch result{
            case .success(let data):
                XCTAssertGreaterThan(data!.count,0,"arr is empty ")
                exp.fulfill()
            case .failure(let error):
                print(error.localizedDescription)
                XCTFail()
                exp.fulfill()
                
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}

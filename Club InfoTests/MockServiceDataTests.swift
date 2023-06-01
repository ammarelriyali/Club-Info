//
//  MockServiceDataTests.swift

//  Club InfoTests
//
//  Created by ammar on 01/06/2023.
//

import XCTest

@testable import Club_Info

final class MockServiceDataTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testLeaguesShouldPass(){
        let queryItems = [URLQueryItem(name: "met", value: "Leagues")]
        let exp = expectation(description: "waiting for the API")
        let obj = MockLeaguesData(shouldReturnError: false)
        obj.fetchData(for: SportType.Football, queryItems: queryItems){
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

    func testLeaguesShouldFail(){
        let queryItems = [URLQueryItem(name: "met", value: "Leagues")]
        let exp = expectation(description: "waiting for the API")
        let obj = MockLeaguesData(shouldReturnError: true)
        obj.fetchData(for: SportType.Football, queryItems: queryItems){
            (result: Result<[League]?, Error>) in
            switch result{
            case .success(let data):
                XCTFail()
                exp.fulfill()
            case .failure(let error):
                XCTAssertTrue(true)
                exp.fulfill()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    

    func testLiveMatchShouldPass(){
        let queryItems = [URLQueryItem(name: "met", value: "Leagues")]
        let exp = expectation(description: "waiting for the API")
        let obj = MockLiveMatchData(shouldReturnError: false)
        obj.fetchData(for: SportType.Football, queryItems: queryItems){
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

    func testLiveMatchShouldFail(){
        let queryItems = [URLQueryItem(name: "met", value: "Leagues")]
        let exp = expectation(description: "waiting for the API")
        let obj = MockLiveMatchData(shouldReturnError: true)
        obj.fetchData(for: SportType.Football, queryItems: queryItems){
            (result: Result<[League]?, Error>) in
            switch result{
            case .success(let data):
                XCTFail()
                exp.fulfill()
            case .failure(let error):
                XCTAssertTrue(true)
                exp.fulfill()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    

    func testCommingEventShouldPass(){
        let queryItems = [URLQueryItem(name: "met", value: "Leagues")]
        let exp = expectation(description: "waiting for the API")
        let obj = MockComingEventData(shouldReturnError: false)
        obj.fetchData(for: SportType.Football, queryItems: queryItems){
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

    func testCommingEventShouldFail(){
        let queryItems = [URLQueryItem(name: "met", value: "Leagues")]
        let exp = expectation(description: "waiting for the API")
        let obj = MockComingEventData(shouldReturnError: true)
        obj.fetchData(for: SportType.Football, queryItems: queryItems){
            (result: Result<[League]?, Error>) in
            switch result{
            case .success(let data):
                XCTFail()
                exp.fulfill()
            case .failure(let error):
                XCTAssertTrue(true)
                exp.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    

    func testTeamsShouldPass(){
        let queryItems = [URLQueryItem(name: "met", value: "Leagues")]
        let exp = expectation(description: "waiting for the API")
        let obj = MockTeamsData(shouldReturnError: false)
        obj.fetchData(for: SportType.Football, queryItems: queryItems){
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

    func testTeamsShouldFail(){
        let queryItems = [URLQueryItem(name: "met", value: "Leagues")]
        let exp = expectation(description: "waiting for the API")
        let obj = MockTeamsData(shouldReturnError: true)
        obj.fetchData(for: SportType.Football, queryItems: queryItems){
            (result: Result<[League]?, Error>) in
            switch result{
            case .success(let data):
                XCTFail()
                exp.fulfill()
            case .failure(let error):
                XCTAssertTrue(true)
                exp.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    
    
}

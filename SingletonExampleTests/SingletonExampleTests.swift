//
//  SingletonExampleTests.swift
//  SingletonExampleTests
//
//  Created by Jess Lê on 6/3/21.
//

import XCTest
@testable import SingletonExample

/// Tests`SingletonConsumer`
class SingletonExampleTests: XCTestCase {
    

    func test_doSomethingCoolWithNonMatchingAnimalValues_setsAnimal_nil() {
        let singletonConsumer = SingletonConsumer(singleton: FakeSingleton())
        singletonConsumer.doSomethingCool(with: "spiders")
        let actual = singletonConsumer.animal
        XCTAssertNil(actual)
    }
    
    func test_doSomethingCoolWithCats_setsAnimalToCats() {
        let singletonConsumer = SingletonConsumer(singleton: FakeSingleton())
        singletonConsumer.doSomethingCool(with: "cats")
        let actual = singletonConsumer.animal
        let expected = Animal.cats.rawValue
        XCTAssertEqual(actual, expected)
    }
}


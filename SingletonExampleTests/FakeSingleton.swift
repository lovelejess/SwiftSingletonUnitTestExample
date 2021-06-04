//
//  FakeSingleton.swift
//  SingletonExampleTests
//
//  Created by Jess Lê on 6/3/21.
//

import Foundation
@testable import SingletonExample

class FakeSingleton: SingletonProtocol {
    func run(with parameter: String) -> String {
        return parameter
    }

}

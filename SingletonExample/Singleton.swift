//
//  Singleton.swift
//  SingletonExample
//
//  Created by Jess Lê on 6/3/21.
//

import Foundation
/// This is an example of a singleton that's a black box.
/// Pretend it comes from a third party library and we have no insight into what it does
class Singleton {
    class func run(with parameter: String) -> String {
        let run = "Singleton: Does something epic with: \(parameter)"
        print(run)
        return run
    }
}

/// Create a protocol for all the public apis that we use for that singleton
protocol SingletonProtocol {
    func run(with parameter: String) -> String
}

/// A Wrapper around the Singleton
/// Need to create a wrapper around this singleton so that we can implement a protcol, which will be used to create our fake
/// This wrapper is a pass through and implements the protocol
class SingletonWrapper: SingletonProtocol {
    func run(with parameter: String) -> String {
        return Singleton.run(with: parameter)
    }
}

/// A sample class that has a dependency on a singleton
/// We will dependency inject the singleton and its type will be a protocol
/// This is the class that we will unit test
class SingletonConsumer {

    private var singleton: SingletonProtocol!

    var animal: String?
    init(singleton: SingletonProtocol=SingletonWrapper()) {
        self.singleton = singleton
    }

    func doSomethingCool(with parameter: String) {
        let value = singleton.run(with: parameter)
        if value.contains(Animal.cats.rawValue) {
            animal = Animal.cats.rawValue
        } else if value.contains(Animal.dogs.rawValue) {
            animal = Animal.dogs.rawValue
        } else if value.contains(Animal.elephants.rawValue) {
            animal = Animal.elephants.rawValue
        }
    }
}

enum Animal: String {
    case cats
    case dogs
    case elephants
}

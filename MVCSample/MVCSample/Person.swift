//
//  Person.swift
//  MVCSample
//
//  Created by Guilherme Ruiz on 22/12/16.
//  Copyright © 2016 Guilherme Ruiz. All rights reserved.
//

import Foundation

class Person {
    private var _firstName: String!
    private var _lastName: String!
    
    var firstName: String {
        get {
            return _firstName
        } set {
            if !newValue.isEmpty {
                _firstName = newValue
            }
        }
    }
    
    var lastName: String {
        get {
            return _lastName
        } set {
            if !newValue.isEmpty {
                _lastName = newValue
            }
        }
    }
    
    var fullName: String{
        return "\(_firstName!) \(_lastName!)"
    }
    
    init(firstName: String, lastName: String) {
        self._firstName = firstName
        self._lastName = lastName
    }
    
}

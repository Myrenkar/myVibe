//
//  APIQueryParameter.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

public enum APIQueryParameter: Decodable {
    case string(String)
    case bool(Bool)
    case int(Int)
    case double(Double)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let string = try? container.decode(String.self) {
            self = .string(string)
        } else if let bool = try? container.decode(Bool.self) {
            self = .bool(bool)
        } else if let int = try? container.decode(Int.self) {
            self = .int(int)
        } else if let double = try? container.decode(Double.self) {
            self = .double(double)
        } else {
            throw UntypedError.init(reason: "Decoding error")
        }
    }
}

extension APIQueryParameter: Equatable {
    public static func ==(lhs: APIQueryParameter, rhs: APIQueryParameter) -> Bool {
        switch (lhs, rhs) {
            case (.int(let lhs), .int(let rhs)):
                return lhs == rhs
            case (.double(let lhs), .double(let rhs)):
                return lhs == rhs
            case (.bool(let lhs), .bool(let rhs)):
                return lhs == rhs
            case (.string(let lhs), .string(let rhs)):
                return lhs == rhs
            default:
                return false
        }
    }
}

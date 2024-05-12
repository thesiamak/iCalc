//
//  File.swift
//  Simple Calc
//
//  Created by Siamak Mahmoudi on 12/5/24.
//

import Foundation

class Math {
    
    public func sum(first: Double, to: Double) -> Double {
        return first + to
    }
    
    func minus(first: Double, to: Double)->Double {
        return first - to
    }
    
    func div(origin: Double, to: Double)-> Double {
        return origin / to
    }
    
    func mult(origin: Double, to: Double)-> Double {
        return origin * to
    }
    
}

enum Operation {
    case Sum
    case Minus
    case div
    case Mult
    case Clear
}

extension Double {
    func toStringWithoutTrailingZeros() -> String {
            return String(format: "%g", self)
        }
}

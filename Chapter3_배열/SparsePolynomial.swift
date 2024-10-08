//
//  SparsePolynomial.swift
//  DataStructure
//
//  Created by 한지석 on 10/8/24.
//

import Foundation

struct Term {
  var coef: Double
  var exp: Int
}

class SparsePolynomial {

  var terms: [Term] = Array(repeating: Term(coef: 0, exp: 0), count: 8)
  var numTerms = 0
  var capacity = 8

  init() {

  }

  func newTerm(coef: Double, exp: Int) {
    guard coef != 0 else { return }

    if numTerms >= capacity {
      capacity = capacity > 0 ? capacity * 2 : 1
      var newTerms = Array(repeating: Term(coef: 0, exp: 0), count: capacity)

      for i in 0..<numTerms {
        newTerms[i] = terms[i]
      }

      terms = newTerms
    }

    terms[numTerms].coef = coef
    terms[numTerms].exp = exp
    numTerms += 1
  }

  func eval(_ x: Double) -> Double {
    return 0
  }

  static func add(poly: SparsePolynomial) -> SparsePolynomial {
    return SparsePolynomial()
  }

  func polyPrint() {
    for i in 0..<terms.count {
      if i != 0 {
        print(" + ", separator: "")
      }
      print(terms[i].coef, separator: "")

      if terms[i].exp != 0 {
        print("*x^\(terms[i].exp)", separator: "")
      }
    }
  }
}

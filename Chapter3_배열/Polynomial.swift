//
//  Polynomial.swift
//  DataStructure
//
//  Created by 한지석 on 10/7/24.
//

import Foundation

class Polynomial {
  var arr: [Double] = []

  init(arr: [Double]) {
    self.arr = arr
  }

  func newTerm(_ element: Double, _ index: Int) {
    while arr.count <= index {
      arr.append(0)
    }
    arr[index] = element
  }

  func eval(_ x: Int) {
    var count = arr[0]
    var expression = "\(arr[0]) "
    for i in 1..<arr.count {
      let element = pow(Double(x), Double(i)) * arr[i]
      count += element
      expression += "+ \(arr[i])*\(x)^\(i) "
    }
    expression += " = \(count)"
    print(expression)
  }

  func polyPrint() {
    var expression = "\(arr[0]) "
    for i in 1..<arr.count {
      expression += "+ \(arr[i])*x^\(i) "
    }
    print(expression, separator: "")
  }

  func add(_ poly: Polynomial) -> Polynomial {
    let maxDegree = max(self.arr.count, poly.arr.count)
    var newValues = [Double](repeating: 0, count: maxDegree)

    for i in 0..<maxDegree {
      let a = i < self.arr.count ? self.arr[i] : 0
      let b = i < poly.arr.count ? poly.arr[i] : 0
      newValues[i] = a + b
    }

    return Polynomial(arr: newValues)
  }

  func mult(_ poly: Polynomial) -> Polynomial {
    let newDegree = self.arr.count + poly.arr.count - 1
    var newValues = [Double](repeating: 0, count: newDegree)

    for i in 0..<self.arr.count {
      for j in 0..<poly.arr.count {
        newValues[i + j] += self.arr[i] * poly.arr[j]
        print(newValues)
      }
    }

    return Polynomial(arr: newValues)
  }
}

let p1 = Polynomial(arr: [])
p1.newTerm(1, 0)
p1.newTerm(1.5, 1)
p1.newTerm(2, 2)

p1.polyPrint()

p1.eval(0)
p1.eval(1)
p1.eval(2)

let p2 = Polynomial(arr: [])
p2.newTerm(1, 1)
p2.newTerm(3, 2)

let psum = p1.add(p2)
psum.polyPrint()

let pmul = p1.mult(p2)
pmul.polyPrint()

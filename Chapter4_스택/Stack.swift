//
//  Stack.swift
//  DataStructure
//
//  Created by 한지석 on 10/8/24.
//

import Foundation

/// LIFO
protocol Stack {
  associatedtype AnyType
  var top: Int { get }
  var capacity: Int { get }
  var stacks: [AnyType] { get }

  func sPush(_ element: AnyType)
  func sPrint()
  func sTop()
  func sPop()
}

class StackImplement<T>: Stack {
  typealias AnyType = T

  var top: Int = -1
  var capacity: Int = 0
  var stacks: [T] = []

  init() { }

  func sPush(_ element: T) {
    stacks.append(element)
    top += 1
  }

  func sPrint() {
    print(self.stacks)
  }

  func sTop() {
    guard top != -1 else {
      print("스택 beam")
      return
    }
    print(stacks[top])
  }

  func sPop() {
    stacks.removeLast()
    top -= 1
  }
}

let stackWithInt = StackImplement<Int>()
let stackWithString = StackImplement<String>()

stackWithInt.sPush(1)
stackWithInt.sPush(3)
stackWithInt.sPush(2)
stackWithInt.sPush(104)
stackWithInt.sPrint()

stackWithInt.sTop()
stackWithInt.sPop()
stackWithInt.sPrint()

stackWithString.sPush("아")
stackWithString.sPush("르")
stackWithString.sPush("티")
stackWithString.sPush("헨")
stackWithString.sPush("나")
stackWithString.sPrint()

stackWithString.sPop()
stackWithString.sTop()

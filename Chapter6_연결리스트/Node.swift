//
//  Node.swift
//  DataStructure
//
//  Created by 한지석 on 10/14/24.
//

import Foundation

class Node<T> {
  var data: T?
  var next: Node?

  init(data: T? = nil, next: Node? = nil) {
    self.data = data
    self.next = next
  }
}

var first = Node(data: 1)
var second = Node(data: 2)
var third = Node(data: 3)
var fourth = Node(data: 4)
var fifth = Node(data: 5)

first.next = second
second.next = third
third.next = fourth
fourth.next = fifth

func address(_ o: UnsafeRawPointer) -> String {
    let bit = Int(bitPattern: o)
    return String(format: "%p", bit)
}

print("\(address(&first)) - \(first.data)")
print("\(address(&second)) - \(second.data)")
print("\(address(&third)) - \(third.data)")
print("\(address(&fourth)) - \(fourth.data)")
print("\(address(&fifth)) - \(fifth.data)")

func recurPrint(current: inout Node<Int>) {
  print(current.data)
  guard var next = current.next else { return }
  recurPrint(current: &next)
}

func iterPrint() {
  var current: Node? = first
  for i in 0..<5 {
    print(current?.data)
    current = current?.next
  }
}

recurPrint(current: &first)
iterPrint()

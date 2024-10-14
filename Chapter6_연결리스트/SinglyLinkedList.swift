//
//  SinglyLinkedList.swift
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

class SinglyLinkedList<T> {

  var head: Node<T>?

  init(head: Node<T>? = nil) {
    self.head = head
  }

  func initNodes(_ datas: [T]) {
    for data in datas.reversed() {
      pushFront(data: data)
    }
  }

  /// Reverse
  /// Insert Back <- 특정 노드의 뒤에 넣어라
  /// Find

  func pushFront(data: T) {
    let node = Node(data: data)
    guard head != nil else {
      head = node
      return
    }
    node.next = head
    head = node
  }

  func pushBack(data: T) {
    let node = Node(data: data)
    guard head != nil else {
      head = node
      return
    }

    var last = head
    while let next = last?.next {
      last = next
    }
    last?.next = node
  }

  func reverse() {
    var current: Node<T>? = head
    var previous: Node<T>?

    while current != nil {
      var temp = previous
      previous = current
      current = current?.next
      previous?.next = temp
    }

    head = previous
  }

  func remove(at index: Int) {
    if head == nil { return }

    if index == 0 || head?.next == nil {
      head = head?.next
      return
    }

    var node = head

    for _ in 0..<index - 1 {
      if node?.next?.next == nil { break }
      node = node?.next
    }

    let removeNode = node?.next
    node?.next = node?.next?.next

    removeNode?.next = nil
    removeNode?.data = nil
  }

  func recurPrint(current: Node<T>?) {
    if let node = current {
      print("\(node.data), ", separator: "")
      recurPrint(current: node.next)
    }
  }
}


let linkedList = SinglyLinkedList<Int>()
linkedList.initNodes([1, 2, 3, 4, 5])
linkedList.pushFront(data: 0)

linkedList.pushBack(data: 6)

linkedList.recurPrint(current: linkedList.head)

linkedList.reverse()
linkedList.recurPrint(current: linkedList.head)

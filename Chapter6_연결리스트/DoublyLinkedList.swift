//
//  DoublyLinkedList.swift
//  DataStructure
//
//  Created by 한지석 on 10/15/24.
//

import Foundation

class Node<T> {
  var data: T?
  var left: Node<T>?
  var right: Node<T>?

  init(
    data: T? = nil,
    left: Node<T>? = nil,
    right: Node<T>? = nil
  ) {
    self.data = data
    self.left = left
    self.right = right
  }
}

class DoublyLinkedList<T: Equatable> {
  private var head: Node<T>?
  private var tail: Node<T>?

  func insertBack(_ data: T?) {
    if head == nil || tail == nil {
      let node = Node<T>(data: data)
      head = node
      tail = node
      return
    }

    let newNode = Node<T>(data: data)
    tail?.right = newNode
    newNode.left = tail
    tail = newNode
  }

  func insertFront(_ data: T?) {
    if head == nil || tail == nil {
      let node = Node<T>(data: data)
      head = node
      tail = node
      return
    }

    let newNode = Node<T>(data: data)
    head?.left = newNode
    newNode.right = head
  }

  func removeLast() {
    if head == nil || tail == nil {
      return
    }

    if head?.right == nil {
      head = nil
      tail = nil
      return
    }

    /// 마지막 요소의 왼쪽의 요소가 가리키는 오른쪽을
    /// 현재 마지막 요소의 오른쪽 요소와 이음
    /// left -> right = tail -> right
    /// 또 tail은 마지막 요소의 왼쪽으로 이동
    tail?.left?.right = tail?.right
    tail = tail?.left
  }

  func searchNode(_ data: T?) -> Node<T>? {
    if head == nil || tail == nil { return nil }

    var node = head

    while node?.right != nil {
      if node?.data == data { break }
      node = node?.right
    }

    return node
  }

  func searchNodeFromTail(_ data: T?) -> Node<T>? {
    if head == nil || tail == nil { return nil }

    var node = tail

    while node?.left != nil {
      if node?.data == data { break }
      node = node?.left
    }

    return node
  }
}

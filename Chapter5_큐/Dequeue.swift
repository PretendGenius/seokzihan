//
//  Dequeue.swift
//  DataStructure
//
//  Created by 한지석 on 10/10/24.
//

import Foundation

/// Double Ended Queue
protocol Deque {
  func pushFront(element: String)
  func pushBack(element: String)
  func popFront() -> String?
  func popBack() -> String?
}

class DequeImplement: Deque {
  private var array: [String?]
  private var front: Int
  private var rear: Int
  private var capacity: Int

  init(capacity: Int) {
    self.capacity = max(capacity, 1)
    self.array = Array(repeating: nil, count: self.capacity)
    self.front = 0
    self.rear = capacity - 1
  }

  var size: Int {
    (rear - front + capacity + 1) % capacity
  }

  var isEmpty: Bool {
    return size == 0
  }

  var isFull: Bool {
    return size == capacity - 1
  }

  func pushFront(element: String) {
    if isFull {
      return
    }

    front = (front - 1 + capacity) % capacity
    array[front] = element
  }

  func pushBack(element: String) {
    if isFull {
      return
    }
    rear = (rear + 1) % capacity
    array[rear] = element
  }

  func popFront() -> String? {
    guard !isEmpty else { return nil }
    let element = array[front]
    array[front] = nil
    front = (front + 1) % capacity
    return element
  }

  func popBack() -> String? {
    guard !isEmpty else { return nil }
    let element = array[rear]
    array[rear] = nil
    rear = (rear - 1 + capacity) % capacity
    return element
  }
}

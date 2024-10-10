//
//  RingBuffer.swift
//  DataStructure
//
//  Created by 한지석 on 10/10/24.
//

import Foundation

/// 원형 큐
/// 큐의 공간이 N개짜리 공간이라고 가정했을 때
/// 공간 이상의 데이터가 들어와야 하는 경우에 front, rear을 통해서 큐의 원칙을 지키게한다

// rear = (rear + 1) % capacity
// rear == front 일 경우, queue가 비어있다고 판단
// front + 1 위치에 데이터 삽입

class RingBuffer {
  private var capacity: Int
  private var front: Int = 0
  private var rear: Int = 0
  private var queue: [String]

  init(capacity: Int) {
    self.capacity = capacity
    self.queue = Array(repeating: "", count: capacity)
  }

  // rear == front 일 경우, queue가 비어있다고 판단
  func enqueue(element: String) {
    if isFull() {
      // queue의 크기를 늘리고 내용물을 복사하기
      print("rear - \(rear) , front - \(front)")
      resizeAndCopy()
    }
    queue[rear] = element
    print("Enqueue - \(queue[rear])")
    rear = (rear + 1) % capacity
  }

  func dequeue() {
    if front + 1 == rear {
      print("Queue is empty")
      return
    }
    let element = queue[front]
    queue[front] = ""
    front = (front + 1) % capacity
    print("Dequeue - \(element)")
  }

  private func resizeAndCopy() {
    let newCapacity = capacity * 2
    var newQueue = Array(repeating: "", count: newCapacity)

    var i = 0
    while !isEmpty() {
      newQueue[i] = queue[front]
      front = (front + 1) % capacity
      i += 1
    }

    front = 0
    rear = i
    capacity = newCapacity
    queue = newQueue

    print("Queue resized - \(capacity)")
  }

  private func isEmpty() -> Bool {
    return front == rear
  }

  private func isFull() -> Bool {
    return (rear + 1) % capacity == front
  }
}

let buffer = RingBuffer(capacity: 3)
buffer.enqueue(element: "1")
buffer.enqueue(element: "2")
buffer.enqueue(element: "5")
buffer.enqueue(element: "7")
buffer.enqueue(element: "9")
buffer.dequeue()
buffer.dequeue()
buffer.dequeue()

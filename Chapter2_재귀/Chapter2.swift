//
//  Chapter2.swift
//  DataStructure
//
//  Created by 한지석 on 10/1/24.
//

import Foundation

func func1() {
  func2()
  print("func 1")
}

func func2() {
  print("func 2")
}

func1()

/// 재귀 함수
func recurFunc(count: Int) {
  if (count == 0) {
    return
  }
  print(count)
  recurFunc(count: count - 1)
}

recurFunc(count: 5)

func defaultSum(arr: [Int]) -> Int {
  var sum = 0

  for i in 0..<arr.count {
    sum += arr[i]
  }

  return sum
}

func recurSum(arr: [Int], index: Int) -> Int {
  if arr.count == index {
    return 0
  }
  var count = arr[index]
  count += recurSum(arr: arr, index: index + 1)
  return count
}

func problemRecurSum(arr: [Int], index: Int) -> Int {
  if index < 0 {
    return 0
  } else {
    return problemRecurSum(
      arr: arr,
      index: index - 1
    ) + arr[index]
  }
}

let arr = [1, 2, 3, 4, 5]

//print(recurSum(arr: arr, index: 0))
//print(problemRecurSum(arr: arr, index: arr.count - 1))

/// 피보나치 수열

func fibonacci(n: Int) -> Int {
  if n == 0 {
    return 0
  } else if n == 1 {
    return 1
  } else {
    return fibonacci(n: n - 1) + fibonacci(n: n - 2)
  }
}

print(fibonacci(n: 8))

func recurBinarySearch(
  arr: [Int],
  left: Int,
  right: Int,
  element: Int
) -> Int {
  if left <= right {
    let mid = (left + right) / 2
    if element < arr[mid] {
      return recurBinarySearch(
        arr: arr,
        left: left,
        right: mid - 1,
        element: element
      )
    } else if element > arr[mid] {
      return recurBinarySearch(
        arr: arr,
        left: mid + 1,
        right: right,
        element: element
      )
    } else {
      print("Find")
      return mid;
    }
  }
  return -1;
}

let recurArr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
print("Log")
print(
  recurBinarySearch(
    arr: recurArr,
    left: 0,
    right: recurArr.count,
    element: 3
  )
)

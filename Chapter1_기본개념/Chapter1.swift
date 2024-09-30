//
//  Chapter1.swift
//  DataStructure
//
//  Created by 한지석 on 9/30/24.
//

import Foundation

/// Swap
var a = 2
var b = 3

print("\(a) \(b)")

// TODO
let temp = a
a = b
b = temp

print("\(a) \(b)")

// TODO
func mySwap(_ first: inout Int, _ second: inout Int) {
  let temp = first
  first = second
  second = temp
}

mySwap(&a, &b)
print("\(a) \(b)")

/// Sorting
var arr: [Int] = [3, 2]

print("\(arr[0]) \(arr[1])")
print("\(arr[0]) \(arr[1])")

// TODO : 오름차순
func swapFunction(sort: Bool) {
  for i in 0..<5 {
    for j in 0..<5 {
      var left = j
      var right = i
      var isSorted = left <= right
      if sort && !isSorted {
        let temp = left
        left = right
        right = temp
        isSorted.toggle()
      }
      print("\(left) \(right) \(isSorted)")
    }
  }
}

swapFunction(sort: false)
swapFunction(sort: true)

/// Selection Sort
func selectionSort1() {
  for k in 0..<3 {
    for i in 0..<3 {
      for j in 0..<3 {
        var arr = [i, j, k]
        let size = arr.count

        for e in 0..<size {
          print(arr[e], terminator: " ")
        }
        print("-> ", terminator: "")

        //TODO: 정렬 해보기
        for a in 0..<size {
          for b in a..<size {
            if arr[a] > arr[b] {
              let temp = arr[a]
              arr[a] = arr[b]
              arr[b] = temp
            }
          }
        }

        for e in 0..<size {
          print(arr[e], terminator: " ")
        }
        print(checkSorted(arr: &arr, size: 3))
      }
    }
  }
}

func checkSorted(arr: inout [Int], size: Int) -> Bool {
  for i in 0..<size - 1 {
    if arr[i] > arr[i + 1] {
      return false
    }
  }
  return true
}

selectionSort1()

//TODO:
func selectionSort2() {
  var arr = [1, 3, 2, 5, 8, 1, 2, 5, 8, 9]

  for i in 0..<arr.count - 1 {
    var min = (arr[i], i)

    for j in i..<arr.count {
      if min.0 > arr[j] {
        arr[min.1] = arr[j]
        arr[j] = min.0
        min.0 = arr[min.1]
      }
    }
  }
}


selectionSort2()

/// Bubble Sort
func bubbleSort() {
  var arr = [5, 4, 3, 2, 1]

  for i in 0..<arr.count - 1 {
    var isSwapped = false
    for j in 0..<arr.count - i - 1 {
      if arr[j] > arr[j + 1] {
        arr.swapAt(j, j + 1)
        isSwapped = true
      }
    }
    if !isSwapped {
      break
    }
  }
  print(arr)
}

print("bubble - \(bubbleSort())")

/// Insertion Sort
func insertionSort() {
  var arr = [6, 5, 4, 3, 2, 1]
  let arrCount = arr.count

  for i in 1..<arrCount {
    for j in 0..<i {
      if arr[j] > arr[i] {
        let swapNum = arr.remove(at: i)
        arr.insert(swapNum, at: j)
        break
      }
    }
    print("outer - \(arr)")
  }
}

insertionSort()

/// Sequential Search
func sequentialSearch(arr: [Int], num: Int) -> Int {
  //  return arr.firstIndex(of: num) ?? -1
  for i in 0..<arr.count {
    if arr[i] == num {
      return i
    }
  }
  return -1
}

let searchArr = [3, 2, 5, 7, 8, 2, 19]
print(sequentialSearch(arr: searchArr, num: 19))
print(sequentialSearch(arr: searchArr, num: 1))

/// 문자열 압축
let stringArr = ["a", "b", "a", "b", "c", "d", "f", "d", "c", "e", "e", "d", "a", "g"]
func stringCompression(arr: [String]) {
  let sortedArr = arr.sorted()
  var count = 1
  var matchingString = sortedArr[0]
  for i in 0..<sortedArr.count {
    if sortedArr[i] == matchingString {
      count += 1
    } else {
      print("\(matchingString)\(count)", terminator: "")
      matchingString = sortedArr[i]
      count = 1
    }
  }
}

stringCompression(arr: stringArr)

/// 이진 탐색
let binaryArr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

func binarySearch(arr: [Int], element: Int) -> Int {
  var right = arr.count - 1
  var left = 0
  while left <= right {
    let mid = (right + left) / 2
    if arr[mid] > element {
      right = mid - 1
    } else if arr[mid] < element {
      left = mid + 1
    } else {
      print("Found - \(mid)")
      return mid
    }
    print("left, right - \(left), \(right)")
    print("mid - \(mid)")
  }
  return -1
}

print(binarySearch(arr: binaryArr, element: 3))

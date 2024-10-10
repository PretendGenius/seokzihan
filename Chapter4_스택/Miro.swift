//
//  Miro.swift
//  DataStructure
//
//  Created by 한지석 on 10/10/24.
//

import Foundation

var binaryArray: [[String]] = [
    ["1", "1", "1", "1", "1", "1", "1", "1"],
    ["1", "S", "0", "0", "0", "0", "0", "1"],
    ["1", "1", "1", "0", "1", "0", "1", "1"],
    ["1", "0", "0", "0", "0", "0", "0", "1"],
    ["1", "0", "1", "1", "1", "1", "1", "1"],
    ["1", "0", "0", "0", "0", "0", "0", "1"],
    ["1", "1", "1", "1", "0", "1", "1", "1"],
    ["1", "1", "0", "0", "0", "1", "0", "1"],
    ["1", "0", "0", "0", "0", "0", "G", "1"],
    ["1", "1", "1", "1", "1", "1", "1", "1"]
]

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
var isVisited: [[Bool]] = Array(repeating: Array(repeating: false, count: 8), count: 10)
var result: [(Int, Int)] = []
var isFound = false

func stackMaze(
  row: Int,
  col: Int
) {
  if isFound { return }
  isVisited[row][col] = true

  print("(\(row), \(col)) ", separator: "")

  if binaryArray[row][col] == "G" {
    print("FOUND !!")
    isFound = true
    return
  }

  if binaryArray[row][col] == "0" || binaryArray[row][col] == "S" {
    binaryArray[row][col] = "X"
  }

  for i in 0..<4 {
    let nx = row + dx[i]
    let ny = col + dy[i]
    if nx < 0 || nx >= 10 || ny < 0 || ny >= 8 {
      continue
    }

    if isVisited[nx][ny] == false {
      stackMaze(row: nx, col: ny)
    }
  }
}

stackMaze(row: 1, col: 1)
print(result)
print(binaryArray.forEach { print($0) })

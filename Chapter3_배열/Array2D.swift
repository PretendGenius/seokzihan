//
//  Array2D.swift
//  DataStructure
//
//  Created by 한지석 on 10/8/24.
//

import Foundation

protocol Array2D {
  var numRows: Int { get set }
  var numCols: Int { get set }
  var values: [[Double]] { get set }

  func setValue(row: Int, col: Int, value: Double)
  func getValue(row: Int, col: Int) -> Double
  func add(b: Array2D) -> Array2D?
  func transpose() -> Array2D?
  func matrixPrint()
}

class Array2DImplement: Array2D {
  var numRows: Int
  var numCols: Int
  var values: [[Double]]

  init(numRows: Int, numCols: Int) {
    self.numRows = numRows
    self.numCols = numCols
    self.values = Array(repeating: Array(repeating: 0.0, count: numCols), count: numRows)
  }

  func setValue(row: Int, col: Int, value: Double) {
    values[row][col] = value
  }

  func getValue(row: Int, col: Int) -> Double {
    return values[row][col]
  }

  func add(b: Array2D) -> Array2D? {
    var array2d = Array2DImplement(numRows: self.numRows, numCols: self.numCols)
    for i in 0..<numRows {
      for j in 0..<numCols {
        let sum = self.getValue(row: i, col: j) + b.getValue(row: i, col: j)
        array2d.setValue(row: i, col: j, value: sum)
      }
    }
    return array2d
  }

  func transpose() -> Array2D? {
    var array2d = Array2DImplement(numRows: self.numRows, numCols: self.numCols)
    for i in 0..<numRows {
      for j in 0..<numCols {
        array2d.setValue(row: j, col: i, value: self.getValue(row: i, col: j))
      }
    }
    return array2d
  }

  func matrixPrint() {
    for i in 0..<numRows {
      for j in 0..<numCols {
        print(getValue(row: i, col: j))
      }
    }
  }
}

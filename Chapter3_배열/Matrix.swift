//
//  Matrix.swift
//  DataStructure
//
//  Created by 한지석 on 10/8/24.
//

import Foundation

/// (r, c) -> c + num_cols*r

protocol Matrix {
  var numRows: Int { get set }
  var numCols: Int { get set }
  var values: [Double] { get set }

  func setValue(row: Int, col: Int, value: Double)
  func getValue(row: Int, col: Int) -> Double
  func add(b: Matrix) -> Matrix?
  func transpose() -> Matrix?
  func matrixPrint()
}

class MatrixImplement: Matrix {
  var numRows: Int
  var numCols: Int
  var values: [Double]

  init(numRows: Int, numCols: Int) {
    self.numRows = numRows
    self.numCols = numCols
    self.values = Array(repeating: 0, count: numRows * numCols)
  }

  func setValue(row: Int, col: Int, value: Double) {
    values[col + row * numCols] = value
  }

  func getValue(row: Int, col: Int) -> Double {
    return values[col + row * numCols]
  }

  func add(b: Matrix) -> Matrix? {
    guard
      self.numRows == b.numRows,
      self.numCols == b.numCols else {
      return nil
    }
    var matrix = MatrixImplement(numRows: self.numRows, numCols: self.numCols)
    for i in 0..<numRows {
      for j in 0..<numCols {
        matrix.setValue(row: i, col: j, value: getValue(row: i, col: j) + b.getValue(row: i, col: j))
      }
    }
    return matrix
  }

  func transpose() -> Matrix? {
    var matrix = MatrixImplement(numRows: self.numRows, numCols: self.numCols)
    for i in 0..<numRows {
      for j in 0..<numCols {
        matrix.setValue(row: j, col: i, value: self.getValue(row: i, col: j))
      }
    }
    return matrix
  }

  func matrixPrint() {
    for i in 0..<numRows {
      for j in 0..<numCols {
        print(getValue(row: i, col: j))
      }
    }
  }
}

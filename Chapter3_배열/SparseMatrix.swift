//
//  SparseMatrix.swift
//  DataStructure
//
//  Created by 한지석 on 10/8/24.
//

import Foundation

/// sparseMatrix
/// 0이 아닌 항이 얼마 없는 행렬 = 희소 행렬
///

protocol SparseMatrix {
  var numRows: Int { get }
  var numCols: Int { get }
  var values: [[Double]] { get }

  func setValue(row: Int, col: Int, value: Double)
  func transPose() -> SparseMatrix
  func printMatrix() // 0이 아닌 위치
  func printTerms() // 전체
}
/// row -> col 순서

class SparseMatrixImplement: SparseMatrix {
  var numRows: Int
  var numCols: Int
  var values: [[Double]]

  init(numRows: Int, numCols: Int) {
    self.numRows = numRows
    self.numCols = numCols
    self.values = Array(
      repeating: Array(
        repeating: 0,
        count: numCols
      ),
      count: numRows
    )
  }

  /// 정렬하는 로직 필요
  func setValue(row: Int, col: Int, value: Double) {
    self.values[row][col] = value
  }

  func transPose() -> SparseMatrix {
    var matrix = SparseMatrixImplement(numRows: self.numCols, numCols: numRows)
    for i in 0..<numRows {
      for j in 0..<numCols {
        matrix.setValue(row: j, col: i, value: self.values[i][j])
      }
    }
    return matrix
  }

  func printMatrix() {
    <#code#>
  }

  func printTerms() {
    <#code#>
  }


}

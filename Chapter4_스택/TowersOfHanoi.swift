//
//  TowersOfHanoi.swift
//  DataStructure
//
//  Created by 한지석 on 10/10/24.
//

import Foundation

class TowersOfHanoi {
  var tower: [[String]] = [[], [], []]

  init() { }

  func printTowers() {
    for i in 0..<tower.count {
      print("\(i) - ", separator: "")
      for j in 0..<tower[i].count {
        print(tower[i][j], separator: "")
      }
    }
  }

  func moveDisk(from: Int, to: Int) {

    guard !tower[from].isEmpty else { return }

    let disk = tower[from].last!

    if !tower[to].isEmpty && tower[to].last! > disk {
      print("Cannot Place")
    }

    tower[from].removeLast()
    tower[to].append(disk)

    print("Move Disk - \(disk) from \(from) to \(to)")
    printTowers()
  }

  func recursiveMoveDisks(n: Int, from: Int, temp: Int, to: Int) {
    if n == 0 { return }
    recursiveMoveDisks(n: n - 1, from: from, temp: to, to: temp)
    moveDisk(from: from, to: to)
    recursiveMoveDisks(n: n - 1, from: temp, temp: from, to: to)
  }
}


let towers = TowersOfHanoi()

towers.tower[0].append("A")
towers.tower[0].append("B")
towers.tower[0].append("C")

towers.recursiveMoveDisks(n: 3, from: 0, temp: 1, to: 2)

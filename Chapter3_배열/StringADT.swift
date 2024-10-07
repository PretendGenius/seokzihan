//
//  StringADT.swift
//  DataStructure
//
//  Created by 한지석 on 10/7/24.
//

import Foundation

protocol MyStringProtocol {
  var initStr: String { get set }

  func copy() -> MyStringProtocol
  func changeStr(_ str: String)
  func findStr(_ str: String) -> Int
  func printStr()
  func isEqual(_ str: String) -> Bool
  func insertStr(_ str: String, index: Int)
  func subStr(_ index: Int, _ count: Int)
  func concat(_ str: MyStringProtocol) -> MyStringProtocol
}


class MyString: MyStringProtocol {

  var initStr: String

  init(initStr: String) {
    self.initStr = initStr
  }

  func copy() -> MyStringProtocol {
    return MyString(initStr: self.initStr)
  }

  func changeStr(_ str: String) {
    self.initStr = str
  }

  func findStr(_ str: String) -> Int {
    if self.initStr.contains(str) {
      let strToArr = initStr.map { $0 }
      return strToArr.firstIndex(of: str.first!).map { Int($0) }!
    }
    return -1
  }

  func printStr() {
    print(self.initStr)
  }

  func isEqual(_ str: String) -> Bool {
    self.initStr == str
  }

  func insertStr(_ str: String, index: Int) {
    var strToArr = self.initStr.map { String($0) }
    strToArr.insert(str, at: index)
    self.initStr = strToArr.joined(separator: "")
  }

  func subStr(_ index: Int, _ count: Int) {
    let strToArr = self.initStr.map { String($0) }
    self.initStr =  strToArr[index..<index + count].joined(separator: "")
  }

  func concat(_ str: MyStringProtocol) -> MyStringProtocol {
    return MyString(initStr: self.initStr + str.initStr)
  }
}

// find
let str1 = MyString(initStr: "hi hay he hel hello llo ello el el o!")
str1.printStr()
str1.changeStr("ABCDEF")
print("Found at - \(str1.findStr("A"))")
print("Found at - \(str1.findStr("AB"))")
print("Found at - \(str1.findStr("CDE"))")
print("Found at - \(str1.findStr("EF"))")
print("Found at - \(str1.findStr("EFG"))")
print("Found at - \(str1.findStr("EFGHIJ"))")

// 복사
str1.changeStr("hi hay he hel hello llo ello el el o!")
let str2 = str1.copy()
str2.printStr()

// isEqual()
var str3: MyStringProtocol = MyString(initStr: "ABC")
print(str3.isEqual("ABC"))
print(str3.isEqual("AB"))

// insert()
for i in 0..<6 {
  let str4 = MyString(initStr: "ABCDE")
  let str5 = str4
  str5.insertStr("123", index: i)
  str5.printStr()
}

// substr()
let str = MyString(initStr: "ABCDEFGHIJ")
str.subStr(3, 4)
str.printStr()

// concat()
str1.changeStr("Hello, ")
str2.changeStr("World!")
str3 = str1.concat(str2)
str3.printStr()

//
//  InfixAndPostfix.swift
//  DataStructure
//
//  Created by 한지석 on 10/10/24.
//

import Foundation

var queue: [Character] = []
var output: [Character] = []
var stack: [Character] = []

func prec(_ c: Character) -> Int {
  switch c {
  case "+", "-": return 1
  case "*", "/": return 2
  case "^": return 3
  default: return 0
  }
}

func infixToPostfix(
  queue: inout [Character],
  output: inout [Character]
) {
  while !queue.isEmpty {
    let element = queue.removeFirst()

    if element.isNumber { // 숫자라면 바로 output으로

      output.append(element)

    } else if element == "(" {

      // 괄호 지점까지의 파악을 위해 stack으로
      stack.append(element)

    } else if element == ")" {

      // '(' 전까지 요소를 output에 넣어줌
      while let top = stack.last,
            top != "(" {
        output.append(stack.removeLast())
      }
      // '('를 삭제
      let _ = stack.popLast()

    } else { // 연산자 만났을 때

      /// 스택의 요소가 존재하여 top이 존재하고,
      /// 연산 우선순위가 스택에 이미 존재하는 것이 큰 경우
      /// output에 해당 연산자를 우선으로 삽입
      while let top = stack.last,
            prec(top) >= prec(element) {
        output.append(stack.removeLast())
      }
      stack.append(element)

    }
    print("queue - \(queue)")
    print("stack - \(stack)")
    print("output - \(output)")
    print("----------------------------------------")
  }
  while !stack.isEmpty {
    output.append(stack.removeLast())
  }
}

func postfixToInfix(queue: inout [Character]) -> Int {
  var stack: [Int] = []

  while !queue.isEmpty {
    let element = queue.removeFirst()
    if element.isNumber {
      stack.append(Int(String(element))!)
    } else {
      /// 스택에 두 개 이상의 요소가 존재한다는 것을 보장하는 요소
      /// 1. 후위 표기법의 특성
      ///   - 연산자가 피연산자 뒤에 옴
      ///   - 유효한 후위 표기식에서는 항상 연산자 앞에 충분한 수의 피연산자 존재
      /// 수학적 증명:
      /// - n개의 피연산자가 있는 유효한 수식에는 정확히 (n-1)개의 이항 연산자가 있다.
      /// - 스택에 push되는 횟수 = n (피연산자 수)
      /// - 스택에서 pop되는 횟수 = 2 * (n-1) (각 연산자마다 2개씩)
      /// - 마지막에 스택에 남는 요소 수 = n - (n-1) = 1
      let b = stack.removeLast()
      let a = stack.removeLast()
      switch element {
      case "+": stack.append(a + b)
      case "-": stack.append(a - b)
      case "*": stack.append(a * b)
      case "/": stack.append(a / b)
      default: break
      }
    }
    print("postFixStack - \(stack)")
  }

  return stack.last ?? 0
}

let infix = "1+2*(3+1)*4"

infix.forEach {
  queue.append($0)
}
print("first - \(queue)")
infixToPostfix(queue: &queue, output: &output)
print("queue - \(queue)")
print("output - \(output)")

let result = postfixToInfix(queue: &output)
print("result - \(result)")

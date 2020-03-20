//
//  main.swift
//  L2_Lysakov
//
//  Created by Slava V. Lysakov on 18.03.2020.
//  Copyright © 2020 Slava V. Lysakov. All rights reserved.
//

import Foundation

//Определяет четный параметр или нет
func isEven (_ value: Int) -> Bool {
    return value%2 == 0
}

//Определяет делится число без остатка на 3 или нет
func isDevideThree (_ value: Int) -> Bool {
    return value%3 == 0
}

//Удаление всех четных чисел и всех чисел, которые не делятся на 3
func removeEvenAndThree (_ value: inout [Int]) {
    value.removeAll(where: {isEven($0)||(!isDevideThree($0))})
}

func printArray (_ a:[Int]) {
    a.forEach{print($0, terminator:" ")}
    print()
}

func fibonachiArray (_ value: inout [Double], _ size: Int) {
    for i in 0...size {
        if i == 0 {
            value.append(0)
        } else if i == 1 {
            value.append(1)
        } else {
            if i == 94 {
                print (value[i-1], terminator:" ")
                print (value[i-2])
            }
            value.append(value[i-1]+value[i-2])
        }
    }
}

func simpleNumbers (_ count: Int) -> [Int] {
    var res = [Int]()
    var tmp = Array(2...count)
    var nextVal = 2
    
    repeat {
        nextVal = tmp[0]
        res.append(nextVal)
        tmp.removeAll(where: {$0%nextVal == 0})
    } while !tmp.isEmpty
    
    return res
}

var arr = (0..<10).map{ _ in Int.random(in: 1...1000)}
print ("Исходный массив")
printArray(arr)
print ("Отсортированный массив")
arr.sort(by:<)
printArray(arr)
print("Массив без четных чисел и всех чисел, которые не делятся на 3")
removeEvenAndThree(&arr)
printArray(arr)
arr.removeAll()
//Вычисление 100 чисел Фибоначчи
var farr = [Double]()
fibonachiArray(&farr, 100)
print("Числа Фибоначчи")
farr.forEach{print(String(format: "%.0f", $0))}

//Поски простых чисел
var sarr = simpleNumbers(1000)
print("Простые числа")
printArray(sarr)




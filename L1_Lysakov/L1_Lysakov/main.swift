//
//  main.swift
//  L1_Lysakov
//
//  Created by Slava V. Lysakov on 16.03.2020.
//  Copyright © 2020 Slava V. Lysakov. All rights reserved.
//

import Foundation

//Решение квадратного уравнения
print("Введите значение a")
var a :Double = Double(readLine() ?? "0") ?? 0
print("Введите значение b")
var b :Double = Double(readLine() ?? "0") ?? 0
print("Введите значение c")
let c :Double = Double(readLine() ?? "0") ?? 0

let d = b*b - 4*a*c

if (d>=0) {
    let x1 = (-b+sqrt(d))/(2*a)
    let x2 = (-b-sqrt(d))/(2*a)
    d != 0 ? print (String(format: "x1 = %.3f \nx2 = %.3f", x1, x2)) : print (String(format: "x = %.3f", x1))
} else {
    print ("Уравнение не имеет корней\n")
}

//Решение задачи о треугольнике
print("Введите значение длины катета a")
a = Double(readLine() ?? "0") ?? 0
print("Введите значение длины катета b")
b = Double(readLine() ?? "0") ?? 0
if (a == 0 || b == 0) {
    print ("Значение длины катета не может быть равно 0")
} else {
    let g = sqrt(a*a+b*b)
    print (String(format: "Длина гипотенузы = %.3f\n", g))
    print(String(format: "Периметр треугольника = %.3f\n", g+a+b))
    print(String(format: "Площадь треугольника = %.3f\n", (a*b)/2))
}

//Решение задачи о процентах
print("Введите сумму")
var sum = Double(readLine() ?? "0") ?? 0
print("Введите процент (1..100)")
let p :Double = Double(readLine() ?? "0") ?? 0
for _ in 1...5 {
    sum += (sum*p/100)
}
print (String(format: " Итоговая сумма = %.3f\n", sum))




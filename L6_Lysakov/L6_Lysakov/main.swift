import Foundation

var q = Queue.init((0...20).map { _ in
    Int.random(in: 1...100)
})
print("Исходная очередь")
print(q)
q.sort(by: <)
print("Отсортированная очередь")
print(q)
print("Удаляем четные позиции")
q.removeAll(where: { $0 % 2 == 0 })
print(q)
print("Альтернативный способ печати через функцию foreach")
q.forEach({ print("(\($0)) ") })
print("Умножаем все элементы на 2 через функцию map и печатаем")
q.map {
    $0 * 2
}.forEach({ print("(\($0)) ") })
print("проверяем доступ к элементам очереди за ее пределами")
for i in 0...20 {
    print(q[i]?.description ?? "nil")
}
print("Очищаем очередь и заполняем ее диапазоном")
q.removeAll()
q = Queue.init(1...20)
print(q)
print("Последовательно убираем из очереди 10 элементов")
for i in 1...10 {
    print("Из очереди извлечен элемент \(q.get()!)")
}
print(q)
print("Добавляем в очередь еще 10 случайных элементов")
for i in 1...10 {
    q.put(Int.random(in: 1...100))
}
print(q)
print("Извлекаем элементы из очереди пока она не станет пустой")
while !q.isEmpty() {
    print("Из очереди извлечен элемент \(q.get()!)")
}
print(q)
import Foundation

var q = Queue.init((0...20).map { _ in
    Double.random(in: 1...100)
})
print("Исходная очередь")
print(q)

print("проверяем доступ к элементам очереди за ее пределами")
for i in 0...25 {
    print(String(format: "%.2f", q[i, Double(-1)]))
}
print("Ищем не существующее значение 100,5 и проверяем исключение")
do {
    var x = try q[100.5]()
} catch let QueueError.itemNotFound {
    print(QueueError.itemNotFound.rawValue)
}

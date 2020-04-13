import Foundation

enum QueueError: String, Error {
    case itemNotFound = "Значение не найдено"
}

class Queue<T> {

    private var items: [T]
    public var count: Int {
        items.count
    }

    public func first() -> T? {
        items.first
    }

    public func isEmpty() -> Bool {
        items.isEmpty
    }

    public init() {
        items = [T]()
    }

    public init(_ arr: [T]) {
        items = [T]()
        arr.forEach {
            items.append($0)
        }
    }

    public init<S: Sequence>(_ s: S) where S.Element == T {
        items = Array.init(s)
    }

    public func put(_ item: T) {
        items.append(item)
    }

    public func get() -> T? {
        items.removeFirst()
    }

    public func removeAll() {
        items.removeAll()
    }

    public func removeAll(where removed: (T) throws -> Bool) rethrows {
        try items.removeAll(where: removed)
    }

    public func forEach(_ body: (T) throws -> Void) rethrows {
        for i in items {
            try body(i)
        }
    }

    public func map<S>(_ transform: (T) throws -> S) rethrows -> [S] {
        try items.map(transform)
    }

    public subscript(_ index: Int, defaultValue: @autoclosure () -> T) -> T {
        get {
            guard index >= items.startIndex && index < items.endIndex else {
                return defaultValue()
            }
            return items[index]
        }
    }

}

extension Queue: CustomStringConvertible where T: CustomStringConvertible {
    var description: String {
        guard !isEmpty() else {
            return "<empty queue>"
        }
        var str = ""
        if !(items[0] is Double) {
            items.forEach {
                str.append("[\($0)] ")
            }
        } else {
            items.forEach {
                str.append("[\(String(format: "%.2f", $0 as! Double))] ")
            }
        }

        return str
    }
}

extension Queue where T: Comparable {
    func sort() {
        items.sort()
    }

    func sort(by ff: (T, T) throws -> Bool) rethrows {
        try items.sort(by: ff)
    }

    subscript(_ it: T) -> () throws -> Int {
        get {
            guard items.contains(it) else {
                return {
                    throw QueueError.itemNotFound
                }
            }
            return {
                (self.items.firstIndex(of: it) ?? -1)
            }
        }
    }
}

extension Queue where T: Equatable {
    func contains(_ element: T) -> Bool {
        items.contains(element)
    }

    func firstIndex(of element: T) -> Int? {
        items.firstIndex(of: element)
    }
}


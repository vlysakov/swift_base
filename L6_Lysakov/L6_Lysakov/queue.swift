import Foundation

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

    public subscript(index: Int) -> T? {
        get {
            (index >= items.startIndex && index < items.endIndex) ? items[index] : nil
        }
    }
}

extension Queue: CustomStringConvertible where T: CustomStringConvertible {
    var description: String {
        var str = ""
        items.forEach {
            str.append("[\($0.description)] ")
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
}

extension Queue where T: Equatable {
    func contains(_ element: T) -> Bool {
        items.contains(element)
    }

    func firstIndex(of element: T) -> Int? {
        items.firstIndex(of: element)
    }
}


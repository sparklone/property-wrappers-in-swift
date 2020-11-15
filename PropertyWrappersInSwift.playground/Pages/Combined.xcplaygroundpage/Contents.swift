//: [Previous](@previous)

import Foundation

@propertyWrapper
struct Abs {
    private var _value: Int = 0

    var wrappedValue: Int
    {
        get { _value }
        set {
            _value = abs(newValue)
        }
    }

    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
    }

    //    init(custom: Int) {
    //        self.wrappedValue = custom
    //    }
}

@propertyWrapper
struct VarWithMemory<T> {
    private var _current: T
    private (set) var previousValues: [T] = []

    var wrappedValue: T {
        get { _current }
        set {
            previousValues.append(_current)
            _current = newValue
        }
    }

    var projectedValue: VarWithMemory<T> {
        get { self }
        set { self = newValue }
    }

    init(wrappedValue: T) {
        self._current = wrappedValue
    }

    mutating func clear() {
        previousValues.removeAll()
    }

}

struct TestCombined {
    @VarWithMemory @Abs var value: Int = 0
}

var test = TestCombined()
print(test.value)
test.value = -1
test.value = -2
test.value = -3
print(test.value)
print(test.$value.previousValues)


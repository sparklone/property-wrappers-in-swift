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

struct TestVarWithMemory {
    @VarWithMemory var value: String = ""
}

var test = TestVarWithMemory(value: "initial")
print("1. current value: \(test.value)")
test.value = "second"
print("2. current value: \(test.value)")
test.value = "third"
print("3. current value: \(test.value)")

// value: String, won't work
// print(test.value.previousValues)

print("4. history: \(test.$value.previousValues)")
print("5. clear")
test.$value.clear()
print("6. current value: \(test.value)")
print("7. history: \(test.$value.previousValues)")

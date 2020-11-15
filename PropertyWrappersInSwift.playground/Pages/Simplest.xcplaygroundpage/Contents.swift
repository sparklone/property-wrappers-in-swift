@propertyWrapper
struct Simplest<T> {
    var wrappedValue: T
}

struct TestSimplest {
    @Simplest var value: String
}

extension TestSimplest {
    func describe() {
        print("value: \(value) type: \(type(of: value))")
        print("_value: \(_value) type: \(type(of: _value))")
        print("_value.wrappedValue: \(value) type: \(type(of: _value.wrappedValue))")
    }
}

let simplest = TestSimplest(value: "test")
print(simplest.value)

// error: _value is private
// print(simplest._value)
simplest.describe()

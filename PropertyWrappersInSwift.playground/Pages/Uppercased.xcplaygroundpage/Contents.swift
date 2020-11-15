//: [Previous](@previous)

@propertyWrapper
struct Uppercased {
    private var count: Int
    private var value: String = ""

    var wrappedValue: String {
        get { value }
        set {
            let uppercased = String(newValue.prefix(count)).uppercased()
            value = uppercased
            guard let from = newValue.index(newValue.startIndex, offsetBy: count, limitedBy: newValue.endIndex) else { return }
            value += newValue.suffix(from: from)
        }
    }

    init(wrappedValue: String, count: Int) {
        self.count = count
        self.wrappedValue = wrappedValue
    }

}

struct TestUppercased {
    @Uppercased(count: 5) var value: String = ""
}

struct TestUppercased2 {
    @Uppercased var value: String

    init(count: Int, example: String) {
        _value = Uppercased(wrappedValue: example, count: count)
    }
}

var testAbs = TestUppercased(value: "hello world")
print(testAbs.value)
testAbs.value = "another example"
print(testAbs.value)
testAbs.value = "abc"
print(testAbs.value)


var testAbs2 = TestUppercased2(count: 3, example: "super puper")
print(testAbs2.value)

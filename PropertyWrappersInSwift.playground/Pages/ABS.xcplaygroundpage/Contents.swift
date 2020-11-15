//: [Previous](@previous)

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

struct TestAbs {
    @Abs var value: Int = 0
}

var testAbs = TestAbs(value: -10)
print(testAbs.value)
testAbs.value = 20
print(testAbs.value)
testAbs.value = -30
print(testAbs.value)

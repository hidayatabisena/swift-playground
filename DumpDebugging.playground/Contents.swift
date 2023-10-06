import UIKit

class Person {
    let name: String
    let surname: String
    let age: Int

    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
}

let person = Person(name: "Han", surname: "Hyojoo", age: 30)

extension Person: CustomStringConvertible {
    var description: String {
        return "\(name) \(surname), \(age) years old"
    }
}

print("--- Print ---")
print(person)

print("--- Dump ---")
dump(person)

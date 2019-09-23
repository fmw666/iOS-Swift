## Swift 面向对象

### 枚举和结构体

```swift
//
//  main.swift
//  Command Line Study
//
//  Created by student on 2019/9/16.
//  Copyright © 2019年 范茂伟. All rights reserved.
//

// 倒入第三方库关键字 import
import Foundation

/*
 编写代码实现以下功能：
（1）定义结构体，保存学生信息，包括姓名、年龄、性别、学号、班级。其中性别是枚举类型，枚举值为Male和Female。结构体中包括方法description，该方法打印输出上述学生信息。
（2）创建10个学生对象，保存在字典中，字典以学生学号为主键key，遍历字典并输出所有学生信息。
 */

// 定义性别枚举
enum Sex {
    case Male
    case Female
}

// 创建学生信息结构体
struct Student {
    var name: String
    var age: Int
    var sex: Sex
    var sid: String
    var crs: Int

    func description() {
        print("姓名：\(name)，年龄：\(age)，性别：\(sex)，学号：\(sid)，班级：\(crs)")
    }
}

var stu1 = Student(name: "范茂伟", age: 20, sex: .Male, sid: "2017110110", crs: 1)
var stu2 = Student(name: "范小1", age: 18, sex: .Male, sid: "2017110111", crs: 1)
var stu3 = Student(name: "范小2", age: 19, sex: .Male, sid: "2017110112", crs: 1)
var stu4 = Student(name: "范小4", age: 20, sex: .Female, sid: "2017110113", crs: 1)
var stu5 = Student(name: "范小5", age: 20, sex: .Male, sid: "2017110114", crs: 1)
var stu6 = Student(name: "范小6", age: 18, sex: .Male, sid: "2017110115", crs: 1)
var stu7 = Student(name: "范小7", age: 18, sex: .Female, sid: "2017110116", crs: 2)
var stu8 = Student(name: "范小8", age: 19, sex: .Male, sid: "2017110117", crs: 2)
var stu9 = Student(name: "范小9", age: 21, sex: .Female, sid: "2017110118", crs: 2)
var stu10 = Student(name: "范小10", age: 18, sex: .Male, sid: "2017110119", crs: 3)

var dic = [2017110110:stu1,2017110111:stu2,2017110112:stu3,2017110113:stu4,2017110114:stu5,2017110115:stu6,2017110116:stu7,2017110117:stu8,2017110118:stu9,2017110119:stu10]

for (_,stu) in dic {
    stu.description()
}
```

### 类和对象

```swift
//
//  main.swift
//  Command Line Study
//
//  Created by student on 2019/9/9.
//  Copyright © 2019年 范茂伟. All rights reserved.
//

// 倒入第三方库关键字 import
import Foundation

// 类与对象

// 创建类Shape
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    // 提供默认的不带参数的构造函数、拷贝构造函数、析构函数
}

// 创建一个类的实例，与C++类似
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()


struct S {
    var data: Int = 1
}
var a = S()
var b = a
a.data = 42
print("\(a.data), \(b.data)")

class C {
    var data: Int = 1
}
var x = C()
var y = x
x.data = 42
print("\(x.data), \(y.data)")


class NamedShape {
    var numberOfsides = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Shape destructed")
    }
    
    func description() {
        print("\(name)'s shape with \(numberOfsides) shape.")
    }
}

var shape2 = NamedShape(name: "Tomn")
shape2.numberOfsides = 4
shape2.description()
shape2 = NamedShape(name: "Jong")

// 继承
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfsides = 4
    }
    
    override func description() {
        print("A square named \"\(name)\" with sides of length \(sideLength).")
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
}

let sq = Square(sideLength: 3.5, name: "MySquare")
print(sq.area())
sq.description()

// 便利初始化器
class N {
    var num: Int
    
    init(num: Int) {
        self.num = num
    }
    
    convenience init(isBigNum: Bool) {
        self.init(num: isBigNum ? 10000: 1)
    }
}

var n1 = N(num: 3)
print(n1.num)
var n2 = N(isBigNum: true)
print(n2.num)
var n3 = N(isBigNum: false)
print(n3.num)

class Human {
}
class Man: Human {
}
class Woman: Human {
}
let man = Man()
let woman = Woman()
var arr = [man, woman]
for p in arr {
    if p is Man {
        print("This is man.")
    } else if p is Woman {
        print("This is woman.")
    }
}
for p in arr {
    if (p as? Man) != nil {
        print("This is man.")
    }
}

```

```swift
//
//  main.swift
//  Command Line Study
//
//  Created by student on 2019/9/16.
//  Copyright © 2019年 范茂伟. All rights reserved.
//

// 倒入第三方库关键字 import
import Foundation

/*
 编写代码，实现以下要求：
 1）实现Person类，具有firstName,  lastName，age，gender等存储属性，fullName计算属性，其中gender是枚举类型（male，female）
 2）具有指定初始化器和便利初始化器，指定初始化器使用required关键字修饰；
 3）Person具有work方法，输出“Person XXX is working”
 4）从Person分别派生Teacher类和Student类
 5）Teacher类重写work方法，输出“Teacher XXX is teaching”
 6）Student类增加学号（StuID）、C语言成绩（cScore）、C++语言成绩（cppScore）和数据结构成绩（dataStruct）四个存储属性
 7）Student类重写work方法，输出“Student XXX is Learning”
 8）Student类定义下标，分别返回C语言、C++语言和数据结构成绩
 9）创建Person、Teacher、Student对象，别分调用work方法，输出Student下标值
 */

// 创建性别枚举
enum Gender {
    case male
    case female
}

// 创建Person类
class Person {
    // 存储属性 firstName，lastName，age，gender
    var firstName: String
    var lastName: String
    var age: Int
    var gender: Gender

    // 要求子类有其他初始化器时，必须重写该初始化器
    required init(firstName: String, lastName: String, age: Int, gender: Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }

    // 便利初始化器
    convenience init(haveFirstName: Bool, havaLastName:Bool, oldAge: Bool, haveGender: Bool) {
        self.init(firstName:haveFirstName ? "Exist" : "None", lastName:havaLastName ? "Exist" : "None", age:oldAge ? 20 : 18, gender:haveGender ? .male : .male)
    }

    // 计算属性 fullName
    var fullName: String {
        // 获取计算属性的值
        get {
            return "\(firstName) \(lastName)"
        }
        // set传递属性的值
        set {
            let nameList = newValue.components(separatedBy: " ")
            firstName = nameList[0]
            lastName = nameList[1]
        }
    }

    // work 方法
    func work() {
        print("Person \(fullName) is working")
    }
}

// Person派生类：Teacher
class Teacher: Person {
    // 父类方法work重写
    override func work() {
        print("Teacher \(fullName) is teaching")
    }
}

// Person派生类：Student
class Student: Person {
    // 新增存储属性 StuID（学号），cScore（C语言成绩），
    //            cppScore（C++语言成绩），dataStruct（数据结构成绩）
    var StuID: String
    var cScore: Double
    var cppScore: Double
    var dataStruct: Double
    
    // 重写父类初始化器
    required init(firstName: String, lastName: String, age: Int, gender: Gender) {
        StuID = "2017110110"
        cScore = 0
        cppScore = 0
        dataStruct = 0
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    // 初始化构造器
    init(firstName: String, lastName: String, age: Int, gender: Gender, StuID: String, cScore: Double, cppScore: Double, dataStruct: Double) {
        self.StuID = StuID
        self.cScore = cScore
        self.cppScore = cppScore
        self.dataStruct = dataStruct
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
    // 父类方法work重写
    override func work() {
        print("Student \(fullName) is Learning")
    }
    
    // 定义类的下标：下标返回C语言、C++语言和数据结构成绩
    subscript(sideIndex: Int) -> Double {
        switch sideIndex {
        case 1: return cScore
        case 2: return cppScore
        case 3: return dataStruct
        default: return -1
        }
    }
}

// 创建Person对象
let person = Person(firstName: "Fan", lastName: "MaoWei", age: 20, gender: .male)
person.work()

// 创建Teacher对象
let teacher = Teacher(firstName: "Li", lastName: "Wei", age: 30, gender: .male)
teacher.work()

// 创建Student对象
let student = Student(firstName: "Fan", lastName: "XiaoWei", age: 18, gender: .female, StuID: "2017110110", cScore: 80, cppScore: 98, dataStruct: 78)
student.work()
// 输出Student下标值
print(student[0])
print(student[1])
print(student[2])
print(student[3])
print(student[4])

// 便利构造器创建Person对象
let p = Person(haveFirstName: true, havaLastName: false, oldAge: true, haveGender: true)
print(p.fullName) // Exist None

```

### 扩展

```swift
//
//  Extension.swift
//  Command Line Study
//
//  Created by student on 2019/9/23.
//  Copyright © 2019 范茂伟. All rights reserved.
//

// 倒入第三方库关键字 import
import Foundation

/*
 * 扩展：向已有的类、结构体或枚举类型添加新的功能
 * 扩展机制只有在Swift和OC语言中有（OC中称为分类Category）
 */

// extension
class Person {
    var firstName = "MaoWei"
    var lastName = "Fan"
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
}

extension Person {
    // 扩展计算属性
    var fullName: String {
        return lastName + " " + firstName
    }
    // 扩展方法
    func getAge() -> Int {
        return age
    }
    // 扩展下标
    subscript(i: Int) -> String {
        if i == 0 {
            return firstName
        } else if i == 1 {
            return lastName
        } else {
            return "error"
        }
    }
    // 扩展构造函数
    convenience init(fn: String, ln: String, age: Int) {
        self.init(age: age)
        firstName = fn
        lastName = ln
    }
}

var p = Person(age: 20)
print(p.fullName)
print(p.getAge())
print(p[0])
print(p[2])
var p2 = Person(fn: "YuJie", ln: "Tang", age: 19)
print(p2.fullName)
```

### 协议

```swift
//
//  Protocol.swift
//  Command Line Study
//
//  Created by student on 2019/9/23.
//  Copyright © 2019 范茂伟. All rights reserved.
//

// 倒入第三方库关键字 import
import Foundation

/*
 * 协议（Protocol）：协议是为方法、属性等定义一套规范，没有具体的实现
 * 协议能够被类、结构体等具体实现（或j遵守）
 * 类似C++中的纯虚类，类似Java中的接口（interface）
 */

// 协议的定义
protocol ExampleProtocol {
    var simpleDescription: String {get set}
    func adjust()
}

class C: ExampleProtocol {
    var simpleDescription: String = "Download"
    var anotherProperty: Int = 123456
    func adjust() {
        simpleDescription += " now 100% adjust."
    }
}

//var c = C()
//print(c.simpleDescription)
//c.adjust()
//print(c.simpleDescription)

protocol MyRect {
    func myLuckNumber() -> Int
}

class Dice {
    let sides: Int
    var gener: MyRect
    init(sides: Int, gener: MyRect) {
        self.sides = sides
        self.gener = gener
    }
}

class MyRectImp: MyRect {
    func myLuckNumber() -> Int {
        return 6
    }
}


var dice = Dice(sides: 6, gener: MyRectImp())
print(dice.gener.myLuckNumber())
```

### 泛型

```swift
//
//  Template.swift
//  Command Line Study
//
//  Created by student on 2019/9/23.
//  Copyright © 2019 范茂伟. All rights reserved.
//

// 倒入第三方库关键字 import
import Foundation

class Person {
    var firstName = "MaoWei"
    var lastName = "Fan"
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
}

// 模版函数 template function
func isEquals<T: Comparable>(a: T, b: T) -> Bool {
    return a == b
}

//print(isEquals(a: Person(age: 10), b: Person(age: 20)))
print(isEquals(a: 1.0, b: 1.0))

// 模版类 template class
class Stack<T> {
    var items = [T]()
    
    func push(item: T) {
        items.append(item)
    }
    
    func pop() -> T {
        return items.removeLast()
    }
}

var stactInt = Stack<Int>()
stactInt.push(item: 1)
stactInt.push(item: 2)
print(stactInt.pop())
print(stactInt.pop())

var stackString = Stack<String>()
// ......
```

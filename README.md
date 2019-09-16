## Swift 语言基础

```swift
//
//  main.swift
//  Command Line Study
//
//  Created by student on 2019/9/2.
//  Copyright © 2019年 范茂伟. All rights reserved.
//

/*
 * 这是多行注释
 */

// 倒入第三方库关键字 import
import Foundation

// 变量定义标识符 var
var name = "范茂伟"
// 常量定义标识符 let
let age:Double = 11

print("我是\(name)，我喜欢iOS.今年\(age)岁了！")

/*
 swift 的变量赋值和 Python 一样，
 如果赋值 var r = 10，则 r 被默认为整型
 如果要规定变量类型则： var r:Double = 10
 */

let PI = 3.14       // constant double PI = 3.14
var r:Double = 10   // double r = 10

// 1）元组定义
let myInfo1 = ("fanmaowei", "Male", 20) // 定义元组
let myInfo2: (String, String, Int) = ("fanmaowei", "Male", 20)
var myInfo3 = (name:"fanmaowei", gender:"Male", age:20) // 定义元组，使用元素名称

// 2）修改元组
myInfo3.name = "Yu"
myInfo3.age = 60

// 3）使用元组
print("My name is \(myInfo3.name) and my age is \(myInfo3.age)")
print("My name is \(myInfo1.0) and my age is \(myInfo1.2)")


// 变量值不会被隐式转换，只能使用显示转换


// 类型别名
typealias ShortInteger = Int8

// “可选”实例：字符串变整型
var possibleInt:Int? = 0

possibleInt = Int("7")
//print(possibleInt)
print(possibleInt!)

//possibleInt = Int("banana")
//print(possibleInt)

// “运算符”实例：给定半径，计算圆形面积和球形体积
var rds = 10.0
var area = PI * rds * rds
var volumn = 4/3 * PI * rds * rds * rds
print("The area is \(area), and the volumn is \(volumn)")

// 计算 1-100 之和
var sum = 0

for n in 1...100 {
    sum += n
}

print("0-100 之和是：\(sum)")

// 计算13的阶乘
var result = 1
var n = 13

while n>0 {
    result *= n
    n -= 1
}

print("13 的阶乘是：\(result)")

// 计算100以内的斐波那契数列
// 1 1 2 3 5 8 13 21 34 55 89
var value = 1
var value_before = 1
print(value, terminator: " ")

while value<100 {
    print(value, terminator: " ")
    let temp = value
    value += value_before
    value_before = temp
}
print("\n")

// 1) 创建数组
var emptyArray1 = Array<String>()
var emptyArray2 = [String]()
var digitalList = ["one", "two", "three", "four"]
print(digitalList[1])

// 2) 非空判断
print(emptyArray1.isEmpty)

// 3) 添加数组元素
emptyArray1.append("小猫🐱")  // 推荐
emptyArray1 = emptyArray1 + ["小狗"]
emptyArray1 += ["小鸟"]
emptyArray1.insert("小鱼🐟", at: 1)

print(emptyArray1)

// 4) 数组元素个数
print(emptyArray1.count)

// 5) 删除元素
emptyArray1.remove(at: 1)
emptyArray1.removeLast()
emptyArray1.removeAll()

// 创建字典
var emptyDictionary1 = Dictionary<String,Double>()
var emptyDictionary2 = [String:Float]()
var occupations = ["Malcolm":"Caption","Kaylee":"Mechanic"]

// 访问字典元素
occupations["Jayne"] = "Public Relations"

// 1）创建字典
var dic = ["apple": 6.5, "banana": 4, "orange": 3.0]
print(dic)

// 2）添加元素
dic["grape"] = 10
print(dic)

// 3）修改元素
dic["apple"] = 8.0
print(dic)

// 4）删除元素
dic.removeValue(forKey: "banana")
print(dic)

// 5）遍历迭代 key 值
for key in dic.keys {
    print(key)
}

// 6）遍历迭代 所有元素
for (key, value) in dic {
    print("\(key)'s price is \(value) RMB")
}
```

### 函数

```swift
//
//  main.swift
//  Command Line Study
//
//  Created by student on 2019/9/2.
//  Copyright © 2019年 范茂伟. All rights reserved.
//

// 倒入第三方库关键字 import
import Foundation

// 函数定义
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}

print(greet(person: "Bob", day: "Tuesday"))

// 使用标签
func greet1(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}

print(greet1("John", on:"Wednesday"))

// 函数练习：编写函数，求两数之和
func add(n1: Int, n2: Int) -> Int {
    return n1+n2
}

print(add(n1: 1, n2: 2))

// 编写函数，求数组中元素值大于10的平均值
func average(arr: [Double]) -> Double {
    var count = 0
    var sum = 0.0
    
    for item in arr {
        if item > 10 {
            sum += item
            count += 1
        }
    }
    
    return sum / Double(count)
}

var arr = [5.0, 10.0, 15.0]
print(average(arr: arr))

// 函数嵌套：输出阈值内的所有偶数
func evenNumber(_ t: Int) {
    var number = 0
    
    func add2() {
        number += 2
    }
    
    while number < t {
        print(number)
        add2()
    }
}
evenNumber(15)

// 函数作为参数传递、函数作为返回值
func getSmaller(n1: Int, n2: Int) -> Int {
    return n1 < n2 ? n1 : n2
}

var f:(Int, Int) -> Int = getSmaller
print(f(1, 2))

func getBigger(n1: Int, n2: Int) -> Int {
    return n1 > n2 ? n1 : n2
}

func printMathRst(mathFunction: (Int, Int)->Int, n1: Int, n2: Int) {
    print("The result is \(mathFunction(n1 ,n2))")
}

printMathRst(mathFunction: getBigger, n1: 1, n2: 2)
```

### 回文素数判断

```swift
//
//  main.swift
//  Command Line Study
//
//  Created by student on 2019/9/2.
//  Copyright © 2019年 范茂伟. All rights reserved.
//

// 倒入第三方库关键字 import
import Foundation

// 素数判断
func if_prime(_ t: Int) -> Bool {
    // 小于等于1的不是素数
    if(t <= 1) {
        return false
    }
    // 求根运算
    let end_num = Int(sqrt(Double(t)))
    // 2、3是素数直接返回true，否则会影响后面判断条件
    if(end_num < 2) {
        return true
    }
    // 判断条件：一个数是否为素数
    // 如果这个数对从2到这个数的开方任意一值都不能整除（求余为0），则判断为素数
    for i in 2...end_num {
        let num = Int(i)
        // 某一值被整除，不满足素数判断条件，返回false
        if(t % num == 0) {
            return false
        }
    }
    // 都不能整除，满足素数判断条件，返回true
    return true
}

// 回文判断
func if_palindrome(_ t: Int) -> Bool {
    // 求绝对值操作，原因在于我们这儿设定 -12321 也为回文数
    let abs_t = abs(t)
    // 数值的字符串显式转换操作
    let s = String(abs_t)
    // 判断需要进行的次数，即数值字符串长度的一半，1->0 2->1 3->1 4->2 5->2 ...
    let times = s.count / 2
    // 等于0表示该数为个位数，满足回文条件，返回true
    if(times == 0) {
        return true
    }
    for time in 1...times {
        let index = Int(time) - 1
        // 数值字符串正向索引序列
        let start_index = s.index(s.startIndex, offsetBy:index)
        // 数值字符串逆向索引序列
        let end_index = s.index(s.endIndex, offsetBy:-(index+1))
        // 回文判断，每位 正逆索引位置处 值相等则满足回文条件，否则不满足返回false
        if(s[start_index] != s[end_index]) {
            return false
        }
    }
    
    return true
}

// 回文 and 素数判断
func if_palindrome_and_prime(_ t: Int) -> Bool {
    if(if_prime(t) && if_palindrome(t)) {
        return true
    }
    else{
        return false
    }
}

for i in 1...1000 {
    if(if_palindrome_and_prime(i)) {
        print(i)
    }
}

```

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
//    convenience init() {
//
//    }

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
}
```

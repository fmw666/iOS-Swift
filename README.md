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

import UIKit

/*
 Задача 2

 Описание: В случае с первым методом левый и правый объект должны быть одного типа, который реализует протокол MyProtocol. Во втором случае типы объектов не обязаны совпадать, так как они будут приведены к одному протоколу. По этому второй метод в данном случае является более гибким и может принимать объекты разных классов, если они реализуют протокол MyProtocol.

 Решения нет, нужно просто объяснить особенность обоих методов и сказать, что в данном случае стоит использовать и почему.
 */

protocol MyProtocol {}

func doSomething<T: MyProtocol, U: MyProtocol>(lhs: T, rhs: U) { }

func doSomething(lhs: MyProtocol, rhs: MyProtocol) { }

class MyClassOne: MyProtocol { }
class MyClassTwo: MyProtocol { }

let a = MyClassOne()
let b = MyClassTwo()

doSomething(lhs: a, rhs: b)


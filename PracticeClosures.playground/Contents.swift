import UIKit

//func calculator (n1:Int, n2:Int, operation:(Int,Int) -> Int) -> Int{
//
//    return operation(n1,n2)
//}
//
//// closures 방법
//let result = calculator(n1: 2, n2: 3) {$0 * $1}
//
//print(result)


let array = [6,2,3,9,4,1]


//Closure Expression Syntax
//Closure expression syntax has the following general form:
//{ (parameters) -> return type in statements}

array.map({ (n1:Int) -> Int in
    n1 + 1
    }
)



let newArray = array.map{"\($0 + 1)"}

print(newArray)



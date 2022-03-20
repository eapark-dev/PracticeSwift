import UIKit

var greeting = "Hello, playground"

//알파벳 여섯자리 랜덤함수

let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

//The number of letters in alphabet equals 26
//
let password = alphabet.shuffled().prefix(6).joined()


print(password)

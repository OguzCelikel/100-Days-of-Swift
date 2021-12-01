import Foundation 

print("hello world")
//created object

/*
let omer = User()
omer.name = "omer"
omer.age = 23
omer.job = "software"

print(omer.name)

let oguz = User() 
let oguz2 = User() 

*/
/*
let omer = User(nameInput : "Omer", ageInput: 23, jobInput: "software")
print(omer.name)
*/

let omer = User(name : "Omer", age: 23, job: "software", type: .AdminUser)
print(omer.name)
print(omer.type)

// example function
omer.exampleFunc()


let ahmet = SpecialUser(name : "ahmet", age: 22, job: "hardware", type: .UnauthorizedUser)
print(ahmet.age)
ahmet.newFunc()
ahmet.exampleFunc()
print(ahmet.hairColorFunc())
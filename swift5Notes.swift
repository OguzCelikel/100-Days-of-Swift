// one line commend
/* many lines commend
asdasda*/

var myAge = 21 //var can chance
myAge = 22

let myCourses = 5 // let can not change

var laptop = 2, monitor = 1, tea = 2

var myName: String  //describe it is string
myName = 14 // OLAMAZ
myName = "Omer"

var myPhoneNumber: Int = 05380000000

var antiHello = "Let's Learn"
print(antiHello)

//Aritmatich +  -  /  *  %
//Compounds  += -= /= *=


var myName2: String = ""
myName2 = "Omer"
var mySurname: String = "Celikel"
var fullName = myName2 + " " + mySurname

var dialogue = "thats a test"
dialogue.count
dialogue.isEmpty
dialogue.contains("s")


var current_Dollar = 9.30
var current_Dollar_Integer: Int = Int(current_Dollar)
var current_Dollar_String = String(current_Dollar)

//Boolean

var isActive: Bool = false

// Logic Operators ! && ||


var myString: String? = "Anlamadım"
//  "\(variable)"  write in string


// CREATE Array

var emptyArray: [String] == []
var levelDifficulty: [String] == [Esay, Medium, Hard, OMG]

var lastLevel = levelDifficulty[3]
levelDifficulty[3] = "godMode"


levelDifficulty.append("new append")
levelDifficulty += ["new one1, newOne2"]
levelDifficulty.insert("okay", at : 2)
levelDifficulty.remove(at : 1)
levelDifficulty.reverse()
levelDifficulty.sort()

var multiArray[[String]] = [
	["one1, two, three"],
	["lets, go, now"]]

var multiArrraySearch = multiArray[0][2] //three

// creating dictionary

var blacksmiyhShop : [String: Int] = [:]  //key value empty dictionary
var rentaCar : [String: Int] = [ "Ahmet" : 10, "Mehmet" : 20 ]
var ahmetPays = rentaCar["Ahmet"] //10
// all
let allKeys = [String](rentaCar.key) // becames array list
let allValues = rentaCar.values // dictionary
let allValues = [Int](rentaCar.values)

// to update value
var oldValue = rentaCar.updateValue(30, forKey:"Ahmet")

//nested dictionaries

// Sets stores uniq values

var aktiveQuests: Set <String> = ["Name1", "Name2", "Name3"]
aktiveQuests.instert("Name4")
aktiveQuests.remove("Name3")
print(aktiveQuests) // no name3 added name4
aktiveQuests.contans("name") //false
aktiveQuests.sorted() //alphape order

// set operations
/* 
		set1.intersection(set2)
		set1.symmetricDifferent(set2)
		set1.union(set2) //show all
*/

// Tuple like arrays

var upperAttack : (String, Int, Bool) = ["Uppercut", 25, true]
print(upperAttack.0) //uppercut
var (attack, damage, recharge) = upperAttack

// IF Statement

var currentHealth = 95
var maxHealth = 100

// < > <= >= != ==

if currentHealth >= maxHealth{
	print("HP is full")
}
else if currentHealth <= 50 {
	print("Go grab some health")
}
else {
	print("HP is between 50 and 100")
}

// FOR in Loops
var stringChar : String = "Omer"

for stringLetter in stringChar{
  print(stringLetter)

}
 /*
O
m
e
r
 */

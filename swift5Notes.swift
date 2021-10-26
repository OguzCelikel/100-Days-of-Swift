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


 for i in 1...10{
   print(i)
 }
/*
1
2
3
4
5
6
7
8
9
10
*/
var armorTypes = ["iron","leather","steel"]
print(armorTypes)
//["iron", "leather", "steel"]
for armor in armorTypes[0...]{
   print(armor)
 }
/*
iron
leather
steel
*/


print("\n-------------\n")

// while statement

var playerHealth = 5

while playerHealth > 0 {
  //print("playerHealth" , playerHealth)
  print("playerHealth = \(playerHealth)")
  playerHealth -= 1
  print("still kicking!!")
}

playerHealth = 10
// repeat-while loop

repeat{
  playerHealth -= 1
  print("HP at \(playerHealth)")
}while playerHealth > 0



// switch case

let initial = "H"
let hp = 26
let mp = 24

switch initial{
  case "H":
  print("I'm guessing Harold?")
  case "A":
  print("Alita?")
  default:
  print("I've got nothing.")
}


print("\n-------------\n")

// FUNCTION

func firstFunc(){
  print("Perfect Start")
}

firstFunc()

//----------------------------------------

func infoFunc() -> String {
  let name : String = "Omer"
  let lastName : String = "Celikel"
  return name + " " + lastName
}
var fullName = infoFunc()
print(fullName)

//----------------------------------------

//----------------------------------------

func sum(firstValue : Int, secondValue : Int ) -> Int {
  return firstValue + secondValue
}
var number1 = 3
var number2 = 4
var result = sum(firstValue: number1, secondValue: number2)
print(result)

// Overloading Funtions
/*
when a func writteen nmore than one but takes parameters and changes it.
*/

//adding 1+2+3+4+5+6....n
var result2 = 0

for x in 0...11 {
    result2 += x
}

print(result2)

//----------------------------------------

func computeBonusDamage(baseDamage: Int) -> Int{
  print("Base Damage  multiplyed by four")
  return baseDamage * 4
}

// Functions as parameters
func dealDamage(baseDamage: Int, bonusDamage: (Int) -> Int){
  let bonus = bonusDamage(baseDamage)
  print("Base Damage= \(baseDamage)\nBonus Damage \(bonus)")
}

//baseDamage == 55, and to calculate bonusDamage, function calls computeBonusDamage function. It multipleys baseDamage by 4.  And It becomes bonusDamage. WOOOW It's great.
dealDamage(baseDamage: 55, bonusDamage: computeBonusDamage)

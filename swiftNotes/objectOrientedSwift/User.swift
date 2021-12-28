
//important
enum UserType{
  case AdminUser
  case NormalUser
  case UnauthorizedUser
}

class User {
  var name : String  
  var age : Int 
  var job : String 
  var type : UserType
  private var hairColor : String = "Black"

/*
  //initalizer called every objected created
  init(nameInput : String, ageInput: Int, jobInput: String){
    print("initCalled")
    name = nameInput
    age = ageInput
    job = jobInput
  }
  */

   init(name : String, age: Int, job: String, type : UserType){
    print("initCalled")
    self.name = name
    self.age = age
    self.job = job
    self.type = type
  }

  func exampleFunc(){
    print("exampleFunction runned")
  }

  //can see hair color but wont change
  func hairColorFunc() -> String{
    return self.hairColor
  }
}
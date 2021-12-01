//inheritance takes from User's informations
class SpecialUser : User{
  func newFunc(){
    print("new function from inheritance")
  }

  //ıt chances examplefunc
  override func exampleFunc(){
    //super comes from orginally function
    super.exampleFunc()
    print("new overrided function")
  }
}
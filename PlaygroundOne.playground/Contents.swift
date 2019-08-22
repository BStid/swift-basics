import UIKit

//SemiColons are not required
var str = "Hello, playground"
var number = 23
let nextNum = 7
var boolean = true
var IntArray = [0,1,2,3,4]
var StrArray = ["Zero", "One", "Two"]

//Type Inferences

var typeStr: String
var typeInt: Int
var typeFloat: Float
var typeBool: Bool
var typeIntArray: [Int] = []
var typeStrArray: [String] = []

let numResult = number + nextNum

//If Else
//Parenthensis are not required
//Curly Braces are required

if numResult == 30{
    print(boolean)
}else{
    print(!boolean)
}

//switch statement
let volcanoExplosivityIndex: Int
volcanoExplosivityIndex = 3

switch volcanoExplosivityIndex{
case 0:
    print("Effusive")
case 1:
    print("Gentle")
    print("You can add more than one line under the case")
case 2:
    print("Explosive")
case 3...8:
    print("Catastrophic")
default:
    print("Not a recognized index.")
}

// Range Operator = "..."
// Range from start to finish. Example: 1...10
// *This only goes up*

// Closed Range Operator = "1..<10"
// Go from the starting position (1) to the ending position - 1 (9)

// stride

//Loops
//While Loop

let bunchOfWords = ["Word", "Next", "Another", "One More"]
for word in bunchOfWords{
    print(word)
}

let bunchOfNumbers = [0,1,2,3,4,5,6]
for num in bunchOfNumbers {
    print(num)
}

for num in stride(from: 0, through: 256, by: 16){
    print(num)
}
for num in stride(from: 100, through: 0, by: -5){
    print(num)
}


//Interpolation
var movie = "Movie"
var author = "Me"
var length = 2

let message = "Now playing \(movie) by \(author) which is \(length) hours long."

// Functions
// Parenthensis are required in functions
// Function parameters are constants, and immutable by default
func showMessage(){
    print("The function has been called and works.")
}
showMessage()

func showMessageWithNumber(number: Int){
    print("The function works with the number \(number)")
}
showMessageWithNumber(number: 42)

//Functions returning values. Return type...
func basicFunction () -> String {
    let str = "This is a simple function."
    print(str)
    return str
}
let result = basicFunction()

// If the function does not return anything...
func nonReturningFunction () -> Void {
    
}

//A function that returns a value, but you choose to ignore it.

_ = basicFunction() // The underscore is used to ignore any value that is being returned and you choose not to use it
// Removing name types with underscore

func ignoredVariableName(_ notRequiredVarName: Int, requiredVarName: Int) -> Int{
    return notRequiredVarName + requiredVarName
}
ignoredVariableName(35, requiredVarName: 22)


// Enumeration
enum MediaType{
    case book
    case movie
    case music, game
}
var itemType: MediaType
itemType = MediaType.game
itemType = .music

switch itemType{
case .movie:
    print("I've been watching \(itemType)")
case .book:
    print("I've been reading \(itemType)")
case .music:
    print("I've been listening to \(itemType)")
case .game:
    print("I've been playing \(itemType)")
}

enum BottleSize: String{
    case half = "37.5 cl"
    case standard = "75 cl"
    case magnum = "1.5 litres"
}
var myBottle: BottleSize = .magnum
print("Your \(myBottle) is \(myBottle.rawValue)")

enum MediaTypeee{
    case movie(String)
    case music(Int)
    case book(String)
}
var firstItem: MediaTypeee = .movie("Comedic")
var secondItem: MediaTypeee = .music(13)

switch firstItem{
case .movie(let genre):
    print("It's a \(genre) movie")
case .music(let bpm):
    print("The music is \(bpm) beats per minute")
case .book(let author):
    print("It's by \(author)")
}

// Structures
struct Movie {
    //properties
    var title: String
    var director: String
    var releaseYear: Int
    var genre: String
    
    //methods
    func summary() -> String {
        return "\(title) is a \(genre) film released in \(releaseYear) by \(director)"
    }
}

var firstMovie = Movie(title: "First Movie", director: "I am the director", releaseYear: 2019, genre: "Comedy")

print(firstMovie.director)
print(firstMovie.summary())

//Dictionaries

var airlines = ["SWA": "Southwest Airlines", "BAW": "British Airways", "BHA": "Buddha Air", "CPA": "Cathay Pacific"]

//use [] to look up a key
if let airlineResult = airlines["SWA"]{
    print(airlineResult)
}else{
    print("No match found.")
}

//add or change in the dict
airlines["DVA"] = "Discovery Airlines"

// remove by setting to nil
airlines["BHA"] = nil

for (key,value) in airlines{
    print("\(key) -> \(value)")
}
//Dictionary of String keys and String values
var periodicElements: [String:String]
//Diction ary Int Keys and String Values
var employees: [Int: String]

//Tuples
//Returning a tubple from a function

func randomAlbum() -> (albumTitle: String, length: Int) {
    // ...code goes here
    
    let title = "And Here Is The Title..."
    let duration = 2462
    
    return (title, duration)
}
//...later
let (nextTitle, lengthOfSong) = randomAlbum()
print("nextTitle", nextTitle)
print("length", lengthOfSong)

//Closures
//"Closures let us take lines of code and group it together to use elsewhere in our program"
// You write a function because you have a block of code you want to call
// You write a closure because you have a block of code you intend to pass

//let ageSortedBooks = allBooks.sorted(by: {
//    (firstBook: Book, secondBook: Book) -> Bool
//    in
//    if firstBook.readingAge <= secondBook.readingAge{
//        return true
//    }else{
//        return false
//    }
//})

//Another Form...

// let ageSortedBooks = allBooks.sorted{$0.readingAge <= $1.readingAge}
// let booksForUnder10s = allBooks.filter {$0.readingAge < 10}


//Classes
class Appliance{
    //properties
    var manufacturer: String
    var model: String
    var voltage: Int
    var capacity: Int?
    
    //Runs any empty init methods first
    init(){
        self.manufacturer = "default manufacturer"
        self.model = "default model"
        self.voltage = 120
    }
    // you can add additional init methods, but they have to have different parameteres
    init(withVoltage: Int){
        self.manufacturer = "default manufacturer"
        self.model = "default model"
        self.voltage = withVoltage
    }
    //deinitializer - takes no parameters and no values - only allowed in Classes
    deinit{
        //Perform clean up code here
        //Release a file resource...
        //Release a network resource...
    }
    //methods
    func getDetails() -> String {
        var message = "This is the \(self.model) from \(self.manufacturer)."
        if self.voltage >= 220{
            message += " This model is for European usage."
        }
        return message
    }
}
var cafetiere = Appliance(withVoltage: 220)
cafetiere.manufacturer = "Megaappliance EU"
cafetiere.model = "Electronics"
print(cafetiere.getDetails())
var kettle = Appliance()
kettle.manufacturer = "Megaappliance, Inc"
kettle.model = "TeaMaster 5000"
kettle.voltage = 220
print(kettle.getDetails())

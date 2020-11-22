import Foundation
 
// Part 1
 
// Given string with format "Student1 - Group1; Student2 - Group2; ..."
 
let studentsStr = "Бортнік Василь - ІВ-72; Чередніченко Владислав - ІВ-73; Гуменюк Олександр - ІВ-71; Корнійчук Ольга - ІВ-71; Киба Олег - ІВ-72; Капінус Артем - ІВ-73; Овчарова Юстіна - ІВ-72; Науменко Павло - ІВ-73; Трудов Антон - ІВ-71; Музика Олександр - ІВ-71; Давиденко Костянтин - ІВ-73; Андрющенко Данило - ІВ-71; Тимко Андрій - ІВ-72; Феофанов Іван - ІВ-71; Гончар Юрій - ІВ-73"
 
// Task 1
// Create dictionary:
// - key is a group name
// - value is sorted array with students
 
var studentsGroups: [String: [String]] = [:]
 
// Your code begins
 
let by_students = studentsStr.split(separator: ";")     // Separating students with their groups
 
var students_by_group: [[String]]
students_by_group = []
for student in by_students {
   students_by_group += [student.components(separatedBy: " - ")]   // Separating students from their groups
}                                                                   // It's not necessary but creates a better data base
 
var iv_73: [String] = []                // Creating arrays for the groups
var iv_72: [String] = []
var iv_71: [String] = []
 
for person in students_by_group{        // Checking which group does the person belongs to and adding them to correct bunch
   if person[1] == "ІВ-73"{
       iv_73.append(person[0])
   }
   else if person[1] == "ІВ-72"{
       iv_72.append(person[0])
   }
   else if person[1] == "ІВ-71"{
       iv_71.append(person[0])
   }
   else{
   print("Unexpected group name")
   }
}
 
studentsGroups["ІВ-73"] = iv_73         // Adding students with same group to the dictionary
studentsGroups["ІВ-72"] = iv_72
studentsGroups["ІВ-71"] = iv_71
 
// I guess this task can be done by checking which group does the student belong to
// after my first separation and immediately adding them to the dictionary. But I stayed with this
 
// Your code ends
 
print(studentsGroups)
print()               
  
 
 
 
// Given array with expected max points
 
let points: [Int] = [5, 8, 12, 12, 12, 12, 12, 12, 15]
 
// Task 2
// Create dictionary:
// - key is a group name
// - value is dictionary:
//   - key is student
//   - value is array with points (fill it with random values, use function randomValue(maxValue: Int) -> Int )
 
func randomValue(maxValue: Int) -> Int {
   //switch(arc4random_uniform(6)) {
   switch(Int.random(in: 1..<6)) {   // I'm using an online complier so I had to switch random function
   case 1:
       return Int(ceil(Float(maxValue) * 0.7))
   case 2:
       return Int(ceil(Float(maxValue) * 0.9))
   case 3, 4, 5:
       return maxValue
   default:
       return 0
   }
}
 
var studentPoints: [String: [String: [Int]]] = [:]
 
// Your code begins
 
// I'll be using some results from Task 1
 
func get_points() -> [Int] {        // Creating a function to get points for students
   var evaluated: [Int] = []
   for point in points{
       evaluated.append(randomValue(maxValue: point))
   }
   return evaluated
}
 
var iv_73_points: [String: [Int]] = [:]        // Basically making a new dict with points for each student
var iv_72_points: [String: [Int]] = [:]       
var iv_71_points: [String: [Int]] = [:]       
 
for i in 0...(iv_73.count - 1) {
   iv_73_points[iv_73[i]] = get_points()
}
for i in 0...(iv_72.count - 1) {
   iv_72_points[iv_72[i]] = get_points()
}
for i in 0...(iv_71.count - 1) {
   iv_71_points[iv_71[i]] = get_points()
}
 
studentPoints["ІВ-73"] = iv_73_points          // Adding dict with students with their points   
studentPoints["ІВ-72"] = iv_72_points
studentPoints["ІВ-71"] = iv_71_points
 
// Your code ends
 
print(studentPoints)
print()
 
// Task 3
// Create dictionary:
// - key is a group name
// - value is dictionary:
//   - key is student
//   - value is sum of student's points
 
var sumPoints: [String: [String: Int]] = [:]
 
// Your code begins
 
var iv_73_sums: [String: Int] = [:]   
var iv_72_sums: [String: Int] = [:]  
var iv_71_sums: [String: Int] = [:]  
 
for i in 0..<iv_73_points.count {                                   // Adding all points
   iv_73_sums[iv_73[i]] = (iv_73_points[iv_73[i]]!).reduce(0, +)
}
 
for i in 0...1 {
   iv_72_sums[iv_72[i]] = (iv_72_points[iv_72[i]]!).reduce(0, +)
}
 
for i in 0..<iv_71_points.count {
   iv_71_sums[iv_71[i]] = (iv_71_points[iv_71[i]]!).reduce(0, +)
}
 
sumPoints["ІВ-73"] = iv_73_sums
sumPoints["ІВ-72"] = iv_72_sums
sumPoints["ІВ-71"] = iv_71_sums
 
// Your code ends
 
print(sumPoints)
print()
 
// Task 4
// Create dictionary:
// - key is group name
// - value is average of all students points
 
var groupAvg: [String: Float] = [:]
 
// Your code begins
 
groupAvg["ІВ-73"] = Float((iv_73_sums.values).reduce(0, +)) / Float(iv_73_sums.count)   // Get all the values from students
groupAvg["ІВ-72"] = Float((iv_72_sums.values).reduce(0, +)) / Float(iv_72_sums.count)   // Divide by the number of students
groupAvg["ІВ-71"] = Float((iv_71_sums.values).reduce(0, +)) / Float(iv_71_sums.count)   // Also made the value precise by casting float everywhere
 
// Your code ends
 
print(groupAvg)
print()
 
// Task 5
// Create dictionary:
// - key is group name
// - value is array of students that have >= 60 points
 
var passedPerGroup: [String: [String]] = [:]
 
// Your code begins
 
var iv_73_passed: [String] = []
var iv_72_passed: [String] = []
var iv_71_passed: [String] = []
 
for student in iv_73_sums{                 // Checking if students pass the line
   if student.value >= 60{
       iv_73_passed.append(student.key)
   }
}
for student in iv_72_sums{             
   if student.value >= 60{
       iv_72_passed.append(student.key)
   }
}
for student in iv_71_sums{             
   if student.value >= 60{
       iv_71_passed.append(student.key)
   }
}
 
passedPerGroup["ІВ-73"] = iv_73_passed
passedPerGroup["ІВ-72"] = iv_72_passed
passedPerGroup["ІВ-71"] = iv_71_passed
 
// Your code ends
 
print(passedPerGroup)
 
// Example of output. Your results will differ because random is used to fill points.
//
//["ІВ-73": ["Гончар Юрій", "Давиденко Костянтин", "Капінус Артем", "Науменко Павло", "Чередніченко Владислав"], "ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-71": ["Андрющенко Данило", "Гуменюк Олександр", "Корнійчук Ольга", "Музика Олександр", "Трудов Антон", "Феофанов Іван"]]
//
//["ІВ-73": ["Давиденко Костянтин": [5, 8, 9, 12, 11, 12, 0, 0, 14], "Капінус Артем": [5, 8, 12, 12, 0, 12, 12, 12, 11], "Науменко Павло": [4, 8, 0, 12, 12, 11, 12, 12, 15], "Чередніченко Владислав": [5, 8, 12, 12, 11, 12, 12, 12, 15], "Гончар Юрій": [5, 6, 0, 12, 0, 11, 12, 11, 14]], "ІВ-71": ["Корнійчук Ольга": [0, 0, 12, 9, 11, 11, 9, 12, 15], "Музика Олександр": [5, 8, 12, 0, 11, 12, 0, 9, 15], "Гуменюк Олександр": [5, 8, 12, 9, 12, 12, 11, 12, 15], "Трудов Антон": [5, 0, 0, 11, 11, 0, 12, 12, 15], "Андрющенко Данило": [5, 6, 0, 12, 12, 12, 0, 9, 15], "Феофанов Іван": [5, 8, 12, 9, 12, 9, 11, 12, 14]], "ІВ-72": ["Киба Олег": [5, 8, 12, 12, 11, 12, 0, 0, 11], "Овчарова Юстіна": [5, 8, 12, 0, 11, 12, 12, 12, 15], "Бортнік Василь": [4, 8, 12, 12, 0, 12, 9, 12, 15], "Тимко Андрій": [0, 8, 11, 0, 12, 12, 9, 12, 15]]]
//
//["ІВ-72": ["Бортнік Василь": 84, "Тимко Андрій": 79, "Овчарова Юстіна": 87, "Киба Олег": 71], "ІВ-73": ["Капінус Артем": 84, "Науменко Павло": 86, "Чередніченко Владислав": 99, "Гончар Юрій": 71, "Давиденко Костянтин": 71], "ІВ-71": ["Корнійчук Ольга": 79, "Трудов Антон": 66, "Андрющенко Данило": 71, "Гуменюк Олександр": 96, "Феофанов Іван": 92, "Музика Олександр": 72]]
//
//["ІВ-71": 79.333336, "ІВ-72": 80.25, "ІВ-73": 82.2]
//
//["ІВ-72": ["Бортнік Василь", "Киба Олег", "Овчарова Юстіна", "Тимко Андрій"], "ІВ-73": ["Давиденко Костянтин", "Капінус Артем", "Чередніченко Владислав", "Гончар Юрій", "Науменко Павло"], "ІВ-71": ["Музика Олександр", "Трудов Антон", "Гуменюк Олександр", "Феофанов Іван", "Андрющенко Данило", "Корнійчук Ольга"]]


// Dictionary

typealias StringIntDictionary = \[String:Int]

// Dictionary 선언 방법들
var numberForName1: Dictionary<string, int> = Dictionary<String, int>()
var numberForName2: [String:Int] = [String,int]()
var numberForName3: StringIntDictionary = StringIntDictionary()
var numberForName4: [String:Int] = \[:]

var numberForName: [String : Int] = ["1학년" : 40, "2학년" : 35, "3학년" : 35]

print(numberForName["1학년"]!)       // 40

numberForName["2학년"] = 50          // 수정
numberForName["4학년"] = 40          // 추가
numberForName.removeValue(forKey: "3학년")  // 삭제

print(numberForName)                // ["4학년": 40, "2학년": 50, "1학년": 40] ( 출력 순서는 랜덤.)




## Swift 언어의 특성

* 객체 지향 프로그래밍 패러다임
  - 컴퓨터 프로그램을 독립된 객체의 모임으로 객체 사이에서 메시지를 주고 받는 방식으로 처리함
  - Class, Object, Method 등을 차용
  - 상속 가능, 코드의 재사용성이 용이함
</br>

* 함수형 프로그래밍 패러다임
  * 프로그램이 상태의 변화 없이 데이터 처리를 수학적 함수 계산으로 취급함
  * 대규모 병렬처리가 용이함: Multiprocessing 환경에 적합
</br>

* 프로토콜 지향
  * 특정 역할을 수행하기 위해 Method, Property, 기타 요구사항을 준수하도록 요구함
</br>

## Basic Data Type

* Int and Uint
  * `let maxInt: Int = Int.max` 
* Bool
  * `let boolean: Bool = true` 
* Float and Double
  * `let pi: Float = 3.14` 
  * `let double: Double = 2.78` 
* Character
  * `let alphabetA: Character = "A"` 
* String
  * `let name: String = "Seung-Seok Kang"` 
* Any, AnyObject, and nil
  * `All Data Type, Class Instance, and nothing` 
</br>

## Tuple

* 프로그래머 마음대로 만드는 타입 -> 지정된 데이터 묶음
  * 데이터의 개수는 정해져 있지 않음
  * var person: (String, Int, Double) = ("Kang", 65, 172)
  * print("이름: \(person.0) 체중: \(person.1) 키: \(person.2)")

* Tuple에 이름 지정 가능
  * var person2: (name: String, weight: Int, height: Double) = ("Kang", 65, 172)
  * print("이름: \(person2.name) 체중: \(person2.weight) 키: \(person2.height)")
  * person2.weight = 100 

* [Tuple Quiz](https://github.com/ERIN56/iOS-STUDY/blob/master/SWIFT/Tuplequiz.swift)
</br>

## Collection Type

* Array(배열)
  * 같은 타입의 데이터를 일렬로 순서대로 저장
  * Swift의 배열은 C 또는 Java의 배열과 달리 연결리스트(Linked List) 구조로 되어 있음
  * 인덱스를 통해 접근하며 0부터 시작
* [Dictionary](https://github.com/ERIN56/iOS-STUDY/blob/master/SWIFT/dictionary.swift) 
  * 요소들이 순서 없이 Key와 Value의 쌍을 구성됨
  * Key 는 Dictionary 안에서 유일해야 함
  * Value는 유일하지 않아도 상관 없음
  * Value는 Key를 통해서만 접근 가능
* [Set(집합)](https://github.com/ERIN56/iOS-STUDY/blob/master/SWIFT/set.swift)
  * 같은 타입의 자료를 순서 없이 하나의 묶음을 저장
  * 각 값은 유일한 값을 가짐
</br>

## [Enumeration(열거형)](https://github.com/ERIN56/iOS-STUDY/blob/master/SWIFT/enumeration.swift)

* 연관된 항목을 묶어서 표현할 수 있는 타입
  * 프로그래먹 정의해주 값 이외에는 추가/수정 불가
```
enum School {    
  case elementary     
  case middle   
  case high   
  case university    
} 
```
</br>

## 흐름 제어(Flow Control) : If
* if {} else {}
  * 소괄호 ()는 생략 가능하나 중괄호 {}는 생략 불가
  * if 구문은 조건의 값이 반드시 Bool 타입이어야 함

```
let first:Int = 5
let second: Int = 7

if first > second {
  print("first > second")
}
else if first < second {
  print("first < second")
else {
  print("first == second")
}
```
</br>

## 흐름 제어(Flow Control) : Switch

* 선언된 변수의 값에 따라 해당 case 문장이 실행됨
  * case 내부의 코드를 모두 실행하면 break 없이 종료됨
  * case를 연속해 실행하려면 fallthrough 키워드 사용

```
let intValue = 8

switch intValue {
  case 0:
      print("value == zero")
  case 1...10:
      print("value == 1~10")
      fallthrough
  case Int.min ..< 0, 101 ..< Int.max:
      print("Value < 0 or Value > 100")
  default:
      print("10 < Value <= 100")
 }
 ```
 </br>
 
 ## 흐름 제어(Flow Control) : wile card 식별자
```
typealias NumberName = (number: Int, name: String)

let tupleValue: NumberName = (23, "Kim")

switch tupleValue {
case(23, "Kim"):
    print("정확히 맞았습니다.")
case(_, "Kim"):
    print("이름만 맞았습니다. 숫자는 \(tupleValue.number) 입니다")
case(23, _):
    print("숫자만 맞았습니다. 이름은 \(tupleValue.name) 입니다.")
default:
    print("정확히 입력해 주세요")
}
```
</br>

## 함수
```
func 함수이름 (매개변수, ...) -> 반환 타입 {
    실행 구문
    return 반환 값
}
```

```
func addTwoNumbers(first: Int, second: Int) -> Int {
  return first + second
}

print(addTwoNumbers(first: 12, second: 3)         // 15

func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}

print(sayHello(myName: "갑돌이", yourName: "갑순이))

```

```
func 함수이름 (전달인자레이블 매개변수이름: 매개변수타입, ...) -> 반환타입 {
    실행 구문
    return 반환 값
}
```

```
func sayHello2(from myName: String, to yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}
print(sayHello2(from: "갑돌이", to: "갑순이))

func sayHello3(_ myName:String, _ yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}
print(sayHello3("갑돌이", "갑순이"))
```
</br>

## 전달인자로서의 함수
```
func addVAT(source: Double) -> Double {
    return source * 1.1
}

var additional: (Double) -> Double
additional = addVAT

let todayTransaction = 12.7
let todayPrice = additional(todayTransaction)
print(todayPrice)

func finalPrice(source: Double, process: (Double) -> Double) -> Double {
    let price = process(source)
    return price
}

let priceTomorrow = finalPrice(source: 350.0, process: addVAT)
print(priceTomorrow)              // 385.00000000000006
```
</br>

## 함수를 반환하는 함수
```
func makeAdder(x: Int) -> (Int) -> Int {
  func adder(a: Int) -> Int {
      return a + x
  }
  return adder
}

let add5 = makeAdder(x: 5)
let add10 = makeAdder(x: 10)

print(add5(2))
print(add10(2))
```
</br>

## 옵셔널: Optional
- 안전성(safety)을 문법적으로 담보하는 기능
  - 변수나 상수에 값이 반드시 있지 않을 수도 있음
  - 변수 또는 상수의 값이 nil일 수도 있다
  - 옵셔널과 옵셔널이 아닌 값은 철저히 다른 타입으로 인식함
  - nil을 할당하고자 할 경우 반드시 옵셔널 변수/상수 이어야 함
  - 타입 뒤에 '?' 을 붙여 옵셔널 변수임을 선언함

```
var myName: String = "Kang"
print(myName)
my Name = nil       // 오류 

var yourName: String? = "Kim"
print(yourName)     // 출력 값 : Optional("Kim")

yourName = nil
print(yourName)
```

## Forced Unwrapping: 옵셔널 강제추출
- 옵셔널 값을 추출하는 간단하지만 위험한 방법
  - Runtime Error로 프로그램이 종료될 수 있음
  - 옵셔널 값의 뒤에 '!'를 붙이면 옵셔널 값을 강제로 추출함
  - nil 값이 강제 추출되는 경우 runtime error 발생

```
var personA: String?
var personB: String

personA = "Kang"
personB = personA         // error
personB = personA!        // forced unwrapping

personA = nil
personB = personA!        // error

if personA != nil {
    print("The name is \(personA)")
} else {
    print("The name is nil")
}
```

## Optional Binding
- 옵셔널 변수의 값이 nil인지 확인하고 강제로 추출하는 방식은 기존의 언어에서와 유사함
  - 옵셔널의 의미도 사라짐 (권유 x)
- 옵셔널 변수에 값이 있는지 확인할 때 사용함
  - 값이 있다면 옵셔널에서 추출된 값을 일정 블록 안에서 상수나 변수에 할당하여 옵셔널이 아닌 형태로 사용

```
var univName: String?
var collegeName: String = ""
univName = "SWU"

if let name = univName {
    collegeName = name
}

print(collegeName)
```
</br>

## class
```
class Car{
    var maker: String
    var year: Int
    var mileage: Double

    init(maker: String, year: Int, mileage: Double){
        self.maker = maker
        self.year = year
        self.mileage = mileage
    }

    func getMileage() -> Double {
        return mileage
    }
}

let myCar = Car(maker: "Hyundai", year: 2017, mileage: 3000)
let myMileage = myCar.getMileage()

print("Maker: \(myCar.maker), Year: \(myCar.year), Mileage: \(myCar.mileage)")
print(myMileage)
```
</br>

## struct
```
struc BasicInfo {
    var name: String
    var age: Int
    
    func howOld() -> Int {
        return age
    }
}

var hong: BasicInfo = BasicInfo(name: "Hong", age: 24)
print(hong.howOld())
hong.age = 26
hong.name = "kildong"
print(hong.howOld())

let lee: BasicInfo = BasicInfo(name: "Lee", age: 35)
lee.age = 45              // error (lee가 var로 선언되어 있어야 함)
```
</br>

## Class vs Struct
- 공통점
  - 값 저장을 위해 property(변수)를 정의할 수 있음
  - 기능 수행을 위해 method(함수)를 정의할 수 있음
  - 초기화될 떄 상태 저장을 위해 init()을 정의할 수 있음
  - 특정 기능을 준수하기 위해 특정 프로토콜을 준수할 수 있음

- 차이점
  - 구조체는 상속할 수 없음
  - 타입캐스팅은 클래스의 인스턴스에만 허용
  - 디이니셜라이저는 클래스의 인스턴스에만 활용
  - Reference Counting은 클래스의 인스턴스에만 적용
</br>

## struct and class 
- struct은 값을 복사해 독립적인 기억장소를 가짐

```
struct BasicInfo {
    var name: String
    var age: Int
}

var hong: BasicInfo = BasicInfo(name: "Hong", age: 24)
hong.age = 26

var lee: BasicInfo = hong                 // 복사 할당

print("Hong's age: \(hong.age)")          //Hong's age: 26
print("Lee's age: \(lee.age)")            //Lee's age: 26

lee.age = 32

print("Hong's age: \(hong.age)")          //Hong's age: 26
print("Lee's age: \(lee.age)")            //Lee's age: 32
```
</br>

## struct and class
- class 는 기억장소를 참조해 연관된 기억장소를 가짐

```
class Person{
    var name: String
    var age: Int
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
}

var kang: Person = Person(name: "Kang", age: 27)
kang.age = 27

var park: Person = kang

print("Kang's age: \(kang.age)")          //Kang's age: 27
print("Park's age: \(park.age)")          //Park's age: 27

park.age = 33

print("Kang's age: \(kang.age)")          //Kang's age: 33
print("Park's age: \(park.age)")          //Park's age: 33
```
</br>

## Closure(클로저)
- 일정 기능을 하는 코드를 하나의 블록으로 모아놓은 것
- 기본 형식
```
{ (매개변수들) -> 반환 타입 in
    실행 코드
}
```

- 클로저의 축약
  - 매개변수와 반환 값의 타입을 유추할 수 있으므로 매개변수와 반환 값의 타입을 생략할 수 있음
  - 단 한 줄의 표현만 한다면 이를 반환 값으로 취급해서 return 구문을 생략할 수 있음
  - 축약된 전달인자 이름을 사용할 수 있음 ($0, $1)
</br>

## Closure
```
func addVAT(source: Double) -> Double {
    return source * 1.1
}

var price1 = addVAT(source: 300.0)

let addVATClosure1 = {
    (source:Double) -> Double in
    return source * 1.1
}

price1 = addVATClosure1(300.0)

let addVATClosure2 = {      // 매개변수 타입, 반환 타입 생략
    source in
    return source * 1.1
}

let addVATClosure3 = {      // return 구문 생략
    source in
    source * 1.1
}

let addVATClosure4 = { $0 * 1.1 }   // 축약된 전달인자 이름 사용 ($0, $1)
```
</br>


> 출처 - 서울여자대학교 디지털미디어학과 모바일앱 프로그래밍 수업

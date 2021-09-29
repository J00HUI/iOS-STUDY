// Tuple Quiz 1

typealias Menu = (Name:String, Time: Int, Price: Int)

let Menu01: Menu = ("아메리카노", 5, 3800)
let Menu02:Menu = ("카페라떼", 5, 4500)
let Menu03:Menu = ("카페모카", 5, 5000)
let Menu04:Menu = ("카라멜마끼아또", 5, 5000)
let Menu05:Menu = ("에스프레소", 5, 4000)
let Menu06:Menu = ("망고스무디", 5, 6000)
let Menu07:Menu = ("복숭아아이스티", 5, 4500)
let Menu08:Menu = ("레모네이드", 5, 4500)
let Menu09:Menu = ("샌드위치", 3, 4000)
let Menu10:Menu = ("베이글", 1, 1500)

1. 위 메뉴 중 가격이 4000원 이상인 메뉴의 이름을 순서대로 출력해 주세요.
2. 모든 음료 가격의 평균을 구하세요
3. 가장 빨리 만들 수 있는 메뉴를 구하세요
4. 가장 빨리 만들 수 있는 메뉴를 구하세요


// Answer
//1.  위 메뉴 중 가격이 4000원 이상인 메뉴의 이름을 순서대로 출력해 주세요.
for (name, time, price) in MenuList {
  if price >= 4000 {
    print(name)
  }
}


//2. 모든 음료 가격의 평균을 구하세요
var sum = 0.0
var average = 0.0

for (name, time, price) in MenuList{
    sum += Double(price)
}
average = sum / Double(MenuList.count)
print(average)


//3. 가장 빨리 만들 수 있는 메뉴를 구하세요
var fastFood = ""
var quickTime = Int.max

for (name, time, price) in MenuList{
    if time < quickTime{
        fastFood = name
        quickTime = time
    }
}

print("가장 빨리 만들 수 있는 메뉴는 \(quickTime)분이 소요되는 \(fastFood)입니다")


// 4. 가장 빨리 만들 수 있는 메뉴를 구하세요
var expense:Int = Int.min
var expenseFood = ""

for (name, time, price) in MenuList {
    if price > expense {
        expenseFood = name
        expense = price
    }
}

print("가장 비싼 메뉴는 \(expense)원인 \(expenseFood)입니다.")



// Tuple Quiz 2

typealias car = (model: String, brand: String, country: String, costEok: Double)

let car1: car = ("R8", "Audi", "Germany", 2.2)
let car2: car = ("modelS", "Tesla", "USA", 1.1)
let car3: car = ("SLRmaclaren", "Benz", "Germany", 12)
let car4: car = ("F-Type", "Jaguar", "UK", 1)
let car5: car = ("ghibil", "maserati", "Italy", 1)
let car6: car = ("db11", "AstonMartin", "UK", 2.2)
let car7: car = ("A7", "Audi", "Germany", 0.8)
let car8: car = ("eq900", "Genesis", "Korea", 0.8)
let car9: car = ("leggera", "Koenizsegg", "Sweden", 22)
let car10: car = ("GTR", "Nissan", "Japan", 1.6)

let cars: [car] = [car1, car2, car3, car4, car5, car6, car7, car8, car9, car10]
let sampleCar: car


// 10억이 넘는 모든 모델의 전체 항목을 출력하세요
// 독일에서 만들어진 모든 모델의 전체 항목을 출력하세요
// 가장 비싼 차의 전체 항목을 출력하세요
// 모델명에 숫자가 들어간 모든 영국 브랜드의 전체 항목을 출력하세요







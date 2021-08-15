var Nmae = "Ho-Jeong"
var score = 100

1) 변수 선언과 동시에 값을 입력한 배열을 만드는 방법
var name: [String] = ["슈퍼맨", "베트맨", "캡틴", "아이언맨", "스파이더맨"]
var score: [Int] = [100, 80, 95, 98, 86]

var name = ["슈퍼맨", "베트맨", "캡틴", "아이언맨", "스파이더맨"]
var score = [100, 80, 95, 98, 86]

2) 빈 배열을 선언하고 값을 추가하는 방법
var name = [String]()
var score = [Int]()

name.append("슈퍼맨")
name.append("배트맨")
...

score.append(100)
score.append(80)
...

1)처럼 배열을 만들어도 나중에 2)와 같이 append 메서드로 추가할 수 있습니다.
배열을 선언했으면 이제 배열 값을 접근하는 방법을 알아보겠습니다. 접근한다는 의미는 배열 값을 읽어오거나 변경한다는 의미입니다.

let someoneNmae = name[0]
name[1] = "홍길동"

let someScore = score[2]
score[3] = 60


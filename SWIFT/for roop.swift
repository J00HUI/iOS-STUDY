for 변수 in Range {
  ...
}


Range 를 설정하는 방법은 다음과 같습니다.

1. 0부터 9까지 반복하면서 print(i)를 출력합니다.
즉, 0부터 9까지 출력합니다.

for i in 0...9 {
  print(i)
}

2. i를 0부터 10보다 작을 동안 반복하면서 print(i)를 출력합니다.
즉, 0부터 9까지 출력합니다.

for i in 0..<10 {
  print(i)
}


+)
변수 사용 X

var result: Int = 1
for _ in 1...3 {
    result *= 10
}

print("10의 3제곱은 \(result) 입니다.")                  // 10의 3제곱은 1000 입니다.


String

let helloSwift: String = "Hello Swift!"
for char in helloSwift {
    print(char)
}

// H
// e
// l
// l
// o
 
// S
// w
// i
// f
// t
// !

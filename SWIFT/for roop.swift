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

### while 루프는 for 루프와 어떻게 다른가요?
for 루프와 비슷한 구문으로 while 루프를 살펴보겠습니다.   
for 루프는 정해진 횟수만큼 특정 구문을 반복하지만, while 루프는 주어진 조건식이 false가 될 때까지 특정 구문을 반복하는 제어문입니다.    
</br>

```
while <조건식> {
  [ 수행할 구문 ]
}
```
</br>

ex)   
```
while i<10 {
  print("2 x \(i) = \(2*i)")
  i = i + 1
}
```
<br>

ex2)
```
var names: [String] = ["Lee", "Choi", "Kang", "Kim"]

while names.isEmpty == false {
    print("Good bye \(names.removeLast())")
}
```
// Good bye Kim   
// Good bye Kang    
// Good bye Choi    
// Good bye Lee    
<br>
<br>

repeat
```
names = ["Lee", "Choi", "Kang", "Kim"]

repeat {
    print("Good bye \(names.removeFirst())")
} while names.isEmpty == false
```
// Good bye Lee   
// Good bye Choi   
// Good bye Kang   
// Good bye Kim    

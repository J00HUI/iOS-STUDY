### 🐦 익명 함수란?
일반적인 함수의 경우 func 키워드와 함수 이름을 선언하고 사용하지만, 효율적인 코드를 작성하기 위해 함수 이름을 선언하지 않고 바로 함수 몸체만 만들어 사용하는 일회용 함수를 **익명 함수** (Anonymous Functions) 혹은 **클로저** (Closure)라고 합니다.
</br>
</br>

ex)   
```
let offAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default, hander: {
    ACTION in self.lampImg.image = self.imgOff
    self.isLampOn = false
})
```
*Chapter06.Alert*</br>

▼   
</br>

```
{
    ACTION in self.lampImg.image = self.imgOff
    self.isLampOn = false
}
```
</br>

---


익명 함수를 작성할 수 있는 구문 예는 다음과 같습니다.</br>
</br>

```
func completeWork(finished: Bool) -> () {           |  completeWork 함수는 Bool 타입의 finished 매개변수를 받아
  print("complet: \(finished)")                     |  출력하는 함수이며, 리턴 타입은 없습니다.
}                                                   |
```
</br>

▼ </br>
</br>

이를 익명 함수 형태로 바꾸면 다음과 같습니다.
```
{                                                   | {
  (finished: Bool) -> () in                         |   (매개변수) -> (반환 타입) in
  print("complete: \(finished)")                    |   실행 구문
}                                                   | }
```
</br>

▼ </br>
</br>

여기서 컴파일러가 반환 타입을 미리 알고 있다면, 반환 타입을 생략할 수 있습니다.   
또한 매개변수의 파라미터 타입도 생략할 수 있습니다.   
```
{                                                   | {
  (finished: Bool) in                               |   (매개변수) in
  print("complete: \(finished)")                    |   실행 구문
}                                                   | }
```
</br>

▼ </br>
</br>

또한 컴파일러가 매개변수의 파라미터 타입을 미리 알고 있다면 이를 생략할 수 있습니다.   
(만약 컴파일러가 finished 변수의 타입을 알고 있다면 왼쪽처럼 쓸 수 있습니다.)   
```
{
  (finished) in
  print("complete: \(finished)")
}
```
</br>

▼ </br>
</br>

파라미터 타입이 생략된 경우, 매개변수의 소괄호 ()를 생략할 수 있습니다.   
```
{                                                   | {
  finished in                                       |   매개변수 in
  print("complete: \(finished)")                    |   실행 구문
}                                                   | }
```
</br>

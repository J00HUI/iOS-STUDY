## 🐦 self란?
self란 보통 클래스나 구조체 자신을 가리킬 때 사용합니다.   

예를 들어 Point 클래스 내부에 x라는 변수가 있다고 합시다.      
그런데, setX 함수는 입력 파라미터로 x를 가지고 있습니다.      
setX 함수 안에서 파라미터의 x 와 클래스 내부의 x 를 구분하기 위해 클래스 내부를 가리키는 self 키워드를 사용합니다.    
self.x는 Point 클래스 내부의 변수를 나타내고, self를 붙이지 않은 x는 setX 함수의 입력 파라미터 x 를 나타냅니다.   
이와 같은 방법은 메서드(함수)에서 동일하게 사용할 수 있습니다.    
또한 self. 함수는 자기 자신의 클래스 함수를 나타냅니다.   

```
class Point{
    var x = 0
    func setX(x:Int) -> () {
      self.x = x
    }
}
```

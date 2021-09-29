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

* Tuple Quiz 1


> 출처 - 서울여자대학교 디지털미디어학과 모바일앱 프로그래밍 수업

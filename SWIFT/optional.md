## 🐦 옵셔널(Optionals) 변수란 무엇일까요?

nil 값을 변수에 할당하면 어떻게 될까요?   
앞의 예제(nil 이란?)를 아래의 코드처럼 수정했을 때 아래와 같은 에러 메시지가 나타납니다.   

```
var flightCode = [
  "oz" : "아시아나항공",
  "ke" : "대한항공",
  "ze" : "이스타항공",
  "lj" : "진에어",
  "7c" : "제주항공",
]
```

```
var flightNumber = "oz"
var flightCompany: String = flightCode[flightNumber]
```
```
결과

error: value of optional type 'String?' not unwrapped; did you mean to use '!' or '?' ?
```

`스위프트에서는 변수에 값을 대입할 때 반드시 nil이 아닌 값을 대입해야 하지만,`   
위의 예제에서는 이전 예제와 같이 flightCompany에 nil 값이 할당될 수 있기 때문에 에러가 발생합니다.   
그렇다면 이럴 때는 어떻게 해야 할까요?   
이때 바로 옵셔널 변수를 사용하는 것입니다.   
옵셔널 타입으로 선언한 변수는 nil 값을 가질 수 있습니다.   

`즉, 옵셔널 변수는 nil 값을 대입할 수 있거나 초깃값을 주지 않아 어떤 값이 들어갈지 모를 때 사용할 수 있습니다.`   

위의 예제는 어떻게 해결해야 할까요?   
만일 어떤 변수에 nil 값을 대입할 수 있다면 옵셔널 변수로 선언해야 합니다.   
즉, 변수의 자료형(위에는 String) 다음에 '?' 를 추가하여 옵셔널 변수라는 것을 선언함으로써 해결할 수 있습니다.   
```
var flightCompany: String? = flightCode[flightNumber]
```
</br>

그렇다면 이렇게 옵셔널로 선언된 변수는 어떻게 사용해야 할까요?  
위의 소스처럼 사용하면 경고 메시지가 나타납니다.   
옵셔널로 선언된 변수에 값이 할당되면, 그 값은 '옵셔널에 래핑(wrapped)되었다'고 하며 이 값은 그냥 사용할 수 없고 아래 소스처럼 '!'를 사용해 강제 언래핑(force unwrapping)하여 값에 접근해야 합니다.   

```
print(flightCompany)        (x)

▼▼▼

print(flightCompnay!)       (o)
```
</br>

반면에 옵셔널 변수는 암묵적인 언래핑(implicity unwrapping)이 되도록 선언할 수 있는데, 이때는 강제 언래핑을 사용하지 않아도 값에 접근할 수 있습니다.   
즉, 변수를 선언할 때 '?' 대신 '!' 를 사용하여 암묵적인 언래핑된 옵셔널 변수로 선언할 수 있습니다.   
이렇게 되면 변수의 값에 접근할 때 '!' 를 사용하지 않아도 됩니다.   

```
var flighNumber = "oz"
var flightCompany: String! = flightCode[flightNumber]

print(flightCompany)
```
</br>
</br>

---

값을 할당해야 하는 곳에 nil 이 들어가면 오류가 발생하므로, 이것을 방지하고자하는 용도.   

옵셔널(?) -> 이거 값이 있을 수도 있고 없을 수도 있어 (래핑)    
옵셔널 변수 뒤에 ! 붙여서 사용 -> 이거 무조건 값 있어 (언래핑)      

변수 선언시 ! 사용 -> 이 변수 무조건 값 있어(암묵적인 언래핑)      


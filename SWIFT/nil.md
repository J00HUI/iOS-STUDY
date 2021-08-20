## 🐦 nil 이란?
스위프트에서 nil은 값이 존재하지 않음을 의미합니다.   

예를 들어 아래와 같이 나열한 flightCode 중 flightNumber "aa"는 존재하지 않으므로 결과로 "항공사 코드 aa는 nil 입니다."를 출력합니다.   
즉, "aa" 의 항공사 코드는 존재하지 않으므로 nil을 표시합니다.   

```
var flightCode = {
    "oz" : "아시아나항공",
    "ke" : "대한항공",
    "ze" : "이스타항공",
    "lj" : "진에어",
    "7c" : "제주항공",
]

flightNumber = "aa"
print("항공사 코드 \(flightNumber)는 \(flightCode[flightNumber]) 입니다.")
``` 
</br>

항공사 코드가 존재하는지 확인하려면 if 문과 nil 문을 활용해서 코드를 작성할 수 있습니다.   
결과는 "없는 항공사 코드입니다."를 출력합니다.   

```
if flightCode[flightNumber] != nil {
    print("항공사 코드 \(flightNumber)는 \(flightCode[flightNumber]!) 입니다. " )
} else {
    print("없는 항공사 코드입ㅂ니다.")
}
```

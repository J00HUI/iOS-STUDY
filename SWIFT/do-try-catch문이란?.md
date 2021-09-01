## 🐦 do-try-catch 문이란?
오류가 발생할 수 있는 함수를 호출할 때는 do-try-catch 문을 사용합니다.   
이 구문이 오류를 잡아 처리해 주기 떄문이죠.    
사용 형식은 다음과 같습니다.   
</br>

```
do {
    try 오류 발생 가능 코드
    오류가 발생하지 않으면 실행할 코드
} catch 오류 패턴 1 {
    처리 구문
} catch 오류 패턴 2 where 추가 조건 {
    처리 구문
} catch {
    처리 구문
}
```  
</br>
</br>

> 오류 타입은 한 개 또는 그 이상도 가능합니다.   
</br>

예를 들어, 나누기 함수의 경우 0으로 나누는 오류가 발생할 수 있습니다.   
이를 적절히 처리해야 하는데, 이때 do-try-catch 문을 사용해 예외로 처리할 수 있습니다.   
</br>
</br>

> 오류가 발생할 수 있는 함수는 "func 함수명(입력 파라미터) throws -> 리턴 파라미터" 형태를 가지며, 이 함수를 호출할 때는 do-try-catch 문을 사용해야 합니다.
</br>

앞의 예제(AVAduioPlayer)에서 사용한 AVAudioPlayer 함수도 AVAudioPlayer(ContentsOf: URL) throws의 형태를 가지는 오류가 발생할 수 있는 함수입니다.

<img width="527" alt="스크린샷 2021-09-01 오후 4 26 09" src="https://user-images.githubusercontent.com/83942393/131629988-ea5ab6b5-9108-4f24-8039-1ea5dc1a9d95.png"></br>
</br>

따라서 AVAudioPlayer(ContentsOf: audioFile) 함수는 입력 파라미터인 오디오 파일이 없을 떄의 에외 처리를 위해 do-try-catch 문을 사용합니다.   
사용하지 않을 경우 아래와 같은 오류가 발생합니다.   

<img width="1147" alt="스크린샷 2021-09-01 오후 4 27 12" src="https://user-images.githubusercontent.com/83942393/131630176-80840728-d0c6-4160-b434-f528932b92d4.png">
</br>
</br>
</br>


## W14 - MapKit

## iOS의 위치 기반 서비스
- iOS는 다음의 인프라를 이용해 사용하는 iOS 기기의 위치를 제공할 수 있다.
    - Cell tower
    - GPS
    - wi-Fi access points(AP)
- 이런 위치 서비스는 Core Location Framework 에서 제공된다.

<img src="https://user-images.githubusercontent.com/83942393/139530351-4e62c0f1-fe9b-4bc0-848f-e7589359bb47.png" width="80%"></img></br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139530361-d4f8f2f2-c126-46a3-a040-2f5b7920a9fa.png" width="80%"></img></br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139530365-af5fa2f9-8d1e-4ef4-bbab-0360a0f927a6.png" width="80%"></img></br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139530368-818dacaa-56e2-4185-aa93-a9181e41d81a.png" width="80%"></img></br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139530372-b62e96cf-97ef-4ff5-a305-644016451151.png" width="80%"></img></br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139530375-1a3ac581-4ac2-4ee5-b489-333c43d884a1.png" width="80%"></img></br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139530379-a8773215-e216-40bb-a59e-74e87b1342c0.png" width="80%"></img></br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139530384-82cdca62-037b-4eee-af21-f3bee9f9790e.png" width="80%"></img></br>
</br>

## Core Location
- Core Location 은 위치기반 서비스를 사용하기 위해 제공된 framework 이다.
- Core Location 은 여러 클래스, 프로토콜 enum 등으로 이루어져 있다.
    - CLLocationManager - 위치와 방향 정보를 앱에 전달
    - CLLocationManagerDelegate - CLLocationManager 클래스로부터 변경된 값을 받아 처리
    - CLLocation - 위치, 시간, 이동속도 등의 측정값 정보 저장
    - CLHeading - 이동 방향에 대한 정보 저장

## CLLocationManager
- CLLocationManager 인스턴스를 생성 시 초기화 함
- 갱신된 위치 정보는 CLLocationManagerDelegate 형의 delegate에 전달된다.
    - let locationManager: CLLocationManager = CLLocationManager()
 - 해당 delegate를 CLLocationManager 의 delegate property 에 설정한다.
    - locationManager.delegate = self
 - Delegate 설정 이후 위치 갱신은 CLLocationManager의 다음 함수를 이용해 on/off 한다.
    - locationManager.startUpdatingLocation()
    - locatoinManager.stopUpdatingLocation()

<img width="579" alt="스크린샷 2021-10-30 오후 8 12 40" src="https://user-images.githubusercontent.com/83942393/139530746-863a6cba-90a9-490f-946c-69ba77b57cf8.png">

<img width="578" alt="스크린샷 2021-10-30 오후 8 12 50" src="https://user-images.githubusercontent.com/83942393/139530757-81060714-3fb0-4159-91eb-f0a0ad1e40a0.png">

<img width="578" alt="스크린샷 2021-10-30 오후 8 12 59" src="https://user-images.githubusercontent.com/83942393/139530764-9c62f6e3-b017-408f-a724-a8acb6d80b73.png">
<img width="579" alt="스크린샷 2021-10-30 오후 8 13 05" src="https://user-images.githubusercontent.com/83942393/139530767-1a46b75b-1a84-488b-becf-e92b91082eec.png">
<img width="580" alt="스크린샷 2021-10-30 오후 8 13 28" src="https://user-images.githubusercontent.com/83942393/139530769-83d236ae-8fe3-4075-97bf-ab32cf67c4a8.png">
<img width="582" alt="스크린샷 2021-10-30 오후 8 13 35" src="https://user-images.githubusercontent.com/83942393/139530774-77f01346-87fe-4ff9-a242-f2342eb502ea.png">
<img width="580" alt="스크린샷 2021-10-30 오후 8 13 42" src="https://user-images.githubusercontent.com/83942393/139530783-9d748f3b-945f-4aa0-a997-5e233d3a1397.png">
<img width="578" alt="스크린샷 2021-10-30 오후 8 13 50" src="https://user-images.githubusercontent.com/83942393/139530784-50839646-61bb-48ed-be75-e850046c2d0e.png">
<img width="579" alt="스크린샷 2021-10-30 오후 8 14 10" src="https://user-images.githubusercontent.com/83942393/139530786-18a630fd-ee35-4c43-8c53-206a0ed1944d.png">
<img width="580" alt="스크린샷 2021-10-30 오후 8 14 19" src="https://user-images.githubusercontent.com/83942393/139530788-30300b8d-d744-4d9d-adca-8679ef7f4ff8.png">
<img width="580" alt="스크린샷 2021-10-30 오후 8 14 29" src="https://user-images.githubusercontent.com/83942393/139530793-9a2da6e1-4090-48a3-9345-7da969719b84.png">
<img width="579" alt="스크린샷 2021-10-30 오후 8 14 38" src="https://user-images.githubusercontent.com/83942393/139530795-140949fe-1d7e-4ab3-9f59-0ad90192233a.png">
<img width="579" alt="스크린샷 2021-10-30 오후 8 15 30" src="https://user-images.githubusercontent.com/83942393/139530800-fe34c35e-72ef-4552-8b5a-1fdd63ae3931.png">
<img width="578" alt="스크린샷 2021-10-30 오후 8 15 42" src="https://user-images.githubusercontent.com/83942393/139530803-d3838ca9-604d-4f55-82fd-da957967a8db.png">















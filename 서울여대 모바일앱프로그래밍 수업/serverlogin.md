# W10 - Server Login (Local Host)

## 강의 순서
- 서버 로그인 기본 개념
- 서버 환경 설정
  - APM 소개 : Apache, PHP, MySQL
  - 설치 및 사용 방법
- 클라이언트와 서버의 연동 개념 소개
  - Xcode 와 PHP 코드의 연결
- 클라이언트 환경 개발
  - 회원 가입
  - 로그인   

## 서버 로그인 기본 개념
- 특정 서버에 접속해서 자신의 Identity 인증
  - ID 와 Password 이용함
  - 해당 서버가 제공하는 기능 사용
  - 필요에 따라 잊어버린 ID나 Password를 등록한 이메일 등의 채널을 통해 알려줄 수 있음
- 서버에 등록되어 있지 않다면
  - 계정 ID와 Password를 설정
  - 서버에 개인 소개 정보 저장

<img src="https://user-images.githubusercontent.com/83942393/136761891-0d6bd713-1ac1-4da8-8342-9809a5114b10.png" width="30%"></img></br>

## 클라이언트와 서버의 통신
- 인터넷에 연결된 클라이언트
  - PC, Smart Phone, POS(키오스크?) 등
- 웹 서버에 연결
  - 클라이언트는 인터넷을 통해 웹 서버에 접근
- 웹 서버로부터 자료 수신
  - 웹 서버가 저장중인 파일을 직접 수신
  - DB에 저장된 자료를 웹 프로그램을 이용해 특정 조건에 맞는 자료를 수신

<img src="https://user-images.githubusercontent.com/83942393/136762200-8c214b21-0bc6-44b8-b3e8-89131ebb43ca.png" width="40%"></img>

## 서비스들
- Amazon Web service(AWS) EC2 : AMazon에서 개발한 클라우드 컴퓨팅 서비스 플랫폼
- Google Firebase : Google에서 제공하는 DB를 포함한 Backend 개발 플랫폼 
- Django : 웹사이트에서 Node.js 등을 활용하여 DB를 쉽게 사용할 수 있는 Web Framework
- MongoDB
- MariaDB

## APM(Apache, PHP, MySql)
- Apache는 웹서버, PHP는 웹 프로그램, MySql은 DB

![image](https://user-images.githubusercontent.com/83942393/136762777-b9d3090b-67f2-47bb-809f-011e6491b2e2.png)

1. 클라이언트가 웹 브라우저에 URL을 입력해 원하는 정보를 서버에 요청하고, 서버의 Apache 프로그램은 접속을 승인
2. Apache는 DB에 저장된 데이터를 가져오기 위해 사용자가 지정한 PHP를 실행
3. PHP는 API 함수를 이용해 DB에 저장된 데이터를 가져오기 위한 명령을 MySQL에 내림
4. MySQL은 DB에 저장된 데이터를 가져와 PHP에 돌려줌
5. PHP는 DB에서 가져온 데이터와 PHP 코드를 모두 HTML 형태로 변경한 후, 해당 HTML 파일을 Apache 에 전달
6. Apache는 완성된 HTML 파일을 클라이언트 측의 웹 브라우저에 전달

## Apache
- Apache Web Server 는 Apache HTTP Server 라고도 함
  - 클라이언트 사용자의 웹 요청을 처리하는 서버 프로그램

![image](https://user-images.githubusercontent.com/83942393/136763564-90f88a3a-2e35-4b94-ac86-758e393fe1dd.png)

## PHP(PHP Hypertext Preprocessor)
- 웹에서 사용하기 위해 웹 서버에서 실행되는 스크립트 언어
  - 1995년 Rasmus Lerdorf and others
  - Open Source Project
  - Personal Home Page
    - PHP Hypertext Preprocessor  

![image](https://user-images.githubusercontent.com/83942393/136763752-0547c60a-2931-4934-a192-00a2ecfaafcc.png)
![image](https://user-images.githubusercontent.com/83942393/136763777-936edaf6-b793-4692-a55d-0f2cb9b64ef0.png)

## MySQL
- 오픈소스 관계형 데이터베이스 관리 시스템(DBMS)
  - Sun Microsystems가 인수 -> Oracle 이 인수
  - 세계에서 가장 많이 사용하는 DBMS(1995년 5월 발표)
  - LAMP/WAMP/MAMP 플랫폼에서 작동됨
    - Apache - MySQL - PHP/Perl/Python

![image](https://user-images.githubusercontent.com/83942393/136763990-08cd2a95-f5d3-4a14-81a4-af4af3783ae4.png)

## 만들고자 하는 Login 기능
<img width="717" alt="스크린샷 2021-10-11 오후 6 09 56" src="https://user-images.githubusercontent.com/83942393/136764302-c56c6c9d-8f5e-49a9-a52b-2e9d3091516e.png">

## APM 설치
- Linux에서 AMP 설치
- Windows에서 AMP 설치
- MacOS에서 AMP 설치 

![image](https://user-images.githubusercontent.com/83942393/136764554-c1847949-1245-41a1-8967-f45569271c82.png)

## MAMP 사용
- '응용 프로그램'에서 MAMP 실행 후 'start server' 누름

## 서버 실행
- Tools - phpMyAdmin 실행
![image](https://user-images.githubusercontent.com/83942393/136764741-cef3be25-cd5f-4e47-9ca9-9c4bd13de945.png)

## 데이터 베이스 생성
- Databases 탭 선택
- 데이터 베이스 이름을 iphone으로 생성

![image](https://user-images.githubusercontent.com/83942393/136764836-7b08cc84-3a20-4e49-8e60-b3db3e64881a.png)

## 테이블 생성
- 데이터 베이스 iphone 에 테이블 생성
  - user 테이블에 3개의 field 생성 -> Go
  - 이름은 프로그래밍에서 대소문자 구분이 없음
![image](https://user-images.githubusercontent.com/83942393/136764957-c27b8689-7a9c-490e-9ac3-a6d4ef288309.png)

## 테이블 내 Field 정의
- user 테이블에 세 개의 field 정의
  - userid 는 10 바이트 varchar
    - collation 은 utf8_general_ci 로 선택
  - passwd는 40 바이트 varchar
  - name 은 10 바이트 varchar

![image](https://user-images.githubusercontent.com/83942393/136765200-69815395-9dc4-43bf-8916-d842785abb45.png)
![image](https://user-images.githubusercontent.com/83942393/136765213-57d90491-9637-466c-9630-3f7c90dcb90a.png)
![image](https://user-images.githubusercontent.com/83942393/136765224-58b997ca-acfd-4eab-84a0-57540de5fb91.png)
![image](https://user-images.githubusercontent.com/83942393/136765233-f3d904b4-42c3-428d-8afc-c14a7ce50656.png)

## UTF-8 Encoding
- Uniform Transformation Format
  - UniCode를 위한 가변 문자 인코딩 방식
    - UTF-7, UTF-16, UTF-32, UTF-EBCDIC, CESU-8 등
  - UniCode 한 문자를 나타내기 위해 1~4 바이트를 사용함
  - 1993년 USENIX 학회에서 공식적으로 소개됨
    - Dave Prosser 에 의해 제안되고 Ken Thompson이 수정함
- 특징
  - UTF-8 문자열은 바이트 단위로 정렬을 수행하는 알고리즘에서도 코드 포인트 단위로 올바르게 정렬됨
  - 바이트 단위 문자열 검색 알고리즘을 그대로 사용
  - UTF-8은 모든 유니코드 문자를 표현
  - 대부분의 라틴 알파벳 문자는 적어도 2바이트를 사용하며, 한중일 문자들과 표의 문자들은 적어도 2~3 바이트를 사용

## 생성된 테이블 확인
- iphone 데이터베이스에 user 테이블 생성
- user 테이블에 세 개의 field 생성
  - userid, passwd, name 
  
![image](https://user-images.githubusercontent.com/83942393/136765789-279d9488-2aa2-43c7-95f3-6c89011d1056.png)

## 프로젝트 생성
- 'ServerLogin' 프로젝트 생성
![image](https://user-images.githubusercontent.com/83942393/136765824-c641b25d-6901-468f-9536-60ad4aa24cee.png)

프로젝트 과정 중략

## 인터넷 서버에서 파일의 접근 (URL)
- http://www.swu.ac.kr/www/goala.html
  - 웹 서버(www.swu.ac.kr)의 root는 www.swu.ac.kr/
  - goala.html 파일은 www 디렉토리에 저장되어 있음

![image](https://user-images.githubusercontent.com/83942393/136766113-145a57e2-dbdd-4e52-a246-0f641448d08e.png)

### RESTful
- https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=iOS+Swift

![image](https://user-images.githubusercontent.com/83942393/136766179-df866375-594e-4ce9-820a-c874b056c32d.png)

- REpresentational State Transfer
  - a set of simple rules for how to organize and transmit information on the Internet
- 월드 와이드 웹과 같은 분산 하이퍼미디어 시스템을 위한 소프트웨어 아키텍처의 한 형식이다.
  - 리소스의 구조 자체가 URL 인 표현식

![image](https://user-images.githubusercontent.com/83942393/136766387-f599bee0-e615-4023-b19a-d7d39e8daf4e.png)

(프로젝트 과정 중략)

## 자료 전송 관련 객체
- URLRequest: HTTP 요청 관련 정보를 저장
- URLSession: 각 request별 자료 전달을 위한 session 설정
- URLSessionTask: 요청을 실행하여 자료 전송 작업 수행

![image](https://user-images.githubusercontent.com/83942393/136766511-bd89804c-b04c-4bd1-bcaf-40e1cbaf094a.png)

(프로젝트 진행 과정 중략)

## insertUser.php 파일 저장
- 응용 프로그램 디렉터리에서  MAMP - htdocs-login 디렉터리
  - login 디렉터리는 미리 생성해야 함
  - insertUser.php 파일 저장

(프로젝트 진행 과정 중략)

## Database 저장 상태 확인
- SQL 탭 선택 후 실행
  - select * from user where 100 -> 입력 후 Go
- 비밀번호의 경우 text 입력 값을 그대로 보여줌 -> md5 요망
![image](https://user-images.githubusercontent.com/83942393/136766816-ccfec3d1-14ea-4330-99b0-b270839f9e96.png)

## MD5
- Message Digest Algorithm 5
  - Ronald Rivest 가 기존의 MD4를 대체하기 위해 1991년 제안
  - 임의의 길이의 메시지를 받아 128비트(16바이트)크기의 고정 길이 출력 값을 생성함
  - 무결성(Integrity) 검사에 활용 : 프로그램이나 파일이 원본 그대로인지 확인하는 작업
  - RFC 1321로 지정
  - 현재 MD5를 보안관련 용도로 쓰는 것은 권장하지 않음
- MD6
  - Ronald Rivest 등의 연구자들이 2008년에 제안

## md5를 이용한 Password 저장 

<img width="717" alt="스크린샷 2021-10-11 오후 6 29 13" src="https://user-images.githubusercontent.com/83942393/136767265-2163c052-0d5f-4b7a-a444-7504a90edc36.png">

(프로젝트 진행 과정 중략)

## HTTP status code
- HTTP 응답상태 코드 목록
  - 1xx (조건부응답) : 서버가 요청을 받았으며, 클라이언트의 나머지 요청을 기다리거나 서버가 승인중임
  - **2xx (성공)** : 서버가 클라이언트의 요청을 수신하여, 이해하고, 승인했으며 성공적으로 처리했음 
  - 3xx (리다이렉션 완료) : 클라이언트는 요청을 마치기 위해 추가 동작을 수행해야 함
  - 4xx (요청 오류) : 클라이언트의 요청에 오류가 있음
  - 5xx (서버 오류) : 서버가 유효한 요청을 수행하지 못함

## JSON
- JavaScript Obejct Notation
  - http://json.org/json-ko.html
  - 데이터 객체를 전달하기 위한 개방형 표준 포맷
- 전달하고자 하는 자료형은 다음과 같다
  - 수 : 정수, 실수 (고정 소수점 : 3.14, 부동 소수점 : 2.5e3)
    - 8진수나 16진수는 지원하지 않음
  - 문자열 : 유니코드 문자를 큰 따옴표(")로 묶어 사ㅏ용
    - back-slash(\)는 제어문자를 표시하기 위해 사용
  - 배열 : 대괄호 (\[,])로 나타내며 각 요소들은 쉼표로 구별됨
    - \[10, {"v":20}, \[30, "마흔"]]
  - 객체 : name/value 집합으로 중괄호 ({,})를 사용한다
    - {"name2":50, "name3":"값3", "name1":true}
 - Firefox, Explorer, Opera, Safari, Chrome 등은 JSON Parser를 내장하고 있음      

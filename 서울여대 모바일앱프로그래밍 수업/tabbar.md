## W13 - Tab Bar

<img src="https://user-images.githubusercontent.com/83942393/139022884-eb8f95ff-ddab-4606-b82f-197f832486c0.png" width="70%"></img></br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139022888-bb725f94-5b13-4354-a3dc-792be90406a9.png" width="70%"></img></br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139022893-e2100d38-9764-4da4-a1de-6c9202e2edc1.png" width="70%"></img></br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139026056-52ae7da0-8002-4945-95a8-d1a472625954.png" width="70%"></img></br>
</br>

### (CartTableView)
<img src="https://user-images.githubusercontent.com/83942393/139026059-dd13078a-62d3-4c8a-a1f4-96da28f6dace.png" width="70%"></img></br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139026063-4daaf30b-36cc-4bcb-ab72-1b340359a381.png" width="70%"></img></br>
</br>

### FirstViewController 에서 TabBarController 에 접근 한 후 CartTableView 에 접근해야 한다. 
<img src="https://user-images.githubusercontent.com/83942393/139026069-79b7ae36-3f8d-4c42-ba11-818e3ea3a289.png" width="70%"></img></br>
### (2021년 10월 에러)
>
- xcode 13.0 버전 이후로 scenDelegate가 새로 생기고 appDelegate의 기능이 scenDelegate으로 옮겨감 </br>
- 현재 버전에서 appDelegate.window가 없어짐 (오류 발생)
- -> 해결 방법 : scenDelegate를 없애고, AppDelegate와 info.plist 에 scenDelegate 와 관련된 메소드와 항목을 삭제하면 이전 버전과 같이 사용이 가능하다. </br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139026624-df77427e-93e3-4bca-96ee-8605bf037664.png" width="70%"></img></br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139026081-978883d7-23a1-4d12-b061-25a22bd16467.png" width="70%"></img></br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139026088-ec9aa375-9769-478f-918a-c7e7a2177b3a.png" width="70%"></img></br>
</br>

<img src="https://user-images.githubusercontent.com/83942393/139026091-cd781460-7aa3-4410-a775-67001ffe3bdc.png" width="70%"></img></br>

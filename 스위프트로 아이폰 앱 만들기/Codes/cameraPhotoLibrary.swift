// 카메라와 포토 라이브러리를 사용하기 위해서
// ImagePickerController, 이 컨트롤러를 사용하기 위한 델리게이트 프로토콜, 미디어 타입이 정의된 헤더 파일


import UIKit
import MobileCoreServices   //- 다양한 타입들을 정의해 놓은 헤더 파일


class ViewController: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate{
  
//MARK: - Variable
    let imagePicker: UIImagePickerController! = UIImagePickerController()   // UIImagePickerController의 인스턴스 변수 생성
    var captureImage: UIImage!      // 촬영을 하거나 포토 라이브러리에서 불러온 사진을 저장할 변수
    var videoURL: URL!              // 녹화한 비디오의 URL을 저장할 변수
    var flagImageSave = false       // 이미지 저장 여부를 나타낼 변수 =
//Variable_End
    
    @IBOutlet var imgView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//MARK: - Fuction
    // 경고 표시용 메서드
    
    func myAlert(_ title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    // 사용자가 사진이나 비디오를 찍지 않고 취소하거나 선택하지 않고 취소를 할 경우에 호출됨.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)   // 다시 처음의 뷰 상태로 돌아가야 하므로, 현재의 뷰 컨트롤러에 보이는 이미지 피커를 제거하여 초기 뷰를 보여줌.
    }
    
    // 사용자가 사진이나 비디오를 촬영하거나 포토 라이브러리에서 선택이 끝났을 때 호출됨.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString    // 미디어의 종류 확인
        
        if mediaType.isEqual(to: kUTTypeImage as NSString as String){
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if flagImageSave {                  // flagImageSave 가 true 이면 가져온 사진을 포토 라이브러리에 저장합니다.
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            imgView.image = captureImage
        }
        
        else if mediaType.isEqual(to: kUTTypeMovie as NSString as String){
            if flagImageSave {
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
                
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
        }
        
        self.dismiss(animated: true, completion: nil)   // 현재의 뷰 컨트롤러를 제거. 즉, 뷰에서 이미지 피커 화면을 제거하여 초기 뷰를 보여줍니다.
        
    }
//Function_End
    
//MARK: - Action
    
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){    // 카메라의 사용 가능 여부를 확인
            flagImageSave = true        // 카메라 촬영 후 저장할 것이기 때문에 이미지 저장을 허용
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)   // 현재 뷰 컨트롤러를 imagePicker로 대체, 즉 뷰에 imagePicker 가 보이게 합니다.
        } else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
    @IBAction func btnLoadingImageFromLibary(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
        
    }
    
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.camera)){
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert("Camera inaccessable", message: "Application cannot access the camera.")
        }
        
    }
    
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
        if(UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeMovie as String]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
        else{
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
//Action_End
    
}





======================================================================================================

카메라 사용 권한에 관한 키 -> info.plist (= 앱에서 아이폰의 정보를 가져올 때 info.plist 에서 해당 키를 입력해야 합니다. )

[Privacy - Camera Usage Description] / Value : 'CameraPhotoLibrary'가 카메라에 접근하려고 합니다.

* 마이크로폰 접근키 : Privacy - MicroPhone Usage Description   / Value : 'CameraPhotoLibrary'가 마이크에 접근하려고 합니다.
* 포토 라이브러리 저장키 : Privacy - Photo Library Additions Usage Description  / Value : 'CameraPhotoLibrary'가 사용자의 사진에 추가하려고 합니다.
* 포토 라이브러리 접근키 : Privacy - Photo Library Usage Description







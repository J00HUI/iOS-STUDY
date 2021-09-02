import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    var audioPlayer : AVAudioPlayer!    // AVAudioPlayer 의 인스턴스 변수
    var audioFile: URL!     // 재생할 오디오의 파일명 변수
    let MAX_VOLUME: Float = 10.0    // 최대 볼륨, 실수형 상수
    var progressTimer: Timer!       // 타이머를 위한 변수
    let timePlayerSelector: Selector = #selector(ViewController.updatePlayTime)
    
//MARK:- 녹음을 위한 상수
    var audioRecorder: AVAudioRecorder!
    var isRecordMode = false
    let timeRecordSelector:Selector = #selector(ViewController.updateRecordTime)
//End
    
    @IBOutlet var pvProgressPlay: UIProgressView!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblEndTime: UILabel!
    
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    
    @IBOutlet var slVolume: UISlider!
    
    @IBOutlet var btnRecord: UIButton!
    @IBOutlet var lblRecordTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectAudioFile()
        
        if !isRecordMode {
            initPlay()
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
        } else {
            initRecord()
        }
    }
    
//MARK:- Fuction
    
    // 재생 모드와 녹음 모드에 따라 다른 파일을 선택함
    func selectAudioFile() {
        
        if !isRecordMode {
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension: "mp3")
        } else {    // 녹음 모드일 때는 도큐먼트 디렉터리에 'recordFile.m4a'를 생성하여 사용. (재생 모드일 때는 오디오 파일인 재생 파일이 재생, 녹음 모드일 때는 새 파일이 생성)
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
            
        }
        
        
    }
    
    // 녹음을 위한 초기화 하기
    func initRecord() {
        
        // 녹음에 대한 설정. 포맷은 'Apple Lossless', 음질은 '최대', 비트율은 '320,000bps(320kbps)', 오디오 채널은 '2'로 하고 샐플률은 '44,100HZ'로 설정
        let recordSettings = [
            AVFormatIDKey : NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey : 320000,
            AVNumberOfChannelsKey : 2,
            AVSampleRateKey : 44100.0] as [String : Any]
        
        do{
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
        } catch let error as NSError {
            print("Error-initRecord : \(error)")
        }
        
        audioRecorder.delegate = self
        
        slVolume.value = 1.0
        audioPlayer.volume = slVolume.value
        lblEndTime.text = convertNSTimeInterval2String(0)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButton(false, pause: false, stop: false)
        
        
        // AVAudioSession 인스턴스 session 을 생성하고, do-try-catch 문을 사용해 카테고리를 설정한 다음, 액티브를 설정.
        let session = AVAudioSession.sharedInstance()
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch let error as NSError {
            print("Error-setCategory : \(error)")
        }
        
        do {
            try session.setActive(true)
        } catch let error as NSError {
            print("Error-setActive : \(error)")
        }
    }
    
    
    // 오디오 재생을 위한 초기화 하기
    func initPlay(){
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)  // audioFile을 URL 로 하는 audioPlayer 인스턴스를 생성
                                                                // 이때 AVAudioPlayer 함수는 입력 파라미터인 오디오 파일이 없을 때에 대비하여 do-try-catch문을 사용
        } catch let error as NSError {
            print("Error-initPlay: \(error)")
        }
        
        slVolume.maximumValue = MAX_VOLUME          // 슬라이더의 최대 볼륨을 상수 MAX_VOLUME 인 10.0 으로 초기화힙니다.
        slVolume.value = 1.0                        // 슬라이더의 볼륨을 1.0으로 초기화합니다.
        pvProgressPlay.progress = 0                 // 프로그래스 뷰의 진행을 0으로 초기화합니다.
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()                 // prepareToPlay()를 실행합니다.
        audioPlayer.volume = slVolume.value         // audioPlayer의 볼륨을 방금 앞에서 초기화한 슬라이더(slVolume)의 볼륨 값 1.0으로 초기화합니다.
        
        // 오디오 파일의 재생 시간인 audioPlayer.duration 을 EndTime 에 나타내고 싶지만, 초 단위이므로 "00:00" 형태로 변경 후 입력
        lblEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        lblCurrentTime.text = convertNSTimeInterval2String(0)   // 00:00 이 출력되도록 0의 값을 입력
        
        setPlayButton(true, pause: false, stop: false)
    }
    
    // 버튼의 동작 여부를 설정하는 부분은 앞으로도 계속 사용해야 하므로 따로 만들기
    func setPlayButton(_ play: Bool, pause: Bool, stop: Bool){
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    // 초 단위 -> "00:00" 형태로 변경
    func convertNSTimeInterval2String(_ time: TimeInterval) -> String {
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60)) // time을 60으로 나눈 '나머지' 값을 정수 값으로 변환하여 상수 sec 값에 초기화합니다.
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }
    
    // 0.1 초마다 호출되며 재생 시간을 표시함
    @objc func updatePlayTime() {
        lblCurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
    // 오디오 재생이 끝나면 맨 처음 상태로 되돌아가도록.
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButton(true, pause: false, stop: false)
    }
    
    // 0.1초마다 호출되며 녹음 시간을 표시함
    @objc func updateRecordTime() {
        lblRecordTime.text = convertNSTimeInterval2String(audioRecorder.currentTime)
    }
//Fuction_End
    
//MARK: - Action
    
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButton(false, pause: true, stop: true)
        
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func btnPauseAudio(_ sender: UIButton) {  // 잠시 멈춤
        audioPlayer.pause()
        setPlayButton(true, pause: false, stop: true)
    }
    
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButton(true, pause: false, stop: false)
        progressTimer.invalidate()      // 타이머도 무효화
    }
    
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    
    @IBAction func swRecordMode(_ sender: UISwitch) {
        if sender.isOn {
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            lblRecordTime.text = convertNSTimeInterval2String(0)
            isRecordMode = true
            btnRecord.isEnabled = true
            lblRecordTime.isEnabled = true
        } else {
            isRecordMode = false
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
            lblRecordTime.text = convertNSTimeInterval2String(0)
        }
        
        selectAudioFile()
        
        if !isRecordMode {
            initPlay()
        } else {
            initRecord()
        }
    }
    
    @IBAction func btnRecord(_ sender: UIButton) {
        
        if (sender as AnyObject).titleLabel??.text == "Record" {
            audioRecorder.record()
            (sender as AnyObject).setTitle("Stop", for: UIControl.State())
            
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
        } else {
            audioRecorder.stop()
            (sender as AnyObject).setTitle("Record", for: UIControl.State())
            btnPlay.isEnabled = true
            initPlay()
        }
        
    }
//Action_End
    
}

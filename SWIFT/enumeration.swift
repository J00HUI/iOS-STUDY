1.
enum School {    
  case elementary     
  case middle   
  case high   
  case university    
}    

/*    
enum School {    
  case elementary, middle, high, university    
}   
*/    

var highestEducationLevel: School = School.university
var lowestEducationLevel: School = .elementary

print(highestEducationLevel)          // university

2.
enum School: String {
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case university = "대학교"
}

let highestEducationLevel : School = .university
print("최종 학력: \(highestEducationLevel.rawValue) 졸업")        // 최종 학력: 대학교 졸업
print(School.elementary.rawValue)                              // 초등학교




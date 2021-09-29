var Line6: Set<String> = ["봉화산", "화랑대", "태릉입구", "석계"]
var Line7: Set<String> = ["하계", "공릉", "태릉입구", "먹골"]

print("(Line6.count), (Line6.isEmpty)")
Line6.insert("돌곶이")
Line6.remove("봉화산")

let intersect = Line6.intersection(Line7)
print(intersect)                            // ["태릉입구"] 

let union = Line6.union(Line7)
print(union)                                // ["돌곶이", "화랑대", "태릉입구", "하계", "공릉", "먹골", "석계"]

let subtract = Line6.subtracting(Line7)
print(subtract)                             // ["석계", "돌곶이", "화랑대"]

print(Line6.contains("화랑대"))              // true (원소 존재 여부)
print(Line6.isDisjoint(with: Line7))       // false (같은 원소가 없는지?)
print(Line6.isSubset(of: union))           // true (부분집합?)
print(union.isSuperset(of: intersect))     // true (전체집합?)

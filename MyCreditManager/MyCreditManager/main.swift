//
//  main.swift
//  MyCreditManager
//
//  Created by 탁하선 on 2023/04/26.
//

import Foundation

struct Subject {
    var subject: String
    var grade: String
}

var studentList = [[Subject]]()
var students: Array<String> = []
var student: String

while(true) {
    print("원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적 삭제, 5: 평점보기, X: 종료")
    let choice = readLine()!
    
    switch choice {
    case "1":
        print("추가할 학생의 이름을 입력해주세요")
        student = readLine()!
        if student == "" {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            break
        }
        else if students.contains(student) {
            print("\(student)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            break
        }
        else {
            students.append(student)
            print("\(student) 학생을 추가했습니다.")
        }
        
    case "2":
        print("삭제할 학생의 이름을 입력해주세요")
        student = readLine()!
        if students.contains(student) {
            studentList[students.firstIndex(of: student)!].removeAll()
            students.remove(at: students.firstIndex(of: student)!)
            print("\(student) 학생을 삭제하였습니다.")
        }
        else {
            print("\(student) 학생을 찾지 못했습니다.")
        }
        
    case "3":
        print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        let input = readLine()!
        let arr = input.split(separator: " ")
        if arr.count != 3 {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            break
        }
        student = String(arr[0])

        if let studentIndex = students.firstIndex(of: student) {
            var temp = Subject(subject: String(arr[1]), grade: String(arr[2]))
            studentList[studentIndex].append(temp)
            print("\(student) 학생의 \(String(arr[1])) 과목이 \(String(arr[2]))로 추가(변경) 되었습니다.")
        }
        else {
            exit(1)
        }
        
    case "4":
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
        let input = readLine()!
        let arr = input.split(separator: " ")
        if arr.count != 2 {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            break
        }
        student = String(arr[0])
        if let studentIndex = students.firstIndex(of: student) {
            var subjectIndex = studentList[studentIndex].firstIndex(where: {$0.subject == String(arr[1])})
            studentList[studentIndex].remove(at: subjectIndex!)
            print("\(student) 학생의 \(String(arr[1])) 과목이 삭제되었습니다.")
        }
        else {
            print("\(student) 학생을 찾지 못했습니다.")
        }
        
    case "5":
        print("평점을 알고싶은 학생의 이름을 입력해주세요")
        student = readLine()!
        if student == "" {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            break
        }
        else if students.contains(student) {
            var avg: Double = 0, num: Double = 0
            for it in studentList[students.firstIndex(of: student)!] {
                print("\(it.subject): \(it.grade)\n")
                if it.grade == "A+" { avg+=4.5 }
                else if it.grade == "A" { avg+=4 }
                else if it.grade == "B+" { avg+=3.5 }
                else if it.grade == "B" { avg+=3 }
                else if it.grade == "C+" { avg+=2.5 }
                else if it.grade == "C" { avg+=2 }
                else if it.grade == "D+" { avg+=1.5 }
                else if it.grade == "D" { avg+=1 }
                else if it.grade == "F" { avg+=0 }
                num+=1
            }
            avg /= num
            print("평점 : \(avg)")
        }
        else {
            print("\(student) 학생을 찾지 못했습니다.")
        }
        
        
    case "X":
        print("프로그램을 종료합니다...")
        exit(0)
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}

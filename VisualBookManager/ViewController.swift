//
//  ViewController.swift
//  VisualBookManager
//
//  Created by 이상묵 on 2018. 7. 31..
//  Copyright © 2018년 이상묵. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myBookManager = BookManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let book1 = Book(name: "햄릿", genre: "드라마", author: "셰익스피어")
        let book2 = Book(name: "리어왕", genre: "비극", author: "셰익스피어")
        let book3 = Book(name: "한여름밤의 꿈", genre: "오페라", author: "셰익스피어")
        
        myBookManager.registerBook(bookObject: book1)
        myBookManager.registerBook(bookObject: book2)
        myBookManager.registerBook(bookObject: book3)
        
        txtTotalCount.text = "\(myBookManager.countBook())"
    }
    
    @IBAction func showAllBookList(_sender:Any)
    {
        txtAllBookList.text = myBookManager.showAllBook()
    }
    
    @IBAction func registerBook(_sender:Any)
    {
        //입력 필드 세가지 모두 입력된 경우
        if txtTitle.text != "" && txtAuthor.text != "" && txtCategory.text != ""{
            
            //입력 창의 책 정보를 가져온다.
            var book = Book()
            book.name = txtTitle.text
            book.genre = txtCategory.text
            book.author = txtAuthor.text
            
            myBookManager.registerBook(bookObject: book)
            
            txtAllBookList.text = "책이 등록 되었습니다."
        }else
        {
            let alertController = UIAlertController(title: "모든 필드에 입력이 되지 않았습니다.",message: "3가지 입력 필드를 채워주세요", preferredStyle: UIAlertControllerStyle.alert)
            
            //UIAlertActionStye.destructive 지정 글꼴 색상 변경
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: nil)
            alertController.addAction(cancelButton)
            
            self.present(alertController,animated: true,completion: nil)
        }
        
        txtTotalCount.text = "\(myBookManager.countBook())"
    }
    
    @IBAction func findBook(_ sender: Any) {
        if txtTitle.text == ""
        {
            let alertController = UIAlertController(title: "제목을 입력 해주세요.",message: "제목만 입력 해주시면 됩니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            //UIAlertActionStye.destructive 지정 글꼴 색상 변경
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: nil)
            alertController.addAction(cancelButton)
            
            self.present(alertController,animated: true,completion: nil)
        }else
        {
            txtAllBookList.text = myBookManager.findBook(name: txtTitle.text!)
        }
    }
    
    @IBAction func removeBook(_ sender: Any) {
        if txtTitle.text == ""
        {
            let alertController = UIAlertController(title: "제목을 입력 해주세요.",message: "제목만 입력 해주시면 됩니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            //UIAlertActionStye.destructive 지정 글꼴 색상 변경
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: nil)
            alertController.addAction(cancelButton)
            
            self.present(alertController,animated: true,completion: nil)
        }else
        {
            let flag = myBookManager.removeBook(name: txtTitle.text!)
            if flag
            {
                txtAllBookList.text = "\(txtTitle.text!) 이(가) 삭제되었습니다."
            }else
            {
                txtAllBookList.text = "\(txtTitle.text!) 은(는) 찾을 수 없습니다."
            }
            txtTotalCount.text = "\(myBookManager.countBook())"
        }
        
    }
    @IBOutlet weak var txtTotalCount: UILabel!
    @IBOutlet weak var txtCategory: UITextField!
    @IBOutlet weak var txtAuthor: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtAllBookList: UITextView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  TodoApp
//
//  Created by 飯島大樹 on 2019/11/06.
//  Copyright © 2019 Daiki Iijima. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var todoList = [String]();
    
    @IBOutlet weak var tableView: UITableView!
    
    //  テーブルの行数を設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //  todoListの数行数を確保する
        return todoList.count
    }
    
    //  テーブルの行ごとのセルを設定する
    //  システムがセルを描画する必要が出たら呼ばれる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //  StoryBoardで作成した、todoCellを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        //  行番号にあったToDoのタイトルを取得する
        let todoTitle = todoList[indexPath.row]
        
        //  セルのラベルにtodoListから取得したタイトルを設定する
        cell.textLabel?.text = todoTitle
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  保存しているToDoの読み込み
        let userDefaults = UserDefaults.standard
        if let storedTodoList = userDefaults.array(forKey: "todoList") as? [String]
        {
            todoList.append(contentsOf: storedTodoList)
        }
    }

    //  メモリ不足になった時に呼ばれるメソッド
    //  前のXcodeのバージョン(9?)までは自動生成されていた
    //  今は自動で生成されない
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //  +ボタンをタップした時の処理
    @IBAction func tapAddButton(_ sender: Any) {
    
        //  アラートのダイアログを生成
        let alertController = UIAlertController(title: "ToDo追加", message: "ToDoを入力してください", preferredStyle: UIAlertController.Style.alert)
        //  テキストエリアを追加
        alertController.addTextField(configurationHandler: nil)
        
        //  OKボタンを追加しhandlerにアクションを記述
        let okAction = UIAlertAction(title: "OK",
                                     style: UIAlertAction.Style.default,
                                     handler: { (UIAlertAction) in
            //  OKボタンがタップされた時の処理
            if let textField = alertController.textFields?.first{
                
                //  ToDoの配列に入力された値を挿入
                self.todoList.insert(textField.text!,at:0)
                
                //  テーブルに行が追加されたことをテーブルに通知
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)],with: UITableView.RowAnimation.right)
            
                //  ToDoの保存
                let userDefaults = UserDefaults.standard
                userDefaults.set(self.todoList,forKey: "todoList")
                //  保存
                userDefaults.synchronize()
                }
        })
        
        //  上のブロックで作成したOKボタンがタップされた時の処理を設定
        alertController.addAction(okAction)
        
        //  CANCELボタンが押された時の処理
        let cancelAction = UIAlertAction(title: "CANCEL",
                                         style: UIAlertAction.Style.cancel,
                                         handler: {(UIAlertAction) in
            
            //  キャンセルの時の処理を入れたかったらここに書く
                                            
        })
        
        //  CANCELボタンを追加
        alertController.addAction(cancelAction)
        
        //  アラートダイアログを表示
        present(alertController,animated: true,completion: nil)
    }
    
}


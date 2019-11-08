//
//  ViewController.swift
//  TodoApp
//
//  Created by 飯島大樹 on 2019/11/06.
//  Copyright © 2019 Daiki Iijima. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var todoList = [String]();
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        //  テキストエリアを追加
        
        //  OKボタンを追加
        
        //  OKボタンがタップされた時の処理
        
        //  ToDoの配列に入力された値を挿入
        
        //  テーブルに行が追加されたことをテーブルに通知
        
        //  OKボタンがタップされた時の処理
        
        //  CANCELボタンが押された時の処理
        
        //  CANCELボタンを追加
        
        //  アラートダイアログを表示
    }
    
    
    
}


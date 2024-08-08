//
//  ViewController.swift
//  SongWolf
//
//  Created by 株丹優一郎 on 2024/08/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色を設定
        view.backgroundColor = .white
        
        // タイトルラベルを作成
        let titleLabel = UILabel()
        titleLabel.text = "ソングウルフ"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // ボタンを作成
        let startButton = UIButton(type: .system)
        startButton.setTitle("始める", for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)
        
        // 制約を追加
        NSLayoutConstraint.activate([
            // タイトルラベルの中央揃え
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            
            // ボタンの中央揃え
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
        ])
    }
}



//
//  SelectSongsViewController.swift
//  SongWolf
//
//  Created by 株丹優一郎 on 2024/08/08.
//
import UIKit

class SelectSongsViewController: UIViewController {
    
    // Mock data for demonstration
    var players = [
        (name: "Player 1", song: "Song A", artist: "Artist A", thumbnail: UIImage(named: "thumbnail1")),
        (name: "Player 2", song: nil as String?, artist: nil as String?, thumbnail: nil as UIImage?),
        (name: "Player 3", song: "Song C", artist: "Artist C", thumbnail: UIImage(named: "thumbnail3"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLabel()
        setupPlayerList()
        setupButton()
    }

    private func setupButton() {
        var button = UIButton(type: .system) {
            didSet {
                button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            }
        }
        
        button.setTitle("Select Songs", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func buttonTapped() {
        UIApplication.shared.open(SpotifyAPI.shared.oAuthURL, options: [:])
    }
    
    private func setupLabel() {
        let label = UILabel()
        label.text = "選択曲入力画面"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupPlayerList() {
        let containerView = UIStackView()
        containerView.axis = .vertical
        containerView.spacing = 10
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        for player in players {
            let playerStackView = UIStackView()
            playerStackView.axis = .vertical
            playerStackView.spacing = 10
            playerStackView.translatesAutoresizingMaskIntoConstraints = false
            
            let horizontalStackView = UIStackView()
            horizontalStackView.axis = .horizontal
            horizontalStackView.spacing = 10
            horizontalStackView.alignment = .center
            horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
            
            let nameLabel = UILabel()
            nameLabel.text = player.name
            nameLabel.font = UIFont.systemFont(ofSize: 18)
            horizontalStackView.addArrangedSubview(nameLabel)
            
            if player.song != nil {
                let changeButton = UIButton(type: .system)
                changeButton.setTitle("変更する", for: .normal)
                changeButton.addTarget(self, action: #selector(changeSongButtonTapped), for: .touchUpInside)
                horizontalStackView.addArrangedSubview(changeButton)
            }
            
            playerStackView.addArrangedSubview(horizontalStackView)
            
            let songContainerView = UIView()
            songContainerView.layer.borderColor = UIColor.black.cgColor
            songContainerView.layer.borderWidth = 1.0
            songContainerView.translatesAutoresizingMaskIntoConstraints = false
            
            let songStackView = UIStackView()
            songStackView.axis = .vertical
            songStackView.spacing = 10
            songStackView.translatesAutoresizingMaskIntoConstraints = false
            songContainerView.addSubview(songStackView)
            
            NSLayoutConstraint.activate([
                songStackView.topAnchor.constraint(equalTo: songContainerView.topAnchor, constant: 10),
                songStackView.leadingAnchor.constraint(equalTo: songContainerView.leadingAnchor, constant: 10),
                songStackView.trailingAnchor.constraint(equalTo: songContainerView.trailingAnchor, constant: -10),
                songStackView.bottomAnchor.constraint(equalTo: songContainerView.bottomAnchor, constant: -10)
            ])
            
            if let thumbnail = player.thumbnail {
                let imageView = UIImageView(image: thumbnail)
                imageView.contentMode = .scaleAspectFit
                songStackView.addArrangedSubview(imageView)
            }
            
            if let song = player.song {
                let songLabel = UILabel()
                songLabel.text = song
                songLabel.font = UIFont.systemFont(ofSize: 18)
                songStackView.addArrangedSubview(songLabel)
                
                if let artist = player.artist {
                    let artistLabel = UILabel()
                    artistLabel.text = artist
                    artistLabel.font = UIFont.systemFont(ofSize: 16)
                    artistLabel.textColor = .gray
                    songStackView.addArrangedSubview(artistLabel)
                }
                
            } else {
                let selectButton = UIButton(type: .system)
                selectButton.setTitle("曲を選択してください", for: .normal)
                selectButton.addTarget(self, action: #selector(selectSongButtonTapped), for: .touchUpInside)
                songStackView.addArrangedSubview(selectButton)
                
                // 高さの制約を追加して、他の要素と同じ高さにする
                selectButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
            }
            
            playerStackView.addArrangedSubview(songContainerView)
            containerView.addArrangedSubview(playerStackView)
            
            // songContainerViewの幅をcontainerViewに合わせる
            NSLayoutConstraint.activate([
                songContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                songContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            ])
        }
    }
    
    @objc private func changeSongButtonTapped(sender: UIButton) {
        // Implement the logic to change the song
        print("Change song button tapped")
    }
    
    @objc private func selectSongButtonTapped(sender: UIButton) {
        // Implement the logic to select a song
        print("Select song button tapped")
    }
}

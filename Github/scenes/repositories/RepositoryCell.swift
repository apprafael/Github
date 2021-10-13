//
//  RepositoryCell.swift
//  Github
//
//  Created by Rafael Almeida on 30/03/21.
//

import UIKit

class RepositoryCell: UITableViewCell {
    var repositoryViewModel: RepositoryViewModel? {
        didSet{
            ownerName.text = repositoryViewModel?.ownerName
            repositoryName.text = repositoryViewModel?.repositoryName
            starCount.text = "\(repositoryViewModel?.stars ?? 0)"
            forkCount.text = "\(repositoryViewModel?.forks ?? 0)"
            repositoryDescription.text = repositoryViewModel?.reposidotyDescription
        }
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.sizeToFit()
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var repositoryName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .blue
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var repositoryDescription : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.numberOfLines = 2
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private lazy var ownerName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        return lbl
    }()
    
    private lazy var starCount : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .orange
        lbl.textAlignment = .left
        return lbl
    }()
    
    private lazy var forkCount : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .orange
        lbl.textAlignment = .left
        return lbl
    }()
    
    private lazy var forkIcon: UIImageView = {
        let forkIcon = UIImageView(image: UIImage(named: "fork"))
        forkIcon.tintColor = .orange
        forkIcon.translatesAutoresizingMaskIntoConstraints = false
        return forkIcon
    }()
    
    private lazy var startIcon: UIImageView = {
        let starIcon = UIImageView(image: UIImage(named: "star"))
        starIcon.tintColor = .orange
        starIcon.translatesAutoresizingMaskIntoConstraints = false
        return starIcon
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        applyViewCode()
    }
    
    static func getIdentifier() -> String {
        return "RepositoryCell"
    }
}
extension RepositoryCell: ViewCodeProtocol {
    func buildHierarchy() {
        addSubview(repositoryName)
        addSubview(repositoryDescription)
        addSubview(stackView)
        stackView.addArrangedSubview(forkIcon)
        stackView.addArrangedSubview(forkCount)
        stackView.addArrangedSubview(startIcon)
        stackView.addArrangedSubview(starCount)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            repositoryName.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            repositoryName.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            repositoryDescription.topAnchor.constraint(equalTo: repositoryName.bottomAnchor, constant: 8),
            repositoryDescription.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            repositoryDescription.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: repositoryDescription.bottomAnchor, constant: 16),
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            startIcon.widthAnchor.constraint(equalToConstant: 20),
            startIcon.heightAnchor.constraint(equalToConstant: 20),
            forkIcon.widthAnchor.constraint(equalToConstant: 20),
            forkIcon.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

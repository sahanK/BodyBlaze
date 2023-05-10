//
//  BBRecommendedWorkoutListCell.swift
//  BodyBlaze
//
//  Created by Sahan Walpita on 2023-04-19.
//

import UIKit

final class BBWorkoutPanListCell: UITableViewCell {
    static let identifier = "BBWorkoutPanListCell"
    
    let containerVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "recommended-bg-1")
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(named: "GrayScale-100")
        
        setupSubViews()
        contentView.addSubViews(containerVStack)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) is not implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0))
    }
    
    private func setupSubViews() {
        containerVStack.addArrangedSubview(bgImage)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            containerVStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerVStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerVStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerVStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            bgImage.topAnchor.constraint(equalTo: containerVStack.topAnchor),
            bgImage.trailingAnchor.constraint(equalTo: containerVStack.trailingAnchor),
            bgImage.leadingAnchor.constraint(equalTo: containerVStack.leadingAnchor),
            bgImage.bottomAnchor.constraint(equalTo: containerVStack.bottomAnchor)
        ])
    }

}

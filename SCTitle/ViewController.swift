//
//  ViewController.swift
//  SCTitle
//
//  Created by Юрий Степанчук on 22.11.2023.
//

import UIKit

final class ViewController: UIViewController {

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
        imageView.tintColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.frame
        scrollView.contentSize = .init(width: view.frame.width, height: 800)

        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
    }

    private func setupView() {
        Task { await setupImageView()
        view.backgroundColor = .white}
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Avatar"
    }

    private func setupImageView() async {
        guard let largeTitleClass = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
        for view in self.navigationController?.navigationBar.subviews ?? [] {
            guard view.isKind(of: largeTitleClass.self) else { continue }
            addImageView(to: view)
        }
    }

    private func addImageView(to view: UIView) {
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 36),
            imageView.widthAnchor.constraint(equalToConstant: 36),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}

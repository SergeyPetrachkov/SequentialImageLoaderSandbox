//
//  ViewController.swift
//  LoaderSandbox
//
//  Created by Sergey Petrachkov on 02/12/2021.
//

import UIKit

class ViewController: UIViewController {

    lazy var button: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Open loader", for: .normal)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        button.addTarget(self, action: #selector(self.didTap), for: .touchUpInside)
    }

    @objc
    private func didTap() {
        let anotherVC = LoaderVC()
        present(anotherVC, animated: true)
    }
}

//
//  ViewCodeProtocol.swift
//  adotafacil
//
//  Created by Rafael Almeida on 27/01/21.
//  Copyright © 2021 Rafael Almeida. All rights reserved.
//

import Foundation

protocol ViewCodeProtocol {
    func buildHierarchy()
    func setupConstraints()
    func configureView()
    func applyViewCode()
}

extension ViewCodeProtocol {
    func configureView() { }
    func applyViewCode() {
        buildHierarchy()
        setupConstraints()
        configureView()
    }
}

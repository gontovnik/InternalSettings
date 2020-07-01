// Copyright © 2020 Danil Gontovnik. All rights reserved.

import UIKit

final class BarButtonItem: UIBarButtonItem {

    // MARK: - Vars

    private let block: (() -> Void)

    // MARK: - Init

    init(title: String? = nil, image: UIImage? = nil, block: @escaping () -> Void) {
        self.block = block
        super.init()

        self.title = title
        self.image = image
        self.style = .plain
        self.target = self
        self.action = #selector(BarButtonItem.pressed)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: -

    @objc
    private func pressed() {
        block()
    }
}

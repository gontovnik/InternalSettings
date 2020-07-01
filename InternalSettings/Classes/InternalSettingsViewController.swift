// Copyright © 2020 Danil Gontovnik. All rights reserved.

import UIKit

final class InternalSettingsViewController: UIViewController {

    // MARK: - Consts

    private enum Constants {
        static let cellIdentifier = "Cell"
    }

    // MARK: - Vars

    private let viewModel: InternalSettingsViewModelProtocol

    private let tableView: UITableView = {
        let style: UITableView.Style
        if #available(iOS 13.0, *) {
            style = .insetGrouped
        } else {
            style = .grouped
        }
        return UITableView(frame: .zero, style: style)
    }()

    // MARK: - Init

    init(viewModel: InternalSettingsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    private func configureViews() {
        title = "Internal Settings"

        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource

extension InternalSettingsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(inSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        cell.textLabel?.text = viewModel.titleForItem(atIndexPath: indexPath)
        cell.accessoryType = viewModel.showsDisclosureIndicator(atIndexPath: indexPath) ? .disclosureIndicator : .none
        return cell
    }
}

// MARK: - UITableViewDelegate

extension InternalSettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelectItem(atIndexPath: indexPath)
    }
}

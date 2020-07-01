// Copyright © 2020 Danil Gontovnik. All rights reserved.

import UIKit

public final class ExperimentsDebugViewController: UIViewController {

    // MARK: - Const

    private enum Constants {
        static let cellIdentifier = "Cell"
    }

    // MARK: - Vars

    private let viewModel: ExperimentsDebugViewModelProtocol

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

    public init(viewModel: ExperimentsDebugViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    public override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    private func configureViews() {
        tableView.frame = view.bounds
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        view.addSubview(tableView)
    }
}

// MARK: - UITableViewDataSource

extension ExperimentsDebugViewController: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems(inSection: section)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        cell.textLabel?.text = viewModel.titleForItem(atIndexPath: indexPath)
        cell.accessoryType = viewModel.showsCheckmarkForItem(atIndexPath: indexPath) ? .checkmark : .none
        return cell
    }

    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.title(forSection: section)
    }
}

// MARK: - UITableViewDelegate

extension ExperimentsDebugViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.didSelectItem(atIndexPath: indexPath)
        tableView.reloadSections(IndexSet(integer: indexPath.section), with: .automatic)
    }
}

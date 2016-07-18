import UIKit

class ViewController: UIViewController {

  @IBOutlet var tableView: UITableView!

  let data: [Either<Pizza, Ad>] = fixtureMenu()

  let pizzaCellIdentifier = "pizza"
  let adCellIdentifier = "ad"

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "🍕"

    tableView.dataSource = self

    tableView.register(UITableViewCell.self, forCellReuseIdentifier: pizzaCellIdentifier)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: adCellIdentifier)
  }
}

extension ViewController: UITableViewDataSource {

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = data[indexPath.row]

    let identifier: String = {
      switch item {
      case .Left: return pizzaCellIdentifier
      case .Right: return adCellIdentifier
      }
    }()

    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

    switch item {
    case .Left(let pizza):
      configure(cell, with: pizza)
    case .Right(let ad):
      configure(cell, with: ad)
    }

    return cell
  }

  private func configure(_ cell: UITableViewCell, with pizza: Pizza) {
    cell.textLabel?.text = "\(pizza.name) ($\(pizza.price))"
  }

  private func configure(_ cell: UITableViewCell, with ad: Ad) {
    cell.textLabel?.text = ad.message
    cell.textLabel?.textColor = UIColor.white()
    cell.textLabel?.backgroundColor = UIColor.clear()
    cell.contentView.backgroundColor = ad.color
    cell.textLabel?.textAlignment = .center
  }
}

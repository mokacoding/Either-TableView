import UIKit

enum Either<A, B>{
  case Left(A)
  case Right(B)
}

struct Model {
  let price: Double
  let name: String
}

struct Ad {
  let message: String
  let color: UIColor
}

class ViewController: UIViewController {

  @IBOutlet var tableView: UITableView!

  let data: [Either<Model, Ad>] = [
    Either.Left(Model(price: 8, name: "Margherita")),
    Either.Left(Model(price: 10, name: "Capricciosa")),
    Either.Right(Ad(message: "Ad Message #1", color: UIColor.blue())),
    Either.Left(Model(price: 12, name: "Quattro Stagioni")),
    Either.Left(Model(price: 12.5, name: "Montanara")),
    Either.Left(Model(price: 11, name: "Piccante")),
    Either.Left(Model(price: 10, name: "Quattro Formaggi")),
    Either.Right(Ad(message: "Ad Message #2", color: UIColor.orange())),
    Either.Left(Model(price: 13.5, name: "Romana")),
    Either.Left(Model(price: 15, name: "Mari e Monti")),
    Either.Right(Ad(message: "Ad Message #3", color: UIColor.purple())),
    Either.Left(Model(price: 12.5, name: "Grana e Rucola")),
    Either.Left(Model(price: 11, name: "Boscaiola")),
    Either.Left(Model(price: 10.5, name: "Rustica")),
  ]

  let modelCellIdentifier = "model"
  let adCellIdentifier = "ad"

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "🍕"

    tableView.dataSource = self

    tableView.register(UITableViewCell.self, forCellReuseIdentifier: modelCellIdentifier)
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
      case .Left(_): return modelCellIdentifier
      case .Right(_): return adCellIdentifier
      }
    }()

    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

    switch item {
    case .Left(let model):
      cell.textLabel?.text = "\(model.name) ($\(model.price))"
    case .Right(let ad):
      cell.textLabel?.text = ad.message
      cell.textLabel?.textColor = UIColor.white()
      cell.textLabel?.backgroundColor = UIColor.clear()
      cell.contentView.backgroundColor = ad.color
      cell.textLabel?.textAlignment = .center
    }

    return cell
  }
}

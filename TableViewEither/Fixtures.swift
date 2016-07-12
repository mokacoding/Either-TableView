import UIKit

func fixtureMenu() -> [Either<Pizza, Ad>] {
  return [
    Either.Left(Pizza(price: 8, name: "Margherita")),
    Either.Left(Pizza(price: 10, name: "Capricciosa")),
    Either.Right(Ad(message: "Ad Message #1", color: UIColor.blue())),
    Either.Left(Pizza(price: 12, name: "Quattro Stagioni")),
    Either.Left(Pizza(price: 12.5, name: "Montanara")),
    Either.Left(Pizza(price: 11, name: "Piccante")),
    Either.Left(Pizza(price: 10, name: "Quattro Formaggi")),
    Either.Right(Ad(message: "Ad Message #2", color: UIColor.orange())),
    Either.Left(Pizza(price: 13.5, name: "Romana")),
    Either.Left(Pizza(price: 15, name: "Mari e Monti")),
    Either.Right(Ad(message: "Ad Message #3", color: UIColor.purple())),
    Either.Left(Pizza(price: 12.5, name: "Grana e Rucola")),
    Either.Left(Pizza(price: 11, name: "Boscaiola")),
    Either.Left(Pizza(price: 10.5, name: "Rustica")),
  ]
}

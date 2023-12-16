class _Optional {
  const _Optional();
}

/// To allow nullable properties in copyWith(). Inspired by Remi's Freezed
/// package.
///
/// ```dart
/// class User {
///   const User(this.name);
///
///   final String? name;
///
///   User copyWith({Object? name = optional}) {
///     return User(name == optional ? this.name : name as String?);
///   }
/// }
///
/// final user = User('John Doe'); // John Doe
/// final newUser = user.copyWith(name: null); // null
/// ```
const optional = _Optional();

/// {@template nullOrTemplate}
///
/// Better than optional becaause it gives you hint on what is the parameters
/// type.
///
/// Sample usage:
///
/// ```dart
/// class Wallet {
///   const Wallet(this.money);
///
///   final double? money;
///
///   Wallet copyWith({
///     Object? money = const NullOr<double>(),
///   }) {
///     return Wallet(money is NullOr ? this.money : money as double?);
///   }
///
///   @override
///   String toString() => money.toString();
/// }
///
/// void main() {
///   const wallet = Wallet(100);
///   print(wallet); // 100
///
///   final wallet2 = wallet.copyWith(money: 200);
///   print(wallet2); // 200
///
///   final wallet3 = wallet.copyWith(money: null);
///   print(wallet3); // null
///
///   final wallet4 = wallet.copyWith();
///   print(wallet4); // 100
/// }
/// ```
///
/// {@endtemplate}
class NullOr<T> {
  /// {@macro nullOrTemplate}
  const NullOr();
}

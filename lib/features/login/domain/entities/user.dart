import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String token;
  final String address;
  final String number;
  final int verified;

  User({@required this.id, @required this.firstName, @required this.lastName, @required this.token, this.address, this.number, this.verified})
      : super([id, firstName, lastName, token]);
}
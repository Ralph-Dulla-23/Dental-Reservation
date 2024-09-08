class Patient {
  final String id;
  String name;
  String email;

  Patient(this.id, this.name, this.email);

  @override
  String toString() => 'ID: $id, $name ,Email: $email';
}

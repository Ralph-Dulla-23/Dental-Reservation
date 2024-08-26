class Dentist{
    final String id;
    String name;

    Dentist(this.id, this.name);

    @override
    String toString() => 'Dr. $name (ID: $id)';
}
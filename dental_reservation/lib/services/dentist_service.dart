import 'package:dental_reservation/models/dentist.dart';
import 'package:riverpod/riverpod.dart';

class DentistService {
    final Ref container;
    final List<Dentist> _dentists = [];

    DentistService(this.container);

    void addDentist(String id, String name) {
        final newDentist = Dentist(id, name);
        _dentists.add(newDentist);
        print('ID: $id \nName:$name \nhas been added');
    }

    void viewDentists() {
        if (_dentists.isEmpty) {
        print('No dentists found');
      } else {
        print('Dentists:');
        for (var dentist in _dentists) {
            print(dentist);
            }
        }
    }
    
    void removeDentist(String id) {
        try {
            final dentistToRemove = _dentists.firstWhere(
                (dentist) => dentist.id == id
            );
            _dentists.remove(dentistToRemove);
            print('Dentist removed successfully');
        } catch (e) {
            print('Dentist not found');
        }
    }

    List<Dentist> get dentists => _dentists;
}
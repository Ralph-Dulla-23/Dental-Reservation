import 'package:dental_reservation/models/dentist.dart';
import 'package:riverpod/riverpod.dart';

class DentistService {
    final Ref container;
    final List<Dentist> _dentists = [];

    DentistService(this.container);

    void addDentist(String id, String name) {
        final newDentist = Dentist(id, name);
        _dentists.add(newDentist);
        print('$name added');
    }

    void viewDentists() {
        if (_dentists.isEmpty) {
            print('No dentists found');
        } else {
            print('Dentists:');
            for (var dentist in _dentists) {
                print(dentist)
            }
        }
    }

    void removeDentist(String id) {
        final newRemoveDentist = _dentists.removeWhere((dentist) => dentist.id == id, orElse: () => null);
        if (newRemoveDentist != null) {
            _dentists.remove(newRemoveDentist);
            print('Dentist removed successfully');
        } else {
            print('Dentist not found');
        }
    }

    List<Dentist> get dentists => _dentists;
}
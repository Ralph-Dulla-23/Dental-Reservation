import 'package:riverpod_sample/models/dentist.dart';
import 'package:riverpod/riverpod.dart';

class DentistService {
    final Ref container;
    final List<Dentist> _dentists = [];

    DentistService(this.container);

    void addDentist(String id, String name) {
        final newDentist = Dentist(id, name);
        _dentists.add(newDentist);
        print('ID: $id, Name:$name added');
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

 

    List<Dentist> get dentists => _dentists;
}
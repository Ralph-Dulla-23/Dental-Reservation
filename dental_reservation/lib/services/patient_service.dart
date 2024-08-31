import 'package:dental_reservation/models/patient.dart';
import 'package:riverpod/riverpod.dart';

class PatientService {
    final Ref container;
    final List<Patient> _patients = [];

    PatientService(this.container);

    void addPatient(String id, String name, String email) {
        final newPatient = Patient(id, name, email);
        _patients.add(newPatient);
        print('$name (Email $email) added');
    }

    void viewPatients() {
        if (_patients.isEmpty) {
            print('No patients found');
        } else {
            print('Patients:');
            for (var patient in _patients) {
                print(patient)
            }
        }
    }

    void removePatient(String id) {
        final newRemovePatient = _patients.removeWhere((patient) => patient.id == id, orElse: () => null);
        if (newRemovePatient != null) {
            _patients.remove(newRemovePatient);
            print('Patient removed successfully');
        } else {
            print('Patient not found');
        }
    }
    List<Patient> get patients => _patients;
}
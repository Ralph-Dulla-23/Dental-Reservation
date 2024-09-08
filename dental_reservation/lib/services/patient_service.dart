import 'package:riverpod_sample/models/patient.dart';
import 'package:riverpod/riverpod.dart';

class PatientService {
  final Ref container;
  final List<Patient> _patients = [];

  PatientService(this.container);

  void addPatient(final String id,String name, String email) {
    final newPatient = Patient(id,name, email);
    _patients.add(newPatient);
    print('Name: $name, EmailL $email, Id: $id has been added.');
  }

  void viewPatient() {
    if (_patients.isEmpty) {
      print('No customers available.');
    } else {
      print('Customers: ');
      for (var patient in _patients) {
        print(patient);
      }
    }
  }

void removePatient(final String id) {
  try {
    final patientToRemove = _patients.firstWhere(
      (patient) => patient.id == id,
    );
    _patients.remove(patientToRemove);
    print('Patient removed successfully.');
  } catch (e) {
    print('Patient not found.');
  }
}

  List<Patient> get patients => _patients;
}

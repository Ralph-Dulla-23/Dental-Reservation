import 'package:collection/collection.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_sample/global_providers.dart';
import 'package:riverpod_sample/models/appointment.dart';

class AppointmentService {
  final Ref container;
  List<Appointment> _appointments = [];

  AppointmentService(this.container);

  void addAppointment(String patientName, String dentistName, DateTime appointmentDate) {
  final patientService = container.read(patientServiceProvider);
  final dentistService = container.read(dentistServiceProvider);

  final patient = patientService.patients.firstWhereOrNull(
    (patient) => patient.name == patientName,
  );

  final dentist = dentistService.dentists.firstWhereOrNull(
    (dentist) => dentist.name == dentistName,
  );

  if (patient != null && dentist != null) {
    final newAppointment = Appointment(patient.id, patient.id, dentist, appointmentDate);
    _appointments.add(newAppointment);
    print('${patient.name} has made an appointment with ${dentist.name} on ${appointmentDate.toLocal()}');
  } else {
    print('Patient or dentist not found. Cannot make reservation.');
  }
}



  void viewAppointments() {
    if (_appointments.isEmpty) {
      print('No appointments available.');
    } else {
      print('Appointments:');
      for (var appointment in _appointments) {
        print(appointment);  // This will call toString() method of Appointment
      }
    }
  }


  List<Appointment> get appointments => _appointments;
}
import 'package:collection/collection.dart';
import 'package:riverpod/riverpod.dart';
import 'package:dental_reservation/global_providers.dart';
import 'package:dental_reservation/models/appointment.dart';

class AppointmentService {
  final Ref container;
  List<Appointment> _appointments = [];

  AppointmentService(this.container);

  void addAppointment(String patientId, String dentistId, DateTime appointmentDate) {
  final patientService = container.read(patientServiceProvider);
  final dentistService = container.read(dentistServiceProvider);

  final patient = patientService.patients.firstWhereOrNull(
    (patient) => patient.id == patientId,
  );

  final dentist = dentistService.dentists.firstWhereOrNull(
    (dentist) => dentist.id == dentistId,
  );

  if (patient != null && dentist != null) {
    final newAppointment = Appointment(patient.id, dentist.id, dentist, appointmentDate);
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

  void removeAppointment(String id) {
    try {
      final appointmentToRemove = _appointments.firstWhere(
        (appointment) => appointment.id == id,
      );
      _appointments.remove(appointmentToRemove);
      print('Appointment removed successfully.');
    } catch (e) {
      print('Appointment not found.');
    }
  }

  List<Appointment> get appointments => _appointments;
}
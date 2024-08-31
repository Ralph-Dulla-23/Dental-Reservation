import 'package:dental_reservation/models/appointment.dart';
import 'package:dental_reservation/models/dentist.dart';
import 'package:riverpod/riverpod.dart';

class AppointmentService {
    final Ref container;
    final List<Appointment> _appointments = [];
    
    AppointmentService(this.container);

    void addAppointment(String id, String patientId, String dentistId, DateTime appointmentDate) {
        final newAppointment = Appointment(id, patientId, dentistId, appointmentDate);
        _appointments.add(newAppointment);
        print('Appointment added');
    }

    void viewAppointments() {
        if (_appointments.isEmpty) {
            print('No appointments found');
        } else {
            print('Appointments:');
            for (var appointment in _appointments) {
                print(appointment)
            }
        }
    }

    void deleteAppointment(String id) {
        final newDeleteAppointment = _appointments.removeWhere((appointment) => appointment.id == id, orElse: () => null);
        if (newDeleteAppointment != null) {
            _appointments.remove(newDeleteAppointment);
            print('Appointment deleted successfully');  
        } else {
            print('Appointment not found');
        }
    List<Appointment> get appointments => _appointments;
}
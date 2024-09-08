import 'dentist.dart';
import 'patient.dart';

class Appointment {
  String id;
  String patientId;  
  Dentist dentist;   
  DateTime appointmentDate;

  Appointment(this.id, this.patientId, this.dentist, this.appointmentDate);

  @override
  String toString() {
    return 'Appointment(ID: $id) - Patient ID: $patientId with Dr. ${dentist.name} on $appointmentDate';
  }
}

import 'dentist.dart';
import 'patient.dart';

class Appointment{
    String id;
    String patientid;
    String dentist;
    DateTime appointmentDate;
    String status;

    Appointment(this.id, this.patientid, this.appointmentDate, this.status ='scheduled' );

   @override
   String toString() {
    return 'Appointment(ID: $id) - ${patient.name} with Dr. ${dentist.name} on $appointmentDate';
  }
}
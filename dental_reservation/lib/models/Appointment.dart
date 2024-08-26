class Appointment{
    String id;
    String patientid;
    String dentist;
    DateTime appointmentDate;
    String status;

    Appointment(this.id, this.patientid, this.appointmentDate, this.status ='scheduled' );

    @override
    String toString() {
        return 
    }
     'Appointment(ID: $id, Patient ID: $patientid, Date: $appointmentDate, Status: $status)';
}

import 'package:riverpod/riverpod.dart';
import 'package:dental_reservation/services/patient_service.dart';
import 'package:dental_reservation/services/dentist_service.dart';
import 'package:dental_reservation/services/appointment_service.dart';

final patientServiceProvider = Provider((ref) => PatientService(ref));
final dentistServiceProvider = Provider((ref) => DentistService(ref));
final appointmentServiceProvider = Provider((ref) => AppointmentService(ref));
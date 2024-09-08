import 'package:flutter_riverpod/riverpod.dart';
import 'services/patient_service.dart';
import 'services/dentist_service.dart';
import 'services/appointment_service.dart';

final patientServiceProvider = Provider((ref) => PatientService(ref));
final dentistServiceProvider = Provider((ref) => DentistService(ref));
final appointmentServiceProvider = Provider((ref) => AppointmentService(ref));
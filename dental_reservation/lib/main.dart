import 'dart:io';

import 'package:riverpod/riverpod.dart';
import 'package:dental_reservation/global_providers.dart';

void main() {
  final container = ProviderContainer();
  final dentistService = container.read(dentistServiceProvider);
  final patientService = container.read(patientServiceProvider);
  final appointmentService = container.read(appointmentServiceProvider);

  while (true) {
    print('\nDental Reservation System');
    print('1. Register Patient');
    print('2. View all Patients');
    print('3. Delete Patient');
    print('4. Register Dentist');
    print('5. View all Dentists');
    print('6. Delete Dentist');
    print('7. Make an Appointment');
    print('8. View all Appointments');
    print('9. Delete Appointment');
    print('10. Exit');
    print('Enter your choice:');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Enter the customer ID:');
        String? id = stdin.readLineSync();
        print('Enter the customer name:');
        String? name = stdin.readLineSync();
        print('Enter the customer email:');
        String? email = stdin.readLineSync();
        if (id != null && 
            name != null &&
            email != null &&
            name.isNotEmpty &&
            email.isNotEmpty) {
          patientService.addPatient(id, name, email);
        } else {
          print('Invalid input. Please try again.');
        }
        break;
      case '2':
        patientService.viewPatient();
        break;
      case '3':
        print('Enter the Patient ID to delete:');
        String? id = stdin.readLineSync();
        if (id != null && id.isNotEmpty) {
          patientService.removePatient(id);
        } else {
          print('Invalid input. Please try again.');
        }
        break;
      case '4':
        print('Enter Dentist ID:');
        String? id = stdin.readLineSync();
        print('Enter Dentist name:');
        String? name =stdin.readLineSync();
        if (id != null && name != null && id.isNotEmpty && name.isNotEmpty) {
          dentistService.addDentist(id, name);
        } else {
          print('Invalid input. Please try again.');
        }
        break;
      case '5':
        dentistService.viewDentists();
        break;
      case '6':
        // print('Enter the Dentist ID to delete:');
        // String? id = stdin.readLineSync();
        // if (id != null && id.isNotEmpty) {
        //   dentistService.removeDentist(id);
        // } else {
        //   print('Invalid input. Please try again.');
        // }
        // break;
      case '7':
        print('Enter Patient ID:');
        String? patientId = stdin.readLineSync();
        print('Enter Dentist ID:');
        String? dentistId = stdin.readLineSync();
        print('Enter Appointment Date (YYYY-MM-DD HH:MM):');
        String? appointmentDate = stdin.readLineSync();
        if (patientId != null && dentistId != null && appointmentDate != null) {
          appointmentService.addAppointment(patientId, dentistId, DateTime.parse(appointmentDate));
        } else {
          print('Invalid input. Please try again.');
        }
        break;

      case '8':
        appointmentService.viewAppointments();
        break;
      case '9':
        // print('Enter the Appointment ID to delete:');
        // String? id = stdin.readLineSync();
        // if (id != null && id.isNotEmpty) {
        //   appointmentService.removeAppointment(id);
        // } else {
        //   print('Invalid input. Please try again.');
        // }
        break;
      case '10':
        print('Exiting the application...');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
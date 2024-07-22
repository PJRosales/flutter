import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clinic Appointment Scheduler',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const AppointmentScheduler(),
    );
  }
}

class AppointmentScheduler extends StatefulWidget {
  const AppointmentScheduler({super.key});

  @override
  State<AppointmentScheduler> createState() => _AppointmentSchedulerState();
}

class _AppointmentSchedulerState extends State<AppointmentScheduler> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();

  CalendarController _calendarController = CalendarController();

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _contactNumberController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clinic Appointment Scheduler'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _contactNumberController,
                decoration: const InputDecoration(
                  labelText: 'Contact Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TableCalendar(
                controller: _calendarController,
                initialCalendarFormat: CalendarFormat.month,
                formatAnimation: FormatAnimation.slide,
                startingDayOfWeek: StartingDayOfWeek.monday,
                availableGestures: AvailableGestures.all,
                availableCalendarFormats: const {
                  CalendarFormat.month: '',
                  CalendarFormat.week: '',
                },
                calendarStyle: CalendarStyle(
                  selectedColor: Colors.deepOrange[400],
                  selectedTextStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                headerStyle: HeaderStyle(
                  formatButtonTextStyle:
                      TextStyle(fontSize: 15.0, color: Colors.white),
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.deepOrange[400],
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                onDaySelected: (day, events, holidays) {
                  setState(() {
                    _dateController.text = DateFormat.yMMMd().format(day);
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _timeController,
                decoration: const InputDecoration(
                  labelText: 'Time',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a time';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Schedule appointment logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Appointment scheduled successfully'),
                      ),
                    );
                  }
                },
                child: const Text('Schedule Appointment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:play_store_app/Components/Acoount_widgets.dart';
import 'package:intl/intl.dart';
import 'package:play_store_app/Components/pembayaran.dart';

class CustomDrawer extends StatefulWidget {
  final void Function(int) onMenuItemClicked;

  const CustomDrawer({
    Key? key,
    required this.onMenuItemClicked,
  }) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _showSettings = false;
  bool _isDateTimeEnabled = false;
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _toggleSettings() {
    setState(() {
      _showSettings = !_showSettings;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    if (_isDateTimeEnabled) {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (pickedDate != null && pickedDate != _selectedDate) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    if (_isDateTimeEnabled) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: _selectedTime,
      );
      if (pickedTime != null && pickedTime != _selectedTime) {
        setState(() {
          _selectedTime = pickedTime;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
    final String formattedTime = _selectedTime.format(context);

    return Drawer(
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/app_ic_PlayStore.png',
                          height: 80,
                          width: 80,
                        ),
                        SizedBox(width: 18),
                        Text(
                          'Playstore',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Date: $formattedDate',
                      style: TextStyle(
                        color: Color.fromARGB(255, 238, 234, 234),
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      'Time: $formattedTime',
                      style: TextStyle(
                        color: Color.fromARGB(255, 238, 234, 234),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.subscriptions,
                    color: Color.fromARGB(255, 1, 58, 61)),
                title: Text('Subscriptions', style: TextStyle(fontSize: 14)),
                onTap: () {
                  widget.onMenuItemClicked(1);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite_border,
                    color: Color.fromARGB(255, 1, 58, 61)),
                title: Text('WishList', style: TextStyle(fontSize: 14)),
                onTap: () {
                  widget.onMenuItemClicked(2);
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle,
                    color: Color.fromARGB(255, 1, 58, 61)),
                title: Text('Accounts', style: TextStyle(fontSize: 14)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProfileSettingsPage()),
                  );
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.payment, color: Color.fromARGB(255, 1, 58, 61)),
                title: Text('Payment methods', style: TextStyle(fontSize: 14)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pembayaran()),
                  );
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.security, color: Color.fromARGB(255, 1, 58, 61)),
                title: Text('Play Protect', style: TextStyle(fontSize: 14)),
                onTap: () {
                  widget.onMenuItemClicked(5);
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.settings, color: Color.fromARGB(255, 1, 58, 61)),
                title: Text('Settings', style: TextStyle(fontSize: 14)),
                onTap: () {
                  _toggleSettings();
                },
              ),
              if (_showSettings) ...[
                Divider(),
                SwitchListTile(
                  title: Text('Enable Date/Time Selection',
                      style: TextStyle(fontSize: 14)),
                  value: _isDateTimeEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _isDateTimeEnabled = value;
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.calendar_today,
                      color: Color.fromARGB(255, 1, 58, 61)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Select Date', style: TextStyle(fontSize: 14)),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                  onTap: () {
                    _selectDate(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.access_time,
                      color: Color.fromARGB(255, 1, 58, 61)),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Select Time', style: TextStyle(fontSize: 14)),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                  onTap: () {
                    _selectTime(context);
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

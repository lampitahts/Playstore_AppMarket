import 'package:flutter/material.dart';
import 'package:play_store_app/Components/kelola_aplikasi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:play_store_app/models/app_data.dart';

class InstallApp extends StatefulWidget {
  final Function(List<String>) onUpdateAppList;
  final List<String> installedApps = [];

  InstallApp({required this.onUpdateAppList});

  @override
  _InstallAppState createState() => _InstallAppState();
}

class _InstallAppState extends State<InstallApp> {
  List<String> _selectedApps = [];
  late SharedPreferences prefs;
  Map<String, bool> _isCheckedMap = {};
  bool _showDropdown = false;
  Map<String, bool> _isUpdatingMap = {};
  Map<String, bool> _isUpdatedMap = {};
  String _selectedSort = 'Baru diupdate';

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedApps = widget.installedApps;
    _loadInstalledApps();
  }

  _loadInstalledApps() async {
    prefs = await SharedPreferences.getInstance();
    List<String>? installedApps = prefs.getStringList('installApp');
    if (installedApps != null) {
      setState(() {
        _selectedApps = installedApps;
        _selectedApps.forEach((app) {
          _isCheckedMap[app] = false;
          _isUpdatingMap[app] = false;
          _isUpdatedMap[app] = false;
        });
        widget.onUpdateAppList(_selectedApps);
      });
    }
  }

  void _sortApps(String sortType) {
    setState(() {
      _selectedSort = sortType;
      switch (sortType) {
        case 'Nama':
          _selectedApps.sort();
          break;
        case 'Paling sering digunakan':
          _selectedApps.sort((a, b) =>
              _getAppInstallDate(b)!.compareTo(_getAppInstallDate(a)!));
          break;
        case 'Paling jarang digunakan':
          _selectedApps.sort((a, b) =>
              _getAppInstallDate(a)!.compareTo(_getAppInstallDate(b)!));
          break;
        case 'Ukuran':
          _selectedApps
              .sort((a, b) => _getAppSize(b)!.compareTo(_getAppSize(a)!));
          break;
        case 'Baru diupdate':
          _selectedApps.sort(
              (a, b) => _getAppUpdateDate(b)!.compareTo(_getAppUpdateDate(a)!));
          break;
        // case 'Update':
        //   _selectedApps.sort((a, b) =>
        //       _getAppUpdateTime(b)!.(_getAppUpdateTime(a)!));
        //   break;
        default:
          break;
      }
    });
  }

  DateTime? _getAppInstallDate(String appName) {
    return DateTime.now()
        .subtract(Duration(days: _selectedApps.indexOf(appName) * 10));
  }

  DateTime? _getAppUpdateDate(String appName) {
    return DateTime.now()
        .subtract(Duration(days: _selectedApps.indexOf(appName) * 5));
  }

  TimeOfDay? _getAppUpdateTime(String appName) {
    return TimeOfDay(hour: _selectedApps.indexOf(appName) % 24, minute: 0);
  }

  double? _getAppSize(String appName) {
    return 20.0 + _selectedApps.indexOf(appName) * 5.0;
  }

  void _addInstalledApps(List<String> installedApps) {
    setState(() {
      _selectedApps.addAll(installedApps);
    });
  }

  void _toggleDropdown() {
    setState(() {
      _showDropdown = !_showDropdown;
    });
  }

  void _showCheckboxes() {
    setState(() {
      _showDropdown = false;
    });
  }

  void _hideAll() {
    setState(() {
      _showDropdown = false;
    });
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Kelola aplikasi & perangkat'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pilih perangkat',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KelolaAplikasi(),
                        ),
                      );
                    },
                    child: Text(
                      'kelola',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.phone_android),
                                  title: Text('Perangkat ini'),
                                  onTap: () {
                                    setState(() {
                                      _showCheckboxes();
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.cancel_outlined),
                                  title: Text('Tidak diinstal'),
                                  onTap: () {
                                    setState(() {
                                      _hideAll();
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Pilih Perangkat'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showDropdown = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(color: Colors.white),
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text('Update Tersedia'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(color: Colors.white),
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text('Game'),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(color: Colors.white),
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text('Diarsipkan'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Aplikasi (${_selectedApps.length})',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton<String>(
                    value: _selectedSort,
                    underline: SizedBox(),
                    items: <String>[
                      'Baru diupdate',
                      'Nama',
                      'Paling sering digunakan',
                      'Paling jarang digunakan',
                      'Ukuran',
                      'Update'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        if (newValue == 'Baru diupdate' ||
                            newValue == 'Update') {
                          _pickTime(context);
                        } else if (newValue == 'Paling sering digunakan' ||
                            newValue == 'Paling jarang digunakan') {
                          _pickDate(context);
                        } else {
                          _sortApps(newValue);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: appGamesData
                    .where((app) => _selectedApps.contains(app['name']))
                    .map<Widget>((app) {
                  return _buildAppItem(
                    imageUrl: app['imageUrl'],
                    title: app['name'],
                    size: app['Size'],
                    date: DateTime.now().toString(),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: appBooksData
                    .where((app) => _selectedApps.contains(app['name']))
                    .map<Widget>((app) {
                  return _buildAppItem(
                    imageUrl: app['imageUrl'],
                    title: app['name'],
                    size: app['Size'],
                    date: DateTime.now().toString(),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: topcharts
                    .where((app) => _selectedApps.contains(app['name']))
                    .map<Widget>((app) {
                  return _buildAppItem(
                    imageUrl: app['imageUrl'],
                    title: app['name'],
                    size: app['Size'],
                    date: DateTime.now().toString(),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: childrenZone
                    .where((app) => _selectedApps.contains(app['name']))
                    .map<Widget>((app) {
                  return _buildAppItem(
                    imageUrl: app['imageUrl'],
                    title: app['name'],
                    size: app['Size'],
                    date: DateTime.now().toString(),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppItem({
    required String imageUrl,
    required String title,
    required String size,
    required String date,
  }) {
    double sizeInMB;
    if (size.contains('GB')) {
      sizeInMB = double.parse(size.replaceAll(' GB', '')) * 1024;
    } else {
      sizeInMB = double.parse(size.replaceAll(' MB', ''));
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              imageUrl,
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _showDropdown
                        ? _isUpdatingMap[title] == true
                            ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.indigo),
                              )
                            : DropdownButton<String>(
                                value: null,
                                hint: _isUpdatedMap[title] == true
                                    ? Text('Terupdate')
                                    : Text('Update'),
                                items: [
                                  DropdownMenuItem(
                                    value: 'Update',
                                    child: Text('Update'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Remove',
                                    child: Text('Remove'),
                                  ),
                                ],
                                onChanged: (String? value) {
                                  if (value == 'Remove') {
                                    _confirmDelete(context, title);
                                  } else {
                                    _updateApp(title);
                                  }
                                },
                              )
                        : Tooltip(
                            message: 'Hapus',
                            child: Checkbox(
                              value: _isCheckedMap[title] ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isCheckedMap[title] = value ?? false;
                                  if (_isCheckedMap[title]!) {
                                    _confirmDelete(context, title);
                                  }
                                });
                              },
                            ),
                          ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  '${sizeInMB.toStringAsFixed(2)} MB • $date',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Apakah Anda ingin menghapus aplikasi ini?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                _deleteApp(title);
                Navigator.of(context).pop();
              },
              child: Text('Hapus'),
            ),
          ],
        );
      },
    );
  }

  void _setUpdatedText(String title) {
    setState(() {
      _isUpdatingMap[title] = false;
      _isCheckedMap[title] = false; // Ensure checkbox is not affected
      _isUpdatedMap[title] = true; // Set the app as updated
    });
  }

  void _updateApp(String title) {
    setState(() {
      _isUpdatingMap[title] = true;
    });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isUpdatingMap[title] = false;
        _setUpdatedText(title);
      });
    });
  }

  void _deleteApp(String appName) {
    setState(() {
      _selectedApps.remove(appName);
      _isCheckedMap.remove(appName);
      _isUpdatedMap.remove(appName); // Remove the updated status
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Aplikasi $appName telah dihapus.'),
        action: SnackBarAction(
          label: 'Urungkan',
          onPressed: () {
            setState(() {
              _selectedApps.add(appName);
            });
          },
        ),
      ),
    );
    _saveInstalledApps();
    widget.onUpdateAppList(_selectedApps);
  }

  _saveInstalledApps() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setStringList('installApp', _selectedApps);
  }
}

class SingleChoiceDialog extends StatefulWidget {
  const SingleChoiceDialog({Key? key}) : super(key: key);

  @override
  SingleChoiceDialogState createState() => SingleChoiceDialogState();
}

class SingleChoiceDialogState extends State<SingleChoiceDialog> {
  String? selectedRingtone = "None";
  List<String> ringtone = [
    "Konten seksual",
    "Mengandung Kekerasan",
    "Konten kebencian atau pelecehan",
    "Rating konten tidak sesuai",
    "keberatanlainnya"
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AlertDialog(
      title: Text(
        'Alasan Anda menganggap konten atau aplikasi ini tidak pantas',
        style: textTheme.headlineSmall,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: ringtone.map((r) {
            return RadioListTile(
              title: Text(r),
              groupValue: selectedRingtone,
              value: r,
              onChanged: (dynamic val) {
                setState(() {
                  selectedRingtone = val;
                });
              },
            );
          }).toList(),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(selectedRingtone);
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}

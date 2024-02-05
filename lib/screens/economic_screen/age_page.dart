import 'package:flutter_holo_date_picker/date_time_formatter.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class Age extends StatefulWidget {
  const Age({super.key});

  @override
  State<Age> createState() => _AgeState();
}

class _AgeState extends State<Age> {
  DateTime? _dateOfBirth = DateTime(2010, 12, 10);
  DateTime today = DateTime.now();

  void _showDatePickerModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Date of birth'),
            DatePickerWidget(
              locale: DateTimePickerLocale.en_us,
              looping: true,
              lastDate: _dateOfBirth,
              dateFormat: "dd : MMM : yyyy",
              onChange: (DateTime newDate, _) {
                _dateOfBirth = newDate;
              },
              pickerTheme: DateTimePickerTheme(
                backgroundColor: Colors.transparent,
                dividerColor: Colors.transparent,
                itemTextStyle: TextStyle(
                  fontFamily: 'NotoSansTC',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_dateOfBirth != null) {
                      setState(() {
                        _dateOfBirth;
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Date of birth'),
              TextButton(
                onPressed: () {
                  _showDatePickerModal();
                },
                child: Text('$_dateOfBirth'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Today'),
              TextButton(
                onPressed: () {},
                child: Text('$today'),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
            ),
            child: const Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text('age'),
                          Text('13 years'),
                          Text('3 month | 20 days'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: VerticalDivider(
                        thickness: 1,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('Next birthday'),
                          Text('Friday'),
                          Text('8 month | 10 days'),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                ),
                Column(
                  children: [
                    Text('Summary'),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Text('Years'),
                                    Text('13'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Days'),
                                    Text('4860'),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Text('Month'),
                                    Text('159'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Hours'),
                                    Text('116640'),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Column(
                                  children: [
                                    Text('Weeks'),
                                    Text('694'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Minutes'),
                                    Text('6998400'),
                                  ],
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

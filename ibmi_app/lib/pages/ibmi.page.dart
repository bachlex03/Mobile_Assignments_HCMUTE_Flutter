import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibmi_app/widgets/info-card.widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IBMIPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IBMIPageState();
  }
}

class _IBMIPageState extends State<IBMIPage> {
  double? _deviceWidth, _deviceHeight;

  double _age = 25, _weight = 60;
  int _height = 60, _gender = 0;
  double _bmi = 0;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;

    return CupertinoPageScaffold(
      child: Container(
        height: _deviceHeight! * 0.85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [_ageCard(), _weightCard()],
            ),
            _sliderCard(),

            _genderCard(),
            _buttonWidget(),
          ],
        ),
      ),
    );
  }

  Widget _ageCard() {
    return InfoCard(
      width: _deviceWidth! * 0.40,
      height: _deviceHeight! * 0.20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Age",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          Text(
            _age.toString(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 50,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      _age--;
                    });
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      _age++;
                    });
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _weightCard() {
    return InfoCard(
      width: _deviceWidth! * 0.40,
      height: _deviceHeight! * 0.20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Weight",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          Text(
            _weight.toString(),
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 50,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      _weight--;
                    });
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      _weight++;
                    });
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(fontSize: 25, color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sliderCard() {
    return InfoCard(
      width: _deviceWidth! * 0.95,
      height: _deviceHeight! * 0.15,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Height",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              _height.toString(),
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: _deviceWidth! * 0.90,
              child: CupertinoSlider(
                min: 0,
                max: 90,
                divisions: 90,
                value: _height.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _height = value.toInt();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _genderCard() {
    return InfoCard(
      width: _deviceWidth! * 0.95,
      height: _deviceHeight! * 0.15,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Gender",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            SizedBox(
              width: _deviceWidth! * 0.40,
              child: CupertinoSlidingSegmentedControl(
                groupValue: _gender,
                children: const {0: Text("Male"), 1: Text("Female")},
                onValueChanged:
                    (value) => {
                      setState(() {
                        _gender = value as int;
                      }),
                    },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonWidget() {
    return Container(
      width: _deviceWidth! * 0.90,
      child: CupertinoButton.filled(
        child: const Text("Calculate BMI"),
        onPressed: () {
          if (_age > 0 && _weight > 0 && _height > 0) {
            _bmi = 703 * (_weight / pow(_height, 2));

            _showResultDialog(_bmi);
          }
        },
      ),
    );
  }

  void _showResultDialog(double _bmi) {
    String? _status;
    if (_bmi < 18.5) {
      _status = "Underweight";
    } else if (_bmi >= 18.5 && _bmi < 25) {
      _status = "Normal";
    } else if (_bmi >= 25 && _bmi < 30) {
      _status = "Overweight";
    } else if (_bmi >= 30) {
      _status = "Obese";
    }
    showCupertinoDialog(
      context: context,
      builder: (BuildContext _context) {
        return CupertinoAlertDialog(
          title: Text(_status!),
          content: Text(_bmi.toStringAsFixed(2)),
          actions: [
            CupertinoDialogAction(
              child: const Text('Ok'),
              onPressed: () {
                _saveResult(_bmi.toString(), _status!);
                Navigator.pop(_context);
              },
            ),
          ],
        );
      },
    );
  }

  void _saveResult(String _bmi, String _status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('bmi_date', DateTime.now().toString());
    await prefs.setStringList('bmi_data', <String>[_bmi, _status]);
  }
}

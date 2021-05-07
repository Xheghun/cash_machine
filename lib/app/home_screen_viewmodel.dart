import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class HomeScreenViewmodel extends ChangeNotifier {
  TextEditingController ammountController = TextEditingController();
  List<num> _notesDespensed = [];

  List<num> get notesDespensed => _notesDespensed;

  void validateInput(BuildContext context) {
    String ammount = ammountController.text.trim();
    if (ammount.isNotEmpty) {
      if (isNumeric(ammount)) {
        //valid input
        cashOut(int.parse(ammount));
      }
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Invalid Input")));
  }

  cashOut(int value) {
    //empty list
    _notesDespensed = [];

    var availableNotes = [200, 100, 50, 20, 10, 5];
    int index;

    num ammount = value;

    for (index = 0; index < availableNotes.length; index++) {
      int numTimes = (ammount / availableNotes[index])
          .truncate(); //truncate removes any fractional value i.e 4.5 == 4
      if (numTimes > 0) {
        //add despensed ammount to despended list
        _notesDespensed.addAll(List.filled(numTimes, availableNotes[index]));
        //subtract despensed ammount from input ammount
        ammount -= availableNotes[index] * numTimes;
      }
    }

    notifyListeners();
  }
}

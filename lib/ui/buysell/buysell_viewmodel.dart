import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BuySellViewModel extends BaseViewModel {
  String chosenValue = 'BTC';
  TextEditingController fiti5EditingController = TextEditingController();
  TextEditingController covertedEditingController = TextEditingController();
  double usd = 72,
      fiti5 = 100,
      token = 324.34,
      percentageToken = 0.0,
      prebonusToken = 0.0,
      totalToken = 0.0;

  void setChooseVal(String? value) {
    if (value != null) {
      chosenValue = value;
      notifyListeners();
    }
  }

  void setToken(double i) {
    fiti5 = i;
    fiti5EditingController.text = i.toString();
    // setFiti5Token();
    if (i == 10) {
      fiti5EditingController.text = '1000';
      prebonusToken = 1000 * token;
      percentageToken = (i * prebonusToken) / 100;
      totalToken = prebonusToken + percentageToken;
      return;
    } else if (i == 20) {
      fiti5EditingController.text = '2000';
      prebonusToken = 2000 * token;
      percentageToken = (i * prebonusToken) / 100;
      totalToken = prebonusToken + percentageToken;
    } else if (i == 40) {
      fiti5EditingController.text = '4000';
      prebonusToken = 4000 * token;
      percentageToken = (i * prebonusToken) / 100;
      totalToken = prebonusToken + percentageToken;
    } else if (i == 60) {
      fiti5EditingController.text = '6000';
      prebonusToken = 6000 * token;
      percentageToken = (i * prebonusToken) / 100;
      totalToken = prebonusToken + percentageToken;
    } else if (i == 80) {
      fiti5EditingController.text = '8000';
      prebonusToken = 8000 * token;
      percentageToken = (i * prebonusToken) / 100;
      totalToken = prebonusToken + percentageToken;
    } else if (i == 100) {
      fiti5EditingController.text = '10000';
      prebonusToken = 10000 * token;
      percentageToken = (i * prebonusToken) / 100;
      totalToken = prebonusToken + percentageToken;
    } else {
      fiti5EditingController.text = i.toString();
      prebonusToken = i * token;
      percentageToken = 0;
      totalToken = prebonusToken + percentageToken;
    }

    notifyListeners();
  }

  void setConvertToken(double i) {
    fiti5 = i;
    covertedEditingController.text = i.toString();
    setFiti5Token();
    notifyListeners();
  }

  void setFiti5Token() {
    final val = convertToken(usd, fiti5);
    covertedEditingController.text = val.toStringAsFixed(8);
  }

  double convertToken(double num1, double num2) {
    double result = num2 * num1;
    return result;
  }

  void setListeners() {
    fiti5EditingController.text = '0';
    covertedEditingController.text = '1';

    fiti5EditingController.addListener(() {
      if (fiti5EditingController.text != '') {
        if (fiti5EditingController.text.length <= 10) {
          double value = double.parse(fiti5EditingController.text);
          prebonusToken = value * token;
          percentageToken = 0;
          totalToken = prebonusToken + percentageToken;
          notifyListeners();
        }
      }
    });
  }

  void disposeListener() {
    fiti5EditingController.dispose();
    covertedEditingController.dispose();
  }

  void onButtonClick(BuildContext context) {
    if (fiti5EditingController.text != '' &&
        covertedEditingController.text != '') {
      double fiti5Num = double.parse(fiti5EditingController.text);
      double covertNum = double.parse(covertedEditingController.text);
      if (fiti5 > 0 && covertNum > 0) {
        print('done');
      } else {
        const snackBar =
            SnackBar(content: Text('Please enter the token amount!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      const snackBar =
          SnackBar(content: Text('Please enter the token amount!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

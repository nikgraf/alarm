import 'dart:async';
import 'package:polymer/polymer.dart';
import 'package:observe/observe.dart';

class CountdownClock extends CustomElement with ObservableMixin {

  static final oneSecond = new Duration(seconds: 1);
  @observable var timeLeft = new Duration(seconds: 72);

  /*
   * Initialize the timer who updates the duration periodically
   * when the component has been added to the DOM.
   */
  void inserted() {
    new Timer.periodic(oneSecond, _updateTimeLeft);
  }

  /*
   * Update timeLeft until 0 seconds left.
   */
  void _updateTimeLeft(Timer _) {
    if (timeLeft > new Duration(seconds: 0)) {
      timeLeft = timeLeft - oneSecond;
    }
  }

}
import 'package:flutter/material.dart';
import 'package:osama_core/osama_core.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';

extension TimerUtils on CurrentRemainingTime {
  String getRemainingTime() {
    String min = '';
    String sec = '';
    if(this.sec == null){
      sec = '00';
    } else if(this.sec! < 10){
      sec = '0${this.sec}';
    }else {
      sec = '${this.sec}';
    }
    if(this.min == null){
      min = '00';
    } else {
      min = '0${this.min}';
    }
    return '$min:$sec';
  }
}

class TimeUtils {

  static String getTimeString(CurrentRemainingTime? time, BuildContext context) {
    final currentTime = time?.getRemainingTime();
    if(currentTime?.contains('00:') ?? false) {
      return context.l10n.secondOfTime;
    } else if(currentTime?.contains('01:') ?? false) {
      return context.l10n.minute;
    }
    else if(currentTime?.contains('02:') ?? false) {
      return context.l10n.twoMinutes;
    } else if(currentTime!.contains('03:')
        || currentTime.contains('04:') || currentTime.contains('05:') || currentTime.contains('06:')
        || currentTime.contains('07:') || currentTime.contains('08:') || currentTime.contains('09:')
        || currentTime.contains('10:')) {
      return context.l10n.mins;
    }
    else {
      return context.l10n.minute;
    }
  }

  static String getTimerStringValue(BuildContext context, {required int min, required int sec,}){
    if(min == 0 && sec == 0){
      return context.l10n.secondOfTime; // context.locale.secondOfTime;
    } else if(min == 0 && sec != 0) {
      return context.l10n.secondOfTime;
    } else if(min == 1) {
      return context.l10n.minute;
    } else if(min == 2) {
      return context.l10n.twoMinutes;
    }else if(min == 3 || min == 4 || min == 5 || min == 6 || min == 7
        || min == 8 || min == 9 || min == 10) {
      return context.l10n.mins;
    }
    else {
      return context.l10n.minute;
    }
  }

  static String getMinutesString({required int min}) {
    if(min == 0){
      return "00";
    }
    else if(min == 1 || min == 2 ||  min == 3 || min == 4
        || min == 5 || min == 6 || min == 7
        || min == 8 || min == 9 ){
      return "0$min";
    } else {
      return "$min";
    }
  }

  static String getSecondsString({required int sec}) {
    if(sec == 0){
      return "00";
    }
    else if(sec == 1 || sec == 2 ||  sec == 3 || sec == 4
        || sec == 5 || sec == 6 || sec == 7
        || sec == 8 || sec == 9 ){
      return "0$sec";
    } else {
      return "$sec";
    }
  }
}
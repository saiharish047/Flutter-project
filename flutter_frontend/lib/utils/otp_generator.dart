import 'dart:math';

String get otpGenerator => Random().nextInt(999999).toString().padLeft(6, '0');

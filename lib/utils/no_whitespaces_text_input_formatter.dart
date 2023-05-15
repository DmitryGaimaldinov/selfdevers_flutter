import 'package:flutter/services.dart';

TextInputFormatter NoWhitespacesTextInputFormatter() =>
    FilteringTextInputFormatter.deny(RegExp(r'\s'));

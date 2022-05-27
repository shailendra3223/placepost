import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        style: TextStyle(color: Colors.white),
        enabled: true,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)
          ),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)
          ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
            ),

            focusedBorder: OutlineInputBorder(              borderSide: BorderSide(color: Colors.white)
                    ),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
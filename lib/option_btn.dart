import 'package:flutter/material.dart';

class OptionBtn extends StatelessWidget {
  const OptionBtn({super.key, required this.title, required this.onClick,required this.enabled, this.isNext = false});
  final String title;
  final VoidCallback onClick;
  final bool isNext;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: ElevatedButton(
          onPressed: enabled ? onClick : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: isNext ? Colors.blue : Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: const BorderSide(color: Colors.orange,width: 1),
            elevation: 0
          ),
          child: Text(title,style: const TextStyle(fontSize: 20),),
        ),
      ),
    );
  }
}

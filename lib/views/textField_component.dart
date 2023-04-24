import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final bool visiblePassword;
  final String placeholder;
  final IconData icon;
  final int max;

  const InputWidget(
      {Key? key,
      this.onChanged,
      this.validator,
      required this.textInputType,
      required this.visiblePassword,
      required this.placeholder,
      required this.icon,
      required this.max
      })
      : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  String _emailOrPhone = '';
  bool afficherMDP = true;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            onChanged: widget.onChanged,
            validator: widget.validator,
            keyboardType: widget.textInputType,
            maxLength: widget.max,
            obscureText: (widget.visiblePassword) ? afficherMDP : widget.visiblePassword,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              counterText: "",
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15, right: 5),
                child: Icon(
                  widget.icon,
                  color: Color(0xff295078),
                ),
              ),
              suffixIcon: (widget.visiblePassword)
                  ? Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      afficherMDP = !afficherMDP;
                    });
                  },
                  child: Icon((afficherMDP)
                      ? Icons.visibility
                      : Icons.visibility_off,
                      color: Color(0xff295078)),
                ),
              )
                  : const SizedBox.shrink(),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.grey.shade600)),
              fillColor: Colors.grey.shade200,
              filled: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              hintText: widget.placeholder,
              hintStyle: TextStyle(
                color: Color(0xFF9A9A9A),
                fontSize: 13,
              ),
            ),
          )
        ]

    );
  }
}

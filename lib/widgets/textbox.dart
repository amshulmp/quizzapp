import 'package:flutter/material.dart';

class TextBoxWidget extends StatefulWidget {
  final String text;
  final IconData iconName;
  final dynamic validator;
   final bool hideText;

  final TextEditingController tcontroller;
  const TextBoxWidget({
    super.key,
    required this.text,
    required this.iconName,
    required this.tcontroller,
    required this.validator,
     required this.hideText,
  });

  @override
  State<TextBoxWidget> createState() => _TextBoxWidgetState();
}

class _TextBoxWidgetState extends State<TextBoxWidget> {
  late bool show=widget.hideText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
      
          validator: widget.validator,
          controller: widget.tcontroller,
          obscureText: show,
          
          decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
             hintText: widget.text,
             border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            icon: Icon(
              widget.iconName,
              color: Colors.black,
            ),
          
           suffixIcon:
                widget.hideText?
                IconButton( icon:Icon(show ? Icons.visibility : Icons.visibility_off),
                onPressed: (){
                  setState(() {
                    show=!show;
                  });
                },
                ):
                const SizedBox(),
           ),
      ),
    );
    
  }
}

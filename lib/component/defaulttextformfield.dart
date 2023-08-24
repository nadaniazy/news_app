import 'package:flutter/material.dart';
class DefaultTextFormField extends StatelessWidget {
   DefaultTextFormField({required this.iconButton, this.text,this.color}) ;
String? text;
IconData iconButton;
Color? color;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color:color ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.01,horizontal: MediaQuery.of(context).size.width*0.05),
        hintText: text,
        suffixIcon: Icon(iconButton,color:Color(0xff818181) ,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(width: 1,color: Color(0xffF0F1FA)),
        )
      ),
    );
  }
}

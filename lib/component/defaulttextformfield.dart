import 'package:flutter/material.dart';
class DefaultTextFormField extends StatelessWidget {
   DefaultTextFormField({required this.iconButton, this.text,this.color,this.ontap, required this.controller,this.suffixfunction,this.suffixcolor,required this.check}) ;
String? text;
IconData iconButton;
Color? color;
Function ()?ontap;
Function ()?suffixfunction;
Color? suffixcolor;
bool check=false;
TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      readOnly: check,
      controller: controller,
      style: TextStyle(color: Color(0xff202663),fontWeight: FontWeight.w600,fontSize: 14),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.008,horizontal: MediaQuery.of(context).size.width*0.05),
        hintText: text,
        hintStyle:TextStyle(fontWeight: FontWeight.w600,fontSize: 12,color:color ),
        suffixIcon:IconButton(onPressed:suffixfunction,icon:  Icon(iconButton,color:suffixcolor ,)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(width: 1,color: Color(0xffF0F1FA)),
        )
      ),
    );
  }
}

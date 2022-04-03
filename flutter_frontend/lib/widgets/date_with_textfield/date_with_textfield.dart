import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_application_1/widgets/date_with_textfield/date_with_textfield_attributes.dart';
import 'package:intl/intl.dart';

class DateOfBirthTextField extends StatefulWidget {
  final DateWithTextFieldAttributes attributes;
  const DateOfBirthTextField({ Key? key,required this.attributes }) : super(key: key);

  @override
  State<DateOfBirthTextField> createState() => _DateOfBirthTextFieldState();
}

class _DateOfBirthTextFieldState extends State<DateOfBirthTextField> {
  TextEditingController dateinput = TextEditingController(); 
  
  @override
  void initState() {
    dateinput.text = ""; 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: const EdgeInsets.all(15),
          height:150,
          child:Center( 
             child:TextField(
                controller: dateinput,
                decoration: const InputDecoration( 
                   icon: Icon(Icons.calendar_today), 
                   labelText: "Enter Date" 
                ),
                readOnly: true,  
                onTap: () async {
                  var pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101)
                  );
                  
                  if(pickedDate != null ){
                      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate); 
                    if(mounted){ 
                    setState(() {
                         dateinput.text = formattedDate;
                         widget.attributes.onDobChanged.call(dateinput.text);
                      });
                    }
                  }
                },
             )
          )
        );
  }


}
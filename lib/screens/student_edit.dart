import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/student.dart';
import 'package:flutter_application_1/validation/student_validator.dart';

class StudentEdit extends StatefulWidget {
  Student selcetedstudent;
  StudentEdit(Student selectedStudent) {
    this.selcetedstudent = selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selcetedstudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  Student selectedStudent;
  var formKey = GlobalKey<FormState>();
  _StudentAddState(Student selectedStudent) {
    this.selectedStudent = selectedStudent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni ogrenci ekle"),
        ),
        body: Container(
          margin: EdgeInsets.all(20.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  buildFirstNameField(),
                  buildLastNameField(),
                  buildGradeField(),
                  buildSubmitButton()
                ],
              )),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
        initialValue: selectedStudent.firstName,
        decoration:
            InputDecoration(labelText: "Ogrencinin Adi", hintText: "Engin"),
        validator: validateFirstName,
        onSaved: (String value) {
          selectedStudent.firstName = value;
        });
  }

  Widget buildLastNameField() {
    return TextFormField(
        initialValue: selectedStudent.lastName,
        decoration:
            InputDecoration(labelText: "Ogrencinin Soyadi", hintText: "Geyik"),
        validator: validateLastName,
        onSaved: (String value) {
          selectedStudent.lastName = value;
        });
  }

  Widget buildGradeField() {
    return TextFormField(
        initialValue: selectedStudent.grade.toString(),
        decoration: InputDecoration(labelText: "Aldigi Not", hintText: "65"),
        validator: validateGrade,
        onSaved: (String value) {
          selectedStudent.grade = int.parse(value);
        });
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("kaydet"),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(selectedStudent.firstName);
    print(selectedStudent.lastName);
    print(selectedStudent.grade);
  }
}

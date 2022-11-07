import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/student.dart';
import 'package:flutter_application_1/screens/student_add.dart';
import 'package:flutter_application_1/screens/student_edit.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Ogrenci Takip Sistemi";
  Student selectedStudent = Student.withId(0, "", "", 0);
  List<Student> students = [
    Student.withId(1, "Melih", "Yardim", 26),
    Student.withId(2, "Halil", "Ozturk", 92),
    Student.withId(3, "Omer", "Geyik", 45)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(mesaj)), body: buildBody(context));
  }

  void mesajGoster(BuildContext context, String mesaj2) {
    var alert = AlertDialog(
      title: Text("Islem Sonucu"),
      content: Text(mesaj2),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://pbs.twimg.com/profile_images/1288888542903631878/NHBlWJWR_400x400.jpg"),
                    ),
                    title: Text(students[index].firstName +
                        " " +
                        students[index].lastName),
                    subtitle: Text(("sinavdan aldigi not : ") +
                        students[index].grade.toString() +
                        "[" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });

                      print(selectedStudent.firstName);
                    },
                  );
                })),
        Text("Secili ogrenci : " + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                  color: Colors.greenAccent,
                  child: Row(
                    children: [
                      Icon(Icons.update),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text("Guncelle"),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StudentEdit(selectedStudent)));
                  }),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                  color: Colors.amberAccent,
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 1.0,
                      ),
                      Text("Yeni ogrenci"),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentAdd(students)));
                  }),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                  color: Colors.redAccent,
                  child: Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Sil"),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      students.remove(selectedStudent);
                    });

                    var mesaj2 = "SILINDI : " + selectedStudent.firstName;
                    mesajGoster(context, mesaj2);
                  }),
            )
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 45) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}

class Student {
  int id;
  String firstName;
  String lastName;
  int grade;
  String _status;

  Student.withId(int id, String firstName, String lastName, int grade) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student(int id, String firstName, String lastName, int grade) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student.withoutInfo() {}
  String get getFirstName {
    return "dgr -" + this.firstName;
  }

  void set setFirstName(String value) {
    this.firstName = value;
  }

  String get getStatus {
    String mesaj2 = " ";
    if (this.grade >= 50) {
      mesaj2 = "Gecti";
    } else if (this.grade >= 45) {
      mesaj2 = "Butunlemeye kaldi ";
    } else {
      mesaj2 = "kaldi";
    }
    return mesaj2;
  }
}

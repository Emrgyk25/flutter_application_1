class StudentValidationMixin {
  String validateFirstName(String value) {
    if (value.length < 2) {
      return "Isim en az iki karater olmalidir";
    }
  }

  String validateLastName(String value) {
    if (value.length < 2) {
      return "Soyad en az iki karater olmalidir";
    }
  }

  String validateGrade(String value) {
    var grade = int.parse(value);
    if (grade < 0 || grade > 100) {
      return "Not 0-100 arasi olmali ";
    }
  }
}

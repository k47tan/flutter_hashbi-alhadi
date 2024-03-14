class Course {
  String title;
  String description;

  Course(this.title, this.description);
}

class Student {
  String name;
  String className;
  List<Course> courses = [];

  Student(this.name, this.className);

  // Menambahkan course
  void addCourse(Course course) {
    courses.add(course);
    print("Course '${course.title}' telah ditambahkan.");
  }

  // Menghapus course
  void removeCourse(Course course) {
    if (courses.contains(course)) {
      courses.remove(course);
      print("Course '${course.title}' telah dihapus.");
    } else {
      print("Course '${course.title}' tidak ditemukan dalam daftar.");
    }
  }

  // Melihat semua course yang dimiliki
  void viewCourses() {
    if (courses.isEmpty) {
      print("Belum ada course yang ditambahkan.");
    } else {
      print("Daftar Course:");
      for (var course in courses) {
        print("- ${course.title}: ${course.description}");
      }
    }
  }
}

void main() {
  // Membuat beberapa course
  var course1 = Course("Dart Programming", "Learn Dart programming language.");
  var course2 = Course("Flutter Development", "Learn Flutter for mobile app development.");

  // Membuat sebuah student
  var student = Student("JKatan", "06B");

  // Menambahkan course ke dalam daftar course student
  student.addCourse(course1);
  student.addCourse(course2);

  // Melihat semua course yang dimiliki oleh student
  student.viewCourses();

  // Menghapus salah satu course
  student.removeCourse(course2);

  // Melihat kembali semua course yang dimiliki oleh student
  student.viewCourses();
}

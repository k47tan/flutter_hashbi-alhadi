// abstract class Shape sebagai super-class
abstract class Shape {
  // method
  int getArea();
  int getPerimeter();
}

// class Rectangle sub-class Shape
class Rectangle implements Shape {
  // property
  int width;
  int height;
  // constructor
  Rectangle(this.width, this.height);
  // method untuk luas dan kelilis persegi panjang
  @override
  int getArea() {
    return width * height;
  }
  int getPerimeter() {
    return 2 * (width + height);
  }
}

// Class Square sub-class Shape
class Square implements Shape {
   // property
  int side;
  // constructor
  Square(this.side);
  // method untuk luas dan kelilis persegi
  @override
  int getArea() {
    return side * side;
  }
  int getPerimeter() {
    return 4 * side;
  }
}

// Class Circle sub-class Shape
class Circle implements Shape {
  int radius;

  Circle(this.radius);
  // method untuk luas dan kelilis lingkaran
  @override
  int getArea() {
    return (3.14 * radius * radius).toInt();
  }
  int getPerimeter() {
    return (2 * 3.14 * radius).toInt();
  }
}

void main() {
  // deklrasi dan inisialisasi variable
  Circle circle = Circle(5);
  Square square = Square(4);
  Rectangle rectangle = Rectangle(6, 8);

  print("Circle Luas: ${circle.getArea()}, Circle Keliling: ${circle.getPerimeter()}");
  print("Square Luas: ${square.getArea()}, Square Keliling: ${square.getPerimeter()}");
  print("Rectangle Luas: ${rectangle.getArea()}, Rectangle Keliling: ${rectangle.getPerimeter()}");
}
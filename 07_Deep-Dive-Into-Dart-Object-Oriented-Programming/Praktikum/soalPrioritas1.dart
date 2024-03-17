// class Geometry sebagai super-class
class Geometry {
  // properties
  double length;
  double width;
  double height;
  
  // constructor
  Geometry(this.length, this.width, this.height);
  
  // method volume Geometry
  double volume(){
    return length * width * height;
  }
}

// class Cube sub-class dari class Geometry
class Cube extends Geometry {
  // properties
  double side;
  
  // constructor and super parameters
  Cube(this.side) : super(side, side, side);
  
  // // method overriding volume Cube
  // @override
  // double volume() {
  //   return side * side * side;
  // }
}

// class Block sub-class dari class Geometry
class Block extends Geometry {
  // constructor and super parameters
  Block(double length, double width, double height) : super(length, width, height);
}

void main() {
  // deklrasi dan inisialisasi variable
  Geometry geometry = Geometry(2, 3, 4);
  Cube cube = Cube(5);
  Block block = Block(6, 7, 8);
  
  print('Volume Geometry: ${geometry.volume()}');
  print('Volume Cube: ${cube.volume()}');
  print('Volume Block: ${block.volume()}');
}

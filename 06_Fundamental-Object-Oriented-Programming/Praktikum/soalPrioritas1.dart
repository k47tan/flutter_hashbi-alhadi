// nomor 1
class Animals{
  // Properties
  String name;
  int weight;
  // Constructor Animals
  Animals(this.name, this.weight);

}

// nomor 2
class Car{

  int loadcapacity;
  List<Animals> capacity = [];

  Car(this.loadcapacity);
  
  // Methods untuk menghitung total muatan
  int totalCapacity() {
    int total = 0;
    capacity.forEach((animal) {
      total += animal.weight;
    });
    return total;
  }

  // Methods untuk data hewan ke dalam list muatan
  void addAnimal(Animals animal) {
    int total = totalCapacity() + animal.weight;
    if (total <= loadcapacity) {
      capacity.add(animal);
      print("Hewan ${animal.name} dimasukan kedalam mobil");
    } else {
      print("kapasitas penuh!!!");
    }

  }

}

void main() {
  Animals animal1 = Animals("Sapi", 20);
  Animals animal2 = Animals("Kerbau", 30);
  Car car1 = Car(40);

  car1.addAnimal(animal1);
  car1.addAnimal(animal2);
  
}
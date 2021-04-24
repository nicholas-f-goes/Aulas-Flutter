
class Rectangle {

  double height;
  double width;

  Rectangle(this.height, this.width);

  double calculateArea() {
    var area = this.height * this.width;
    print('Área: $area');
    return area;
  }

  double calculatePerimeter() {
    var perimeter = 2 * (this.height + this.width);
    print('Perimetro: $perimeter');
    return perimeter;
  }

  @override
  String toString() {
    return 'Rectangle:\nHeight: $height\nWidth: $width\nÁrea: ${this.calculateArea()}\nPerimeter: ${this.calculatePerimeter()}';
  }
}

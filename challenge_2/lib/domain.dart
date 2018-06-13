
import 'package:flutter/material.dart';

class Place {
  final List<Category> categories;
  final String name;
  Place(this.name, this.categories);

}

class Category {
  final String name;
  final List<Scenery> scenery;

  Category(this.name, this.scenery);


}

class Scenery {

  final int id;

  final String title;

  final String city;

  final double area;

  final double population;

  final String description;

  final String image;

  final Color color;

  Scenery(
      this.id,
      this.title,
      this.city,
      this.area,
      this.population,
      this.description,
      this.image,
      this.color
      );
}

final scenery = [
  Scenery(1, "Build Scenery", "Venice", 414.75, 34.3, "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut erat lectus, ultricies vitae suscipit id, ultricies sit amet leo. Proin sem ex, efficitur ut vehicula et, rhoncus vitae diam. Donec maximus nisl et fringilla ullamcorper. Cras ut neque non sapien egestas accumsan. Phasellus condimentum arcu in urna placerat, et ultrices ligula ullamcorper. Duis posuere ante non ultricies sollicitudin. Nulla mollis tellus dui, id pulvinar risus tempus nec.", "build.jpg", Colors.orange),
  Scenery(2, "Natural Scenery", "Venice", 414.75, 34.3, "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut erat lectus, ultricies vitae suscipit id, ultricies sit amet leo. Proin sem ex, efficitur ut vehicula et, rhoncus vitae diam. Donec maximus nisl et fringilla ullamcorper. Cras ut neque non sapien egestas accumsan. Phasellus condimentum arcu in urna placerat, et ultrices ligula ullamcorper. Duis posuere ante non ultricies sollicitudin. Nulla mollis tellus dui, id pulvinar risus tempus nec.", "natural.jpg", Colors.lightBlue),
  Scenery(3, "Famous Scenery", "Venice", 414.75, 34.3, "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut erat lectus, ultricies vitae suscipit id, ultricies sit amet leo. Proin sem ex, efficitur ut vehicula et, rhoncus vitae diam. Donec maximus nisl et fringilla ullamcorper. Cras ut neque non sapien egestas accumsan. Phasellus condimentum arcu in urna placerat, et ultrices ligula ullamcorper. Duis posuere ante non ultricies sollicitudin. Nulla mollis tellus dui, id pulvinar risus tempus nec.", "famous.jpg", Colors.pink),
];

final Place venice = Place("Venice",[
  Category("Scenic", scenery),
  Category("Restaurant", scenery),
  Category("Grogshop", scenery),
]);
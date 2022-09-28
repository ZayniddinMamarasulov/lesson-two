import 'package:lesson_two/utils/images.dart';

class PopularMenu {
  String title;
  String subTitle;
  String imgUrl;
  double price;

  PopularMenu({
    required this.title,
    required this.subTitle,
    required this.imgUrl,
    required this.price,
  });

  static List<PopularMenu> menus = [
    PopularMenu(
      title: "Herbal Pancake",
      subTitle: "Warung Herbal",
      imgUrl: MyImages.image_herbal,
      price: 7,
    ),
    PopularMenu(
      title: "Fruit Salad",
      subTitle: "Wijie Resto",
      imgUrl: MyImages.image_fruit,
      price: 5,
    ),
    PopularMenu(
      title: "Green Noddle",
      subTitle: "Noodle Home",
      imgUrl: MyImages.image_menu1,
      price: 15,
    ),
  ];
}

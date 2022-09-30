import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lesson_two/models/popular_menu.dart';
import 'package:lesson_two/screens/test_page.dart';
import 'package:lesson_two/utils/colors.dart';
import 'package:lesson_two/utils/images.dart';
import 'package:lesson_two/utils/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(MyImages.image_bg))),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Find Your\nFavorite Food",
                      style: MyStyles.robotoBold700.copyWith(
                          fontSize: 32,
                          height: 1.2,
                          color: Theme.of(context).textTheme.headline1?.color),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.5)
                            : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      width: 45,
                      height: 45,
                      child: Image.asset(MyImages.image_notification),
                    )
                  ],
                ),
                SizedBox(height: 44),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: isDark
                              ? MyColors.C_F4F4F4.withOpacity(0.1)
                              : MyColors.C_F9A84D.withOpacity(0.2),
                        ),
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search,
                                    color: isDark
                                        ? Colors.white
                                        : MyColors.C_F9A84D),
                                hintText: "What do you want to order?",
                                hintStyle: TextStyle(
                                  color: isDark
                                      ? Colors.white.withOpacity(0.4)
                                      : MyColors.C_F9A84D,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 50,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark
                            ? MyColors.C_F4F4F4.withOpacity(0.1)
                            : MyColors.C_F9A84D.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.asset(
                        MyImages.icon_settings,
                        color: isDark ? Colors.white : MyColors.C_F9A84D,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 24),
                buildBanner(),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Nearest Restaurant",
                      style: MyStyles.robotoBold700,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        clipBehavior: Clip.none,
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      TestPage(screenTitle: "title")));
                        },
                        child: Text(
                          "View More",
                          style: MyStyles.robotoRegular400
                              .copyWith(color: MyColors.C_F9A84D),
                        )),
                  ],
                ),
                Container(
                  height: 184,
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    children: [
                      buildNearestRestaurantItem(),
                      buildNearestRestaurantItem(),
                      buildNearestRestaurantItem(),
                      buildNearestRestaurantItem(),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Popular Menu",
                      style: MyStyles.robotoBold700,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        clipBehavior: Clip.none,
                        onPressed: () {},
                        child: Text(
                          "View More",
                          style: MyStyles.robotoRegular400
                              .copyWith(color: MyColors.C_F9A84D),
                        )),
                  ],
                ),
                Container(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return buildMenuItem(PopularMenu.menus[index]);
                    },
                    itemCount: PopularMenu.menus.length,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBanner() {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(isDark
                  ? MyImages.image_pattern_dark
                  : MyImages.image_pattern)),
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              colors: [MyColors.C_53E88B, MyColors.C_15BE77])),
      child: Stack(
        children: [
          Image.asset(MyImages.image_ice_cream),
          Positioned(
              right: 20,
              top: 30,
              child: Text(
                "Special Deal For\nOctober",
                style: MyStyles.robotoBold700.copyWith(
                    color: isDark ? Colors.black : Colors.white, fontSize: 18),
              )),
          Positioned(
              bottom: 20,
              right: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text(
                  "Buy Now",
                  style:
                      MyStyles.robotoBold700.copyWith(color: MyColors.C_53E88B),
                ),
              ))
        ],
      ),
    );
  }

  Widget buildNearestRestaurantItem() {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 148,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: isDark ? MyColors.C_252525 : Colors.black.withOpacity(0.05),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(22)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: EdgeInsets.all(16),
              child: Image.asset(MyImages.image_vegan)),
          Text(
            "Vegan Resto",
            style: MyStyles.robotoBold700,
          ),
          SizedBox(height: 8),
          Text("12 Mins",
              style: MyStyles.robotoRegular400.copyWith(color: Colors.grey))
        ],
      ),
    );
  }

  Widget buildMenuItem(PopularMenu menu) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: isDark ? MyColors.C_252525 : Colors.black.withOpacity(0.05),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Image.asset(
              menu.imgUrl,
              width: 64,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 18),
          Column(
            children: [
              Text(menu.title),
              SizedBox(height: 4),
              Text(
                menu.subTitle,
                style: MyStyles.robotoRegular400.copyWith(color: Colors.grey),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "\$${menu.price}",
                  style: MyStyles.robotoBold700
                      .copyWith(color: MyColors.C_F9A84D, fontSize: 28),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

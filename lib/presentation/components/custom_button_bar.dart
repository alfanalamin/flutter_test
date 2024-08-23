import 'package:flutter/material.dart';
import 'package:flutter_technical_test/common/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final itemWidth = screenWidth / 5;

    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, -1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: BaseColors.success950,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Icon(
                    Icons.home,
                    size: 30,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Icon(
                    Icons.location_city,
                    size: 30,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Icon(
                    Icons.insert_drive_file,
                    size: 30,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Icon(
                    Icons.person,
                    size: 30,
                  ),
                ),
                label: '',
              ),
            ],
          ),
          Positioned(
            bottom: -9,
            left: (selectedIndex * itemWidth) + (itemWidth / 2) - 30,
            child: Container(
              width: 60,
              height: 24,
              decoration: BoxDecoration(
                color: BaseColors.success950,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.elliptical(50, 30),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: (selectedIndex * itemWidth) + (itemWidth / 2) - 4,
            child: Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_technical_test/common/colors.dart';
import 'package:flutter_technical_test/presentation/components/custom_app.dart';
import 'package:flutter_technical_test/presentation/components/custom_buttom_administrasi.dart';
import 'package:flutter_technical_test/presentation/components/custom_buttom_akad.dart';
import 'package:flutter_technical_test/presentation/components/custom_buttom_pembangunan.dart';
import 'package:flutter_technical_test/presentation/components/custom_buttom_pemesanan.dart';
import 'package:flutter_technical_test/presentation/components/custom_button_bar.dart';
import 'package:flutter_technical_test/presentation/components/percentage_circle.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  final PageController _orderPageController = PageController();
  int tappedIndex = -1;
  int selectedIndex = 0;

  final List<Map<String, String>> orders = [
    {
      'id': '#881726478123',
      'type': 'Komersil',
      'imagePath': 'assets/images/House.png',
      'name': 'Candra Bhirawa',
      'address': 'Lotus, Kavling A1, Blok B No. 4',
      'date': '25/11/2022, 09:00',
      'price': 'Rp 850.000.000'
    },
    {
      'id': '#881726478124',
      'type': 'Komersil',
      'imagePath': 'assets/images/House2.png',
      'name': 'Budi Santoso',
      'address': 'Anggrek, Kavling B2, Blok C No. 6',
      'date': '26/11/2022, 10:00',
      'price': 'Rp 950.000.000'
    },
  ];

  final List<Map<String, String>> menuItems = [
    {
      'title': 'Pemesanan',
      'image': 'assets/images/card1.png',
      'percentage': '100%',
      'status': 'Completed',
    },
    {
      'title': 'Administrasi',
      'image': 'assets/images/card2.png',
      'percentage': '50%',
      'status': 'In Progress',
    },
    {
      'title': 'Pembangunan',
      'image': 'assets/images/card3.png',
      'percentage': '0%',
      'status': 'Not Started',
    },
    {
      'title': 'Akad & Serah Terima',
      'image': 'assets/images/card4.png',
      'percentage': '0%',
      'status': 'Not Started',
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void _showBottomSheet(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        switch (title) {
          case 'Pemesanan':
            return const CustomBottomSheetPemesanan();
          case 'Administrasi':
            return const CustomBottomSheetAdministrasi();
          case 'Pembangunan':
            return const CustomBottomSheetPembangunan();
          case 'Akad & Serah Terima':
            return const CustomBottomSheetAkad();
          default:
            return const SizedBox();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: ListView(
          children: [
            SizedBox(
              height: isWideScreen ? 200 : 150,
              child: PageView(
                controller: _pageController,
                children: [
                  buildBanner(
                    'assets/images/Banner.png',
                    '20% Diskon',
                    'American House',
                    'Periode 19 Nov 2023 s/d 15 Des 2023',
                  ),
                  buildBanner(
                    'assets/images/Banner2.png',
                    '20% Diskon',
                    'American House',
                    'Periode 19 Nov 2023 s/d 15 Des 2023',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Pesanan Terbaru',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: const Icon(Icons.arrow_right_alt_sharp),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Daftar pesanan terbaru ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 24),
                buildHorizontalStepIndicator(),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Text(
                      'Menu',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: const Icon(Icons.category_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Daftar menu transaksi',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: _orderPageController,
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return buildOrderCard(orders[index],
                          isSecondSlide: index == 1);
                    },
                  ),
                ),
                const SizedBox(height: 16.0),
                Center(
                  child: SmoothPageIndicator(
                    controller: _orderPageController,
                    count: orders.length,
                    effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(
                        width: 24,
                        height: 5,
                        color: BaseColors.success950,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      dotDecoration: DotDecoration(
                        width: 16,
                        height: 5,
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      spacing: 4,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                buildMenuGrid(),
                const SizedBox(height: 24.0),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget buildBanner(
      String imagePath, String discount, String title, String period) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    discount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        period,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHorizontalStepIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildStep(Icons.check, true),
              buildLine(true),
              buildStep(Icons.check, true),
              buildLine(true),
              buildStep(Icons.access_time, true),
              buildDashedLine(),
              buildStep(null, false),
              buildDashedLine(),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pemesanan",
                style: TextStyle(fontSize: 12, color: BaseColors.success950),
              ),
              Text(
                "Administrasi",
                style: TextStyle(fontSize: 12, color: BaseColors.success950),
              ),
              Text(
                "Pembangunan",
                style: TextStyle(fontSize: 12, color: BaseColors.success950),
              ),
              const Text(
                "Serah Terima",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStep(IconData? icon, bool isCompleted) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: isCompleted ? BaseColors.success950 : Colors.grey,
      child: icon != null
          ? Icon(
              icon,
              size: 14,
              color: Colors.white,
            )
          : const CircleAvatar(
              radius: 6,
              backgroundColor: Colors.white,
            ),
    );
  }

  Widget buildLine(bool isCompleted) {
    return Expanded(
      child: Container(
        height: 2,
        color: isCompleted ? BaseColors.success950 : Colors.grey,
      ),
    );
  }

  Widget buildDashedLine() {
    return Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          const dashWidth = 4.0;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: List.generate(dashCount, (_) {
              return const SizedBox(
                width: dashWidth,
                height: 2,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.grey),
                ),
              );
            }),
          );
        },
      ),
    );
  }

  Widget buildOrderCard(Map<String, String> order,
      {bool isSecondSlide = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  order['id']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: BaseColors.success500,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  order['type']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  order['imagePath']!,
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.house,
                          color: Colors.grey,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            order['name']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.grey,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            order['address']!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            order['date']!,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      order['price']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: BaseColors.success950,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (isSecondSlide) ...[
            const SizedBox(height: 8),
            const DottedLine(
              dashLength: 4,
              dashGapLength: 4,
              lineThickness: 1,
              dashColor: Colors.grey,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: BaseColors.success950,
                        size: 16,
                      ),
                      Text(
                        'Denda Rp 8.550.000',
                        style: TextStyle(
                          color: BaseColors.success950,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: BaseColors.success950,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning,
                          color: BaseColors.neutral50,
                        ),
                        const Text(
                          'Terlambat 7 Hari',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget buildMenuGrid() {
    final isWideScreen = MediaQuery.of(context).size.width > 600;
    final crossAxisCount = isWideScreen ? 4 : 2;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.0,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        bool isTapped = tappedIndex == index;
        return GestureDetector(
          onTapDown: (_) {
            setState(() {
              tappedIndex = index;
            });
          },
          onTapUp: (_) {
            setState(() {
              tappedIndex = -1;
            });
          },
          onTapCancel: () {
            setState(() {
              tappedIndex = -1;
            });
          },
          onTap: () {
            _showBottomSheet(context, menuItems[index]['title']!);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isTapped ? BaseColors.success950 : Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: buildMenuItem(menuItems[index], isTapped),
          ),
        );
      },
    );
  }

  Widget buildMenuItem(Map<String, String> menuItem, bool isTapped) {
    double percentage =
        double.parse(menuItem['percentage']!.replaceAll('%', ''));
    Color percentageColor;
    if (percentage == 100) {
      percentageColor = Colors.red;
    } else if (percentage == 50) {
      percentageColor = isTapped ? Colors.white : BaseColors.success950;
    } else {
      percentageColor = Colors.grey;
    }

    return Container(
      decoration: BoxDecoration(
        color: isTapped ? BaseColors.success950 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tahap',
              style: TextStyle(
                color: isTapped ? Colors.white : BaseColors.success950,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              menuItem['title']!,
              style: TextStyle(
                color: isTapped ? Colors.white : BaseColors.success950,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    PercentageCircle(
                      percentage: percentage,
                      size: 48,
                      color: percentageColor,
                    ),
                    Text(
                      menuItem['percentage']!,
                      style: TextStyle(
                        color: isTapped ? Colors.white : BaseColors.success950,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  menuItem['image']!,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

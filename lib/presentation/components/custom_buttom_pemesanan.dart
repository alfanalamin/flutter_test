import 'package:flutter/material.dart';
import 'package:flutter_technical_test/common/colors.dart';

class CustomBottomSheetPemesanan extends StatelessWidget {
  const CustomBottomSheetPemesanan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Center(
            child: Column(
              children: [
                Text(
                  'Tahap Pemesanan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Daftar menu tahap pemesanan',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          const Divider(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMenuItem(
                context,
                icon: Icons.attach_money,
                label: 'Booking\nFee',
                isActive: true,
                notificationCount: 3,
              ),
              _buildMenuItem(
                context,
                icon: Icons.receipt,
                label: 'Pesanan\nBelum Bayar',
                isActive: false,
              ),
              _buildMenuItem(
                context,
                icon: Icons.history,
                label: 'Riwayat\nPemesanan',
                isActive: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required bool isActive,
    int notificationCount = 0,
  }) {
    final splitLabel = label.split('\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor:
                  isActive ? BaseColors.success950 : BaseColors.neutral400,
              child: Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
            ),
            if (isActive && notificationCount > 0)
              Positioned(
                right: 0,
                top: 0,
                child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.red,
                  child: Text(
                    '$notificationCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          splitLabel[0],
          style: TextStyle(
            color: isActive ? BaseColors.success950 : Colors.black,
            fontSize: 14,
          ),
        ),
        Text(
          splitLabel[1],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

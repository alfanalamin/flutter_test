import 'package:flutter/material.dart';
import 'package:flutter_technical_test/common/colors.dart';

class CustomBottomSheetAkad extends StatelessWidget {
  const CustomBottomSheetAkad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: 400,
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
                  'Tahap Akad',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildMenuItem(
                      context,
                      icon: Icons.attach_money,
                      label: 'Tahap\nAkad',
                      isActive: true,
                      notificationCount: 3,
                    ),
                    const SizedBox(height: 20),
                    _buildMenuItem(
                      context,
                      icon: Icons.folder,
                      label: 'Daftar\nKomplain',
                      isActive: false,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _buildMenuItem(
                  context,
                  icon: Icons.receipt,
                  label: 'Tahap\nSerah Terima\nBangunan',
                  isActive: false,
                ),
              ),
              Expanded(
                child: _buildMenuItem(
                  context,
                  icon: Icons.history,
                  label: 'Tahap\nSerah Terima\nLegalitas',
                  isActive: false,
                ),
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
      crossAxisAlignment: CrossAxisAlignment.center,
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
        for (var line in splitLabel)
          Text(
            line,
            style: TextStyle(
              color: isActive ? BaseColors.success950 : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}

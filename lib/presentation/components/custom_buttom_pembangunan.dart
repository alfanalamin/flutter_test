import 'package:flutter/material.dart';
import 'package:flutter_technical_test/common/colors.dart';

class CustomBottomSheetPembangunan extends StatelessWidget {
  const CustomBottomSheetPembangunan({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        return Container(
          padding: const EdgeInsets.all(16.0),
          height: height, // Adjust height as needed
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
                      'Tahap Pembangunan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Daftar menu tahap pembangunan rumah',
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
              Expanded(
                child: Wrap(
                  spacing: 16.0,
                  runSpacing: 16.0,
                  children: [
                    _buildMenuItem(
                      context,
                      percentage: 100,
                      label: 'Tahap Persiapan',
                      isActive: true,
                      width: width,
                    ),
                    _buildMenuItem(
                      context,
                      percentage: 20,
                      label: 'Tahap Pondasi & Struktur',
                      isActive: false,
                      width: width,
                    ),
                    _buildMenuItem(
                      context,
                      percentage: 30,
                      label: 'Tahap Rumah Unfinished',
                      isActive: false,
                      width: width,
                    ),
                    _buildMenuItem(
                      context,
                      percentage: 40,
                      label: 'Tahap Finishing & Interior',
                      isActive: false,
                      width: width,
                    ),
                    _buildMenuItem(
                      context,
                      percentage: 0,
                      label: 'Tahap Pembersihan',
                      isActive: false,
                      width: width,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required int percentage,
    required String label,
    required bool isActive,
    required double width,
  }) {
    Color percentageColor;
    if (percentage == 100) {
      percentageColor = Colors.red;
    } else if (percentage > 0) {
      percentageColor = isActive ? BaseColors.neutral50 : BaseColors.success950;
    } else {
      percentageColor = Colors.grey.shade300;
    }

    return SizedBox(
      width: (width - 64) / 3, // Adjust width based on available space
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: percentage / 100,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(percentageColor),
                strokeWidth: 12,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: BaseColors.success950,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$percentage%',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
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
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isActive ? BaseColors.success950 : Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

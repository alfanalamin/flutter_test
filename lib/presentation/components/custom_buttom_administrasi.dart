import 'package:flutter/material.dart';
import 'package:flutter_technical_test/common/colors.dart';

class CustomBottomSheetAdministrasi extends StatelessWidget {
  const CustomBottomSheetAdministrasi({super.key});

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
                color: BaseColors.neutral300,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                const Text(
                  'Tahap Administrasi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Daftar menu tahap administrasi',
                  style: TextStyle(
                    color: BaseColors.neutral500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20),
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
                icon: Icons.article,
                label: 'Tahap\nSPS',
                isActive: true,
                notificationCount: 1,
              ),
              _buildMenuItem(
                context,
                icon: Icons.edit,
                label: 'Tahap\nSPR',
                isActive: false,
              ),
              _buildMenuItem(
                context,
                icon: Icons.document_scanner,
                label: 'Tahap\nPPJB',
                isActive: false,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildMenuItem(
                context,
                icon: Icons.folder,
                label: 'Daftar\nDokumen',
                isActive: false,
              ),
              _buildMenuItem(
                context,
                icon: Icons.spellcheck,
                label: 'Tahap\nSP3K',
                isActive: false,
              ),
              _buildMenuItem(
                context,
                icon: Icons.payment,
                label: 'Bayar\nAngsuran',
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

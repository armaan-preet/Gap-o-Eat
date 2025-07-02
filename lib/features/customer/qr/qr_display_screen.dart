import 'package:flutter/material.dart';
import 'package:gap_o_eat/common/style/padding.dart';
import 'package:gap_o_eat/features/customer/qr/qr_scanning_screen.dart';
import 'package:gap_o_eat/utils/constants/sizes.dart';
import 'package:gap_o_eat/utils/constants/texts.dart';
// ignore: depend_on_referenced_packages
import 'package:iconsax/iconsax.dart';
// ignore: depend_on_referenced_packages
import 'package:qr_flutter/qr_flutter.dart';

class QrDisplayScreen extends StatelessWidget {
  const QrDisplayScreen({super.key});

  get Get => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Iconsax.arrow_left, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('HOME', style: TextStyle(color: Colors.white)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: UPadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// -----[Header]-----
              /// Title
              Text(
                UTexts.qrDisplayTitle,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: USizes.spaceBtwItems),

              /// -----[QR Code Display]-----
              Container(
                padding: const EdgeInsets.all(USizes.md),
                margin: EdgeInsets.symmetric(vertical: USizes.spaceBtwSections),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(USizes.borderRadiusMd),
                  color: Colors.white,
                ),
                child: QrImageView(
                  data: 'your-restaurant-qr-data-here',
                  version: QrVersions.auto,
                  size: 200.0,
                  backgroundColor: Colors.white,
                ),
              ),

              SizedBox(height: USizes.spaceBtwItems),

              /// SubTitle
              Text(
                UTexts.qrDisplaySubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),

              SizedBox(height: USizes.spaceBtwSections),

              /// -----[Scan Button]-----
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const QrScanningScreen()),
                  child: Text(UTexts.scan),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
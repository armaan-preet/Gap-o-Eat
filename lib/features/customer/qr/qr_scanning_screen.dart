// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap_o_eat/features/customer/qr/qr_display_screen.dart';
import 'package:gap_o_eat/utils/constants/texts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanningScreen extends StatefulWidget {
  const QrScanningScreen({super.key});

  @override
  State<QrScanningScreen> createState() => _QrScanningScreenState();
}

class _QrScanningScreenState extends State<QrScanningScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isFlashOn = false;
  bool isQrDetected = false;
  double brightness = 0.5; // Default brightness value (0.0 to 1.0)

  get Get => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// -----[QR Scanner Camera View]-----
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: isQrDetected ? Colors.green : Colors.white,
              borderRadius: 12,
              borderLength: 40,
              borderWidth: 8,
              cutOutSize: 280,
            ),
          ),

          /// -----[Top Controls]-----
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Close Button
                Container(
                  decoration: BoxDecoration(
                   color: Colors.black.withValues(alpha: 0.5),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Iconsax.close_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QrDisplayScreen(),
                      ),
                    ),
                  ),
                ),

                /// Brightness Control
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                   color: Colors.black.withValues(alpha: 0.5),

                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Iconsax.sun_1, color: Colors.white, size: 16),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 100,
                        child: Slider(
                          value: brightness,
                          min: 0.0,
                          max: 1.0,
                          activeColor: Colors.white,
                          inactiveColor: Colors.grey,
                          onChanged: (value) {
                            setState(() {
                              brightness = value;
                            });
                            _adjustBrightness(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// -----[Center Waiting Text]-----
          if (!isQrDetected)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 350,
                  ), // Position below the scanning area
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),

                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      UTexts.qrScanningTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          /// -----[Bottom Control Buttons]-----
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 30,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  /// Flash Button
                  _buildControlButton(
                    icon: isFlashOn ? Iconsax.flash_1 : Iconsax.flash,
                    isActive: isFlashOn,
                    onPressed: () async {
                      await controller?.toggleFlash();
                      setState(() {
                        isFlashOn = !isFlashOn;
                      });
                      // Haptic feedback
                      HapticFeedback.lightImpact();
                    },
                  ),

                  /// Camera Flip Button
                  _buildControlButton(
                    icon: Iconsax.camera_slash,
                    isActive: false,
                    onPressed: () async {
                      await controller?.flipCamera();
                      HapticFeedback.lightImpact();
                    },
                  ),

                  /// Gallery Button
                  _buildControlButton(
                    icon: Iconsax.gallery,
                    isActive: false,
                    onPressed: () {
                      _showImageSourceDialog();
                      HapticFeedback.lightImpact();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build Control Button Widget
  Widget _buildControlButton({
    required IconData icon,
    required bool isActive,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
       color: isActive ? Colors.white : Colors.black.withValues(alpha: 0.5),

        shape: BoxShape.circle,
       border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 2),

      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: isActive ? Colors.black : Colors.white,
          size: 28,
        ),
        onPressed: onPressed,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null && !isQrDetected) {
        setState(() {
          isQrDetected = true;
        });

        // Haptic feedback for successful scan
        HapticFeedback.heavyImpact();

        controller.pauseCamera();
        _showScanResultDialog(scanData.code!);
      }
    });
  }

  void _adjustBrightness(double value) {
    // Adjust screen brightness
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: value > 0.5 ? Brightness.light : Brightness.dark,
      ),
    );
  }

  void _showScanResultDialog(String scannedData) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Iconsax.tick_circle, color: Colors.green, size: 24),
              const SizedBox(width: 8),
              Text(UTexts.qrScanSuccess),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('QR Code Data:'),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  scannedData,
                  style: const TextStyle(fontFamily: 'monospace'),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  isQrDetected = false;
                });
                controller?.resumeCamera();
              },
              child: Text(UTexts.scanAgain),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrDisplayScreen(),
                  ),
                );
                // Process the scanned data here - navigate to menu or next screen
              },
              child: Text(UTexts.proceed),
            ),
          ],
        );
      },
    );
  }

  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Import QR Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                     color: Colors.blue.withValues(alpha: 0.1),

                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Iconsax.camera, color: Colors.blue),
                  ),
                  title: Text(UTexts.camera),
                  subtitle: const Text('Take a photo of QR code'),
                  onTap: () {
                    Navigator.of(context).pop();
                    // Handle camera functionality
                    _openCamera();
                  },
                ),
                ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                     color: Colors.green.withValues(alpha: 0.1),

                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Iconsax.gallery, color: Colors.green),
                  ),
                  title: Text(UTexts.gallery),
                  subtitle: const Text('Select QR code from gallery'),
                  onTap: () {
                    Navigator.of(context).pop();
                    // Handle gallery functionality
                    _openGallery();
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  void _openCamera() {
    // Implement camera functionality
    // You can use image_picker package for this
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Camera functionality to be implemented')),
    );
  }

  void _openGallery() {
    // Implement gallery functionality
    // You can use image_picker package for this
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Gallery functionality to be implemented')),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    // Reset system UI when leaving the screen
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
    );
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Set system UI for dark theme
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }
}

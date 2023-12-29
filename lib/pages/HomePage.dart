import 'package:artsy/components/MyDrawer.dart';
import 'package:artsy/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'ListenPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Center(child: Text("Home Page")),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text("Place the Qr Code inside the box"),
            const SizedBox(height: 30),
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                    ),
                  ),
                ),
                // Animated horizontal line
                AnimatedBuilder(
                  animation: animationController,
                  builder: (context, child) {
                    return Positioned(
                      top: Tween<double>(begin: 0, end: 300)
                          .animate(animationController)
                          .value,
                      child: Container(
                        height: 2,
                        width: 280,
                        color: Colors.red, // Choose your line color
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 100),
            CustomButton(onTap: _navigateToListenPage, btnText: "Scan")
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    animationController.dispose();
    super.dispose();
  }
  void _navigateToListenPage(){
    if(result!=null){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> const ListenPage()));
    }
  }
}

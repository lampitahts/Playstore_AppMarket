import 'package:flutter/material.dart';

class Pembayaran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Account Page'),
          iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(0, 204, 190, 190), 
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 198, 57, 223),
                Color.fromARGB(255, 42, 149, 236)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
          leading: IconButton(
            icon: Icon(Icons.close, color: const Color.fromARGB(255, 255, 253, 253)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          color: Color.fromARGB(255, 244, 202, 248),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mulai dengan menambahkan metode pembayaran',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 61, 60, 60),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'angela@gmail.com',
                    style: TextStyle(color: const Color.fromARGB(255, 133, 132, 132)),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Tambahkan metode pembayaran ke Akun Google untuk menyelesaikan pembayaran Anda. Informasi pembayaran Anda hanya dapat dilihat oleh Google.',
                    style: TextStyle(color: Color.fromARGB(255, 56, 55, 55)),
                  ),
                  SizedBox(height: 32.0),
                  buildElevatedButton(
                    context: context,
                    icon: Icons.credit_card,
                    text: 'Tambahkan kartu kredit atau debit',
                    paymentMethod: 'Kartu Kredit/Debit',
                  ),
                  SizedBox(height: 16.0),
                  buildElevatedButton(
                    context: context,
                    icon: Icons.store,
                    text: 'Bayar di Alfamart',
                    paymentMethod: 'Alfamart',
                  ),
                  SizedBox(height: 16.0),
                  buildElevatedButton(
                    context: context,
                    icon: Icons.store,
                    text: 'Bayar dengan BSI',
                    paymentMethod: 'BSI',
                  ),
                  SizedBox(height: 16.0),
                  buildElevatedButton(
                    context: context,
                    icon: Icons.store,
                    text: 'Bayar di Indomaret',
                    paymentMethod: 'Indomaret',
                  ),
                  SizedBox(height: 16.0),
                  buildElevatedButton(
                    context: context,
                    icon: Icons.store,
                    text: 'Bayar dengan Mandiri',
                    paymentMethod: 'Mandiri',
                  ),
                  SizedBox(height: 16.0),
                  buildElevatedButton(
                    context: context,
                    icon: Icons.store,
                    text: 'Bayar dengan Permata',
                    paymentMethod: 'Permata',
                  ),
                  SizedBox(height: 16.0),
                  buildElevatedButton(
                    context: context,
                    icon: Icons.store,
                    text: 'Bayar dengan BRI',
                    paymentMethod: 'BRI',
                  ),
                  SizedBox(height: 16.0),
                  buildElevatedButton(
                    context: context,
                    icon: Icons.store,
                    text: 'Bayar dengan BCA',
                    paymentMethod: 'BCA',
                  ),
                  SizedBox(height: 16.0),
                  buildElevatedButton(
                    context: context,
                    icon: Icons.payment,
                    text: 'Tambahkan penagihan XL/AXIS 1',
                    paymentMethod: 'XL/AXIS 1',
                  ),
                  SizedBox(height: 16.0),
                  buildElevatedButton(
                    context: context,
                    icon: Icons.payment,
                    text: 'Tambahkan penagihan XL/AXIS 2',
                    paymentMethod: 'XL/AXIS 2',
                  ),
                  SizedBox(height: 16.0),
                  buildOfferContainer(
                    context: context,
                    icon: Icons.shopping_cart,
                    text: 'Tambahkan ShopeePay',
                    offerText:
                        'Dapatkan cashback sampai dengan Rp30.000 dari ShopeePay setelah pembelian pertama di Google Play. Persyaratan partner berlaku.',
                    offerColor: Colors.red,
                    paymentMethod: 'ShopeePay',
                  ),
                  SizedBox(height: 16.0),
                  buildOfferContainer(
                    context: context,
                    icon: Icons.money,
                    text: 'Tambahkan DANA',
                    offerText:
                        'Dapatkan diskon Rp12.000 dari DANA saat pembelian pertama sebesar Rp30.000 atau lebih di Google Play. Persyaratan partner berlaku.',
                    offerColor: Colors.blue,
                    paymentMethod: 'DANA',
                  ),
                  SizedBox(height: 16.0),
                  buildElevatedButton(
                    context: context,
                    icon: Icons.payment,
                    text: 'Tambahkan DOKU',
                    paymentMethod: 'DOKU',
                  ),
                  SizedBox(height: 16.0),
                  buildElevatedButton(
                    context: context,
                    icon: Icons.payment,
                    text: 'Tambahkan GoPay',
                    paymentMethod: 'GoPay',
                  ),
                  SizedBox(height: 16.0),
                  buildElevatedButton(
                    context: context,
                    icon: Icons.qr_code,
                    text: 'Tukarkan kode',
                    paymentMethod: 'Kode',
                  ),
                  SizedBox(height: 16.0),
                  buildElevatedButton(
                    context: context,
                    icon: Icons.shopping_cart,
                    text: 'Beli saldo Google Play',
                    paymentMethod: 'Saldo Google Play',
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Melakukan pembayaran di minimarket atau dengan akun virtual',
                    style: TextStyle(color: Color.fromARGB(255, 54, 54, 54)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildElevatedButton({
    required BuildContext context,
    required IconData icon,
    required String text,
    required String paymentMethod,
  }) {
    return ElevatedButton(
      onPressed: () {
        _handlePayment(context, paymentMethod);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 192, 61, 231),
        padding: EdgeInsets.symmetric(vertical: 10.0),
        
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 190, 21, 206),
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: Icon(icon, color: Colors.grey[400]),
            ),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildOfferContainer({
    required BuildContext context,
    required IconData icon,
    required String text,
    required String offerText,
    required Color offerColor,
    required String paymentMethod,
  }) {
    return GestureDetector(
      onTap: () {
        _handlePayment(context, paymentMethod);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 6, 115, 148),
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[700],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(icon, color: Colors.grey[400]),
                  ),
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0,
                  ),
                  decoration: BoxDecoration(
                    color: offerColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    'Penawaran',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              offerText,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePayment(BuildContext context, String paymentMethod) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PaymentProcessingScreen(paymentMethod: paymentMethod),
      ),
    );
  }
}

class PaymentProcessingScreen extends StatelessWidget {
  final String paymentMethod;

  PaymentProcessingScreen({required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proses Pembayaran'),
        backgroundColor: Color.fromARGB(255, 21, 195, 226),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Memproses pembayaran menggunakan $paymentMethod',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: _getPaymentMethodIcon(paymentMethod),
            ),
            SizedBox(height: 20.0),
            CircularProgressIndicator(),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _completePayment(context);
              },
              child: Text('Selesai'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPaymentMethodIcon(String paymentMethod) {
    switch (paymentMethod) {
      case 'Kartu Kredit/Debit':
        return Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDdEOP9ktqgTKkn1M1XyxgpQF6sM2X7pnsEw&s', key: ValueKey('Kartu Kredit/Debit'));
      case 'Alfamart':
        return Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEPLtPaE2bk8M3xBVruItAzDNq8cZwsBTPZQ&s', key: ValueKey('Alfamart'));
      case 'BSI':
        return Image.network('',key: ValueKey('BSI'));
      case 'Indomaret':
        return Image.network('',key: ValueKey('Indomaret'));
      case 'Permata':
        return Image.network('https://example.com/permatabank.png', key: ValueKey('Permata'));
      case 'BRI':
        return Image.network('https://example.com/bri.png', key: ValueKey('BRI'));
      case 'BCA':
        return Image.network('https://example.com/bca.png', key: ValueKey('BCA'));
      case 'XL/AXIS 1':
      case 'XL/AXIS 2':
        return Image.network('https://example.com/xl.png', key: ValueKey('XL/AXIS'));
      case 'ShopeePay':
        return Image.network('https://example.com/shopeepay.png', key: ValueKey('ShopeePay'));
      case 'DANA':
        return Image.network('https://example.com/dana.png', key: ValueKey('DANA'));
      case 'DOKU':
        return Image.network('https://example.com/doku.png', key: ValueKey('DOKU'));
      case 'GoPay':
        return Image.network('https://example.com/gopay.png', key: ValueKey('GoPay'));
      case 'Kode':
        return Image.network('https://example.com/code.png', key: ValueKey('Kode'));
      case 'Saldo Google Play':
        return Image.network('https://example.com/google_play.png', key: ValueKey('Saldo Google Play'));
      default:
        return Container();
    }
  }

  void _completePayment(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Pembayaran Berhasil'),
          content: Text('Pembayaran menggunakan $paymentMethod berhasil.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

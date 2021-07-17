import 'package:flutter_starter_provider/providers/base_providers.dart';

class PusatBantuanProvider extends BaseProvider{

  List<String> litems = [
    "Saya lupa kata sandi Digidesa",
    "Akun saya tidak bisa melakukan top-up",
    "Bagaimana saya dapat mengetahui nomor token PLN yang telah dibayar?",
    "Bagaimana jika pembelian voucher game saya gagal?",
    "Saya tidak bisa melakukan transaksi angsuran kredit",
    "Saya belum menerima pengembalian dana yang terdebit lebih dari satu kali"
  ];

  String greeting() {
    var jam = DateTime.now().hour;
    if (jam < 12) {
      return 'Pagi';
    }
    if (jam < 15) {
      return 'Siang';
    }
    if(jam < 18){
      return 'Sore';
    }
    return 'Malam';
  }


}
import 'package:flutter/material.dart';
import '../ui/pasien_form.dart';
import '../ui/pasien_item.dart';
import '../model/pasien.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pasien"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PasienForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PasienItem(
              pasien: Pasien(
                  id: 1,
                  nomor_rm: "01",
                  nama: "Kiboy",
                  tanggal_lahir: "12 Desember 2022",
                  nomor_telepon: "0812345678",
                  alamat: "Kp. Rambutan RT 09/04")),
          PasienItem(
              pasien: Pasien(
                  id: 2,
                  nomor_rm: "02",
                  nama: "Calvin",
                  tanggal_lahir: "12 Mei 2002",
                  nomor_telepon: "0812345678",
                  alamat: "Kp. Rambutan RT 08/04")),
        ],
      ),
    );
  }
}

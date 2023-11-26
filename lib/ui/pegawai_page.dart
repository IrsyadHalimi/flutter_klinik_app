import 'package:flutter/material.dart';
import '../ui/pegawai_form.dart';
import '../model/pegawai.dart';
import '../ui/pegawai_item.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pegawai"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PegawaiForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PegawaiItem(
              pegawai: Pegawai(
                  nip: "1",
                  nama: "Lemon",
                  tanggal_lahir: "12-09-2008",
                  nomor_telepon: "12345678",
                  email: "email@com",
                  password: "11111111")),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../ui/pegawai_page.dart';
import '../model/pegawai.dart';
import '../ui/pegawai_update_form.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiDetail({super.key, required this.pegawai});

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Pegawai")),
      body: Column(children: [
        SizedBox(height: 20),
        Text(
          "NIP: ${widget.pegawai.nip}",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Nama Pegawai: ${widget.pegawai.nama}",
          style: TextStyle(fontSize: 20, height: 2),
        ),
        Text(
          "Tanggal Lahir: ${widget.pegawai.tanggal_lahir}",
          style: TextStyle(fontSize: 20, height: 2),
        ),
        Text(
          "Nomor Telepon: ${widget.pegawai.nomor_telepon}",
          style: TextStyle(fontSize: 20, height: 2),
        ),
        Text(
          "Email: ${widget.pegawai.email}",
          style: TextStyle(fontSize: 20, height: 2),
        ),
        SizedBox(height: 20),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [_tombolUbah(), _tombolHapus()])
      ]),
    );
  }

  _tombolUbah() {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PegawaiUpdateForm(pegawai: widget.pegawai)));
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        child: const Text("Ubah"));
  }

  _tombolHapus() {
    return ElevatedButton(
        onPressed: () {
          AlertDialog alertDialog = AlertDialog(
            content: const Text("Yakin Ingin Menghapus Data Ini?"),
            actions: [
              // Tombol Ya
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => PegawaiPage()));
                },
                child: const Text("Ya"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              ),
              // Tombol Tidak
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Tidak"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              )
            ],
          );
          showDialog(context: context, builder: (context) => alertDialog);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text("Hapus"));
  }
}

import 'package:flutter/material.dart';
import 'package:klinik_app/ui/pasien_page.dart';
import '../model/pasien.dart';
import '../ui/pasien_update_form.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;

  const PasienDetail({super.key, required this.pasien});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Pasien")),
      body: Column(children: [
        SizedBox(height: 20),
        Text(
          "No Rekam Medis: ${widget.pasien.nomor_rm}",
          style: TextStyle(fontSize: 20, height: 2),
        ),
        Text(
          "Nama Pasien: ${widget.pasien.nama}",
          style: TextStyle(fontSize: 20, height: 2),
        ),
        Text(
          "Tanggal Lahir: ${widget.pasien.tanggal_lahir}",
          style: TextStyle(fontSize: 20, height: 2),
        ),
        Text(
          "Nomor Telepon: ${widget.pasien.nomor_telepon}",
          style: TextStyle(fontSize: 20, height: 2),
        ),
        Text(
          "Email: ${widget.pasien.alamat}",
          style: TextStyle(fontSize: 20, height: 2),
        ),
        SizedBox(height: 30),
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
                      PasienUpdateForm(pasien: widget.pasien)));
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
                      MaterialPageRoute(builder: (context) => PasienPage()));
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

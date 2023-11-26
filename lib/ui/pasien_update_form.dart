import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../ui/pasien_detail.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({Key? key, required this.pasien}) : super(key: key);
  _PasienUpdateFormState createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomor_rmPasienCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _tanggal_lahirPasienCtrl = TextEditingController();
  final _nomor_telfonPasienCtrl = TextEditingController();
  final _alamatPasienCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _nomor_rmPasienCtrl.text = widget.pasien.nomor_rm;
      _namaPasienCtrl.text = widget.pasien.nama;
      _tanggal_lahirPasienCtrl.text = widget.pasien.tanggal_lahir;
      _nomor_telfonPasienCtrl.text = widget.pasien.nomor_telepon;
      _alamatPasienCtrl.text = widget.pasien.alamat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Data Pasien")),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  _fieldnomor_rmPasien(),
                  _fieldnamaPasien(),
                  _fieldtanggal_lahirPasien(),
                  _fieldnomor_telfonPasien(),
                  _fieldalamatPasien(),
                  SizedBox(height: 20),
                  _tombolSimpan()
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _fieldnomor_rmPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor RM Pasien"),
      controller: _nomor_rmPasienCtrl,
    );
  }

  _fieldnamaPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pasien"),
      controller: _namaPasienCtrl,
    );
  }

  _fieldtanggal_lahirPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tanggal Lahir Pasien"),
      controller: _tanggal_lahirPasienCtrl,
    );
  }

  _fieldnomor_telfonPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Telfon Pasien"),
      controller: _nomor_telfonPasienCtrl,
    );
  }

  _fieldalamatPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Alamat Pasien"),
      controller: _alamatPasienCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          Pasien pasien = new Pasien(
              nomor_rm: _nomor_rmPasienCtrl.text,
              nama: _namaPasienCtrl.text,
              tanggal_lahir: _tanggal_lahirPasienCtrl.text,
              nomor_telepon: _nomor_telfonPasienCtrl.text,
              alamat: _alamatPasienCtrl.text);
          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PasienDetail(pasien: pasien)));
        },
        child: const Text("Simpan Perubahan"));
  }
}

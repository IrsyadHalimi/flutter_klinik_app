import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../ui/pasien_detail.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({Key? key}) : super(key: key);

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _idPasienCtrl = TextEditingController();
  final _noRmPasienCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _ttlPasienCtrl = TextEditingController();
  final _tlpPasienCtrl = TextEditingController();
  final _alamatPasienCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pasien"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
            margin: EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  _fieldidPasien(),
                  _fieldNoRmPasien(),
                  _fieldNamaPasien(),
                  _fieldTtlPasien(),
                  _fieldTlpPasien(),
                  _fieldAlamatPasien(),
                  SizedBox(
                    height: 20,
                  ),
                  _tombolSimpan()
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _fieldidPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Id"),
      controller: _idPasienCtrl,
    );
  }

  _fieldNoRmPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Rm"),
      controller: _noRmPasienCtrl,
    );
  }

  _fieldNamaPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pasien"),
      controller: _namaPasienCtrl,
    );
  }

  _fieldTtlPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tempat Tanggal Lahir"),
      controller: _ttlPasienCtrl,
    );
  }

  _fieldTlpPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "No Telfon"),
      controller: _tlpPasienCtrl,
    );
  }

  _fieldAlamatPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Alamat"),
      controller: _alamatPasienCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Pasien pasien = new Pasien(
            nomor_rm: _noRmPasienCtrl.text,
            nama: _namaPasienCtrl.text,
            tanggal_lahir: _ttlPasienCtrl.text,
            nomor_telepon: _tlpPasienCtrl.text,
            alamat: _alamatPasienCtrl.text);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PasienDetail(pasien: pasien)));
      },
      child: const Text("Simpan"),
    );
  }
}

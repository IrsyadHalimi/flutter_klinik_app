import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../ui/pegawai_detail.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({Key? key}) : super(key: key);

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipPegawaiCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _ttlPegawaiCtrl = TextEditingController();
  final _tlpPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwordPegawaiCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Pegawai"),
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
                  _fieldNipPegawai(),
                  _fieldNamaPegawai(),
                  _fieldTtlPegawai(),
                  _fieldTlpPegawai(),
                  _fieldEmailPegawai(),
                  _fieldPasswordPegawai(),
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

  _fieldNipPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "NIP"),
      controller: _nipPegawaiCtrl,
    );
  }

  _fieldNamaPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pegawai"),
      controller: _namaPegawaiCtrl,
    );
  }

  _fieldTtlPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tempat Tanggal Lahir"),
      controller: _ttlPegawaiCtrl,
    );
  }

  _fieldTlpPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "No Telfon"),
      controller: _tlpPegawaiCtrl,
    );
  }

  _fieldEmailPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Email"),
      controller: _emailPegawaiCtrl,
    );
  }

  _fieldPasswordPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Password"),
      controller: _passwordPegawaiCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Pegawai pegawai = new Pegawai(
            nip: _nipPegawaiCtrl.text,
            nama: _namaPegawaiCtrl.text,
            tanggal_lahir: _ttlPegawaiCtrl.text,
            nomor_telepon: _tlpPegawaiCtrl.text,
            email: _emailPegawaiCtrl.text,
            password: _passwordPegawaiCtrl.text);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PegawaiDetail(pegawai: pegawai)));
      },
      child: const Text("Simpan"),
    );
  }
}

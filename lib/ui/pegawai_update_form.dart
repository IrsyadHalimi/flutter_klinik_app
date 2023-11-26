import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../ui/pegawai_detail.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);
  _PoliUpdateFormState createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipPegawaiCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _tanggal_lahirPegawaiCtrl = TextEditingController();
  final _nomor_telfonPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwordPegawaiCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _nipPegawaiCtrl.text = widget.pegawai.nip;
      _namaPegawaiCtrl.text = widget.pegawai.nama;
      _tanggal_lahirPegawaiCtrl.text = widget.pegawai.tanggal_lahir;
      _nomor_telfonPegawaiCtrl.text = widget.pegawai.nomor_telepon;
      _emailPegawaiCtrl.text = widget.pegawai.email;
      _passwordPegawaiCtrl.text = widget.pegawai.password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Data Pegawai")),
      body: SingleChildScrollView(
        child: Center(
          child: Card(
              margin: EdgeInsets.all(10),
              child: Container(
                padding: EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _fieldnipPegawai(),
                      _fieldnamaPegawai(),
                      _fieldtanggal_lahirPegawai(),
                      _fieldnomor_telfonPegawai(),
                      _fieldemailPegawai(),
                      _fieldpasswordPegawai(),
                      SizedBox(height: 20),
                      _tombolSimpan()
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  _fieldnipPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "NIP Pegawai"),
      controller: _nipPegawaiCtrl,
    );
  }

  _fieldnamaPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pegawai"),
      controller: _namaPegawaiCtrl,
    );
  }

  _fieldtanggal_lahirPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "NIP Pegawai"),
      controller: _tanggal_lahirPegawaiCtrl,
    );
  }

  _fieldnomor_telfonPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Telfon Pegawai"),
      controller: _nomor_telfonPegawaiCtrl,
    );
  }

  _fieldemailPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Email Pegawai"),
      controller: _emailPegawaiCtrl,
    );
  }

  _fieldpasswordPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Password Pegawai"),
      controller: _passwordPegawaiCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () {
          Pegawai pegawai = new Pegawai(
              nip: _nipPegawaiCtrl.text,
              nama: _namaPegawaiCtrl.text,
              tanggal_lahir: _tanggal_lahirPegawaiCtrl.text,
              nomor_telepon: _nomor_telfonPegawaiCtrl.text,
              email: _emailPegawaiCtrl.text,
              password: _passwordPegawaiCtrl.text);
          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => PegawaiDetail(pegawai: pegawai)));
        },
        child: const Text("Simpan Perubahan"));
  }
}

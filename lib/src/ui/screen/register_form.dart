import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class MyData {
  String? nama;
  String? nim;
  String? kelas;
  String? email;
  String? phone;
  String? prodi;
  String? username;
  String? password;
  String? confirm_password;

  MyData({
    this.email,
    this.phone,
    this.prodi,
    this.username,
    this.kelas,
    this.password,
    this.confirm_password,
    this.nama,
    this.nim
  });

  factory MyData.fromJson(Map<String, dynamic> json) => MyData(
    nama: json['nama'],
    nim: json['nim'],
    kelas: json['kelas'],
    email: json['email'],
    phone: json['phone'],
    prodi: json['prodi'],
    username: json['username'],
    password: json['password'],
    confirm_password: json['confirm_password']
  );
  
  Future<MyData> createData() async {
    Map<String, dynamic> request = {
      'nama': nama,
      'nim': nim,
      'kelas': kelas,
      'email': email,
      'phone': phone,
      'prodi': prodi,
      'username': username,
      'password': password,
      'confirm_password': confirm_password
    };

    final uri = Uri.parse("http://192.168.1.9:8000/api/register");
    final response = await http.post(uri, body: request);

    if(response.statusCode == 201) {
      print(response);
      return MyData.fromJson(json.decode(response.body));
    } else {
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to load API');
    }
  }
}

class _RegisterFormState extends State<RegisterForm> {
  List<String> listProdi = <String> [
    'Teknologi Rekayasa Perangkat Lunak',
    'Teknologi Rekayasa Komputer',
    'Bisnis Digital',
    'Teknik Sipil',
    'Teknologi Rekayasa Konstruksi Jalan dan Jembatan',
    'Teknologi Rekayasa Manufaktur',
    'Teknologi Rekayasa Kapal'
  ];
  late String listProdiSelected = listProdi.first;
  int currentStep = 0;

  List<GlobalKey<FormState>> formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>()];

  RegExp get _emailRegex => RegExp(r'(?!.*\.\.)(^[^\.][^@\s]+@[^@\s]+\.[^@\s\.]+$)');

  MyData data = MyData();

  String? password;

  TextEditingController inputName = TextEditingController();
  TextEditingController inputNim = TextEditingController();
  TextEditingController inputEmail = TextEditingController();
  TextEditingController inputPhone = TextEditingController();
  TextEditingController inputKelas = TextEditingController();
  TextEditingController inputProdi = TextEditingController();
  TextEditingController inputUsername = TextEditingController();
  TextEditingController inputPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Expanded(
        child: Stepper(
              type: StepperType.horizontal,
              currentStep: currentStep,
              onStepCancel: () => currentStep == 0
                  ? null
                  : setState(() {
                      currentStep -= 1;
                    }),
              onStepContinue: () {
                if (!formKeys[currentStep].currentState!.validate()) {
                  return;
                }
                    
                bool isLastStep = (currentStep == getSteps().length - 1);
                if (isLastStep) {
                    print('Submit');
                    submitData();
                } else {
                  setState(() {
                    currentStep += 1;
                  });
                }
              },
              onStepTapped: (step) => setState(() {
                currentStep = step;
              }),
              steps: getSteps(),
        ),
      );
  }

  List<Step> getSteps() {
    return <Step> [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text("Personal Info"),
        content: Form(key: formKeys[0] ,child: Column(
          children: [
            TextFormField(
              controller: inputName,
              decoration: const InputDecoration(
                  label: Text("Nama Lengkap"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline_rounded)
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required!';
                }
                return null;
              },
              onSaved: (value) {
                data.nama = value!;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: inputNim,
              decoration: const InputDecoration(
                  label: Text("Nomor Induk Mahasiswa"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.badge_outlined)
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required!';
                }
                return null;
              },
              onSaved: (value) {
                data.nim = value!;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: inputKelas,
              decoration: const InputDecoration(
                  label: Text("Kelas"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers)
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required!';
                }
                return null;
              },
              onSaved: (value) {
                data.kelas = value!;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: inputEmail,
              decoration: const InputDecoration(
                  label: Text("Email"),
                  prefixIcon: Icon(Icons.email_outlined),
                  border: OutlineInputBorder()
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                    return 'This field is required!';
                  }
                if (!_emailRegex.hasMatch(value)) {
                  return 'Email address is not valid';
                }
                return null;
              },
              onSaved: (value) {
                data.email = value!;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: inputPhone,
              decoration: const InputDecoration(
                  label: Text("Phone Number"),
                  prefixIcon: Icon(Icons.contacts_outlined),
                  border: OutlineInputBorder()
              ),
              onSaved: (value) {
                data.phone = value!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                    return 'This field is required!';
                  }
                return null;
              },
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              value: listProdiSelected,
              items: listProdi.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(value: value, child: Text(value));
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  listProdiSelected = value!;
                });
              },
              decoration: const InputDecoration(
                  label: Text("Program Studi"),
                  prefixIcon: Icon(Icons.school_outlined),
                  border: OutlineInputBorder()
              ),
              isDense: true,
              isExpanded: true,
              onSaved: (value) {
                data.prodi = value!;
              },
            ),
          ],
        ))
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text("Account Info"),
        content: Form(key: formKeys[1] ,child: Column(
          children: [
            TextFormField(
              controller: inputUsername,
              decoration: const InputDecoration(
                  label: Text("Username"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.face)
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                    return 'This field is required!';
                  }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: inputPassword,
              decoration: const InputDecoration(
                  label: Text("Password"),
                  prefixIcon: Icon(Icons.fingerprint),
                  border: OutlineInputBorder()
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                    return 'This field is required!';
                  }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text("Confirm Password"),
                  prefixIcon: Icon(Icons.fingerprint),
                  border: OutlineInputBorder()
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                    return 'This field is required!';
                }
                if (value != password) {
                  return 'The password you entered is different';
                }
                return null;
              }
            )
          ],
        ))
      )
    ];
  }

  void submitData() {
    final getNama = inputName.text;
    final getNim = inputNim.text;
    final getEmail = inputEmail.text;
    final getPhone = inputPhone.text;
    final getKelas = inputKelas.text;
    final getProdi = listProdiSelected;
    final getUsername = inputUsername.text;
    final getPassword = inputPassword.text;

    MyData(nama: getNama, nim: getNim, email: getEmail, phone: getPhone, kelas: getKelas, prodi: getProdi, username: getUsername, password: getPassword, confirm_password: getPassword).createData();
  }
}
import 'package:flutter/material.dart';
import 'package:upk_454_app/src/model/pjmk.dart';
import 'package:upk_454_app/src/ui/pages/pjmk_page.dart';

class PersonalForm extends StatefulWidget { 
  const PersonalForm({Key? key}) : super(key: key);
  @override _PersonalFormState createState() => _PersonalFormState();
}


class _PersonalFormState extends State<PersonalForm> {
  final List<Person> persons = [];

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _personalIdController = TextEditingController();
  final _prodiController = TextEditingController();
  final _yearController = TextEditingController();
  final _passwordController = TextEditingController();
  DateTime? _birthDate;

  
  bool isVerificationDone= false;
  String inputValue = '';
  bool isPhoneNumberValid = false;
  bool agreeToTerms = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _birthDate) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const Image(
          image: AssetImage('assets/images/bg-gedung 1.jpg'),
          fit: BoxFit.cover
        ),
        toolbarHeight: 100
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: <Widget >[
            _textTitle(),
            _textboxFullName(),
            _textboxPersonalID(),
            _textboxPhone(),
            _textboxEmail(),
            _dropdownProdi(),
            _textboxYear(),
            _textboxPassword(),
            _tombolSimpan()
          ].map((widget) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: widget
            )).toList()
        ),
      ),
    );
  }

  TextStyle labelTextStyle() {
    return const TextStyle(
        color: Color(0xFF2A2A2A),
        fontSize: 14,
        fontFamily: 'Chivo',
        fontWeight: FontWeight.w400,
        height: 0,
      );
  }

  TextStyle placeholderStyle() {
    return const TextStyle(
      color: Color(0xFF9E9E9E),
      fontSize: 14,
      fontFamily: 'Chivo',
      fontWeight: FontWeight.w400,
      height: 0,
    );
  }

  InputDecoration defaultInputDecor(String placeholder) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      hintText: placeholder,
      hintStyle: placeholderStyle(),
      contentPadding: const EdgeInsets.fromLTRB(10, 5, 8, 10)
    );
  }

  _textTitle() {
    return const Center(
      child: Column(
        children: [
          Text('Pengisian Data',
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600
            ),
          ),
          Text('Identitas Diri',
            style: TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400
            ),
          ),

        ]
      )
    );
  }

  _textboxFullName() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Full Name',
              style: labelTextStyle(),
          ), 
          TextField(
            decoration: defaultInputDecor("Masukkan Nama Lengkap"),
            controller: _fullNameController
          )
        ]
      )
    );
  }

  _textboxEmail() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Email',
              style: labelTextStyle(), 
          ),
          TextField(
            decoration: defaultInputDecor("Masukkan Email Anda"),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
          )
        ]
      )
    );  
  }


  _textboxPhone() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Nomor Telepon',
              style: labelTextStyle(),
          ),
          TextField(
            decoration: defaultInputDecor("Masukkan Nomor Telepon"),
            controller: _phoneNumberController,
            keyboardType: TextInputType.phone,
          )
        ]
      )
    );
  }

  _dropdownProdi() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Program Studi',
              style: labelTextStyle(),
          ), 
          TextField(
            decoration: defaultInputDecor("Masukkan Program Studi"),
            controller: _prodiController
          )
        ]
      )
    );
  }

_textboxPersonalID() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'NIM (Nomor Induk Mahasiswa)',
              style: labelTextStyle(),
          ),
          TextField(
            decoration: defaultInputDecor("Masukkan NIM Anda"),
            controller: _personalIdController,
            keyboardType: TextInputType.number
          )
        ]
      )
    );  
  }
  
  _textboxYear() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Tahun Angkatan',
              style: labelTextStyle(),
          ),
          TextField(
            decoration: defaultInputDecor("Masukkan Tahun Angkatan, Contoh : 2022"),
            controller: _yearController
          )
        ]
    );
  }

  _textboxPassword() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Password',
              style: labelTextStyle(),
          ),
          TextField(
            obscureText: true,
            obscuringCharacter: "*",
            decoration: defaultInputDecor("Masukkan Password Akun"),
            controller: _passwordController
          )
        ]
    );
  }

   _checkboxAgree() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Checkbox(
          value: agreeToTerms,
          onChanged: (bool? value){
            setState(() {
              agreeToTerms = value ?? false;
            });
          }
        ),
        const Expanded(
          child: Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 10,
            )
          )
        )
      ]
    );  
  }

  _inputCalendar() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Birth Date',
              style: labelTextStyle()
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))

            ),
            child: ListTile(
              title: Text(_birthDate == null ? "Select Date" : "${_birthDate?.toLocal()}".split(' ')[0]),
              titleTextStyle: TextStyle(
                color: _birthDate == null ? Color(0xFF9E9E9E) : Colors.black,
                fontSize: 14,
                fontFamily: 'Chivo',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () {
                _selectDate(context);
              },
            )
          )
        ]
    );
  }


  _tombolSimpan() {
    return Align(
      alignment: Alignment.bottomRight,
      child: ElevatedButton (
            onPressed: () {
              Person newPerson = Person(
                fullName: _fullNameController.text,
                email: _emailController.text,
                phoneNumber:  _phoneNumberController.text,
                personalId: _personalIdController.text,
                prodi: _prodiController.text,
                year: _yearController.text,
                password: _passwordController.text,
              );

              persons.add(newPerson);

              Navigator
                .of(context)
                .push(MaterialPageRoute(
                  builder: (context) => PJMKDetail(items: persons,)
                  )
                );
            },

            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              backgroundColor: Color.fromARGB(255, 10, 148, 150),
            ),
            
            child: const Text('Selanjutnya', 
                style: TextStyle(
                  color: Colors.white
                ),
            )
          )
    );
  }
}

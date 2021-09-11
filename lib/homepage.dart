import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class HomePage extends StatelessWidget {
  static String id = 'home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    final _nameController = TextEditingController();
    final _numberController = TextEditingController();
    final _offEmailController = TextEditingController();
    final _fscodeController = TextEditingController();
    final _addresscodeController = TextEditingController();
    final _descController = TextEditingController();

    String _phoneCode = '+91'; // Define yor default phone code
    String _initialSelection = 'IN';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Partner With Us'),
        centerTitle: true,
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 12),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: const TextStyle(color: Colors.white),
                    //hintText: "Enter your FullName",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  ),
                  validator: (name) {
                    // Basic validation
                    if (name?.isEmpty ?? false) {
                      return "Please Enter Your Name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _numberController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20, 20.0, 20.0, 20.0),
                      isDense: true,
                      labelText: "  Phone Number",
                      labelStyle: const TextStyle(color: Colors.white),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      /*OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(50)),*/
                      //labelText: "phone_number",
                      //floatingLabelBehavior: FloatingLabelBehavior.always,
                      prefixIcon: Container(
                        //padding: const EdgeInsets.only(left: 8.0),
                        decoration: const BoxDecoration(
                            /* border: Border(
                              right: BorderSide(
                            color: Colors.grey,
                          )),*/
                            ),
                        child: CountryCodePicker(
                            alignLeft: false,
                            dialogSize: Size.infinite,
                            initialSelection: _initialSelection,
                            onChanged: (country) {
                              /// Get country code
                              _phoneCode = country.dialCode!;
                            }),
                      )),
                  keyboardType: TextInputType.number,
                  validator: (number) {
                    // Basic validation
                    if (number == null || number.isEmpty) {
                      return ("Please enter your Phone Number");
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _offEmailController,
                  decoration: InputDecoration(
                    labelText: "Official Email",
                    labelStyle: const TextStyle(color: Colors.white),
                    //hintText: "Enter your FullName",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  ),
                  validator: (email) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email!);
                    // Basic validation
                    if (!emailValid || email.isEmpty) {
                      return "Please Enter a valid Official Email Address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _fscodeController,
                  decoration: InputDecoration(
                    labelText: "FSSAI Code",
                    labelStyle: const TextStyle(color: Colors.white),
                    //hintText: "Enter your FullName",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  ),
                  validator: (name) {
                    // Basic validation
                    if (name?.isEmpty ?? false) {
                      return "Please Enter Your Restaurant FSSAI Code";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _addresscodeController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Address",
                    labelStyle: const TextStyle(color: Colors.white),
                    //hintText: "Enter your FullName",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  ),
                  validator: (name) {
                    // Basic validation
                    if (name?.isEmpty ?? false) {
                      return "Please Enter Your Restaurant Address";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _descController,
                  maxLines: 8,
                  decoration: InputDecoration(
                    labelText: "Description",
                    labelStyle: const TextStyle(color: Colors.white),
                    //hintText: "Enter your FullName",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  ),
                  validator: (name) {
                    // Basic validation
                    if (name?.isEmpty ?? false) {
                      return "Please enter a Description";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 65,
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: const Text("Submit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlueAccent)),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('Registered');
                      } else {
                        print('Error');
                      }

                      /// Sign up
                      // nextPage(context);
                      // _createAccount();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

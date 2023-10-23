import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:deneme_a/basvuruGecmisi.dart';
import 'package:deneme_a/kullanici.dart';
import 'package:deneme_a/kullaniciservisi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class basvuru extends StatefulWidget {
  @override
  State<basvuru> createState() => _basvuruState();
}

class _basvuruState extends State<basvuru> {
  final KullaniciServisi _servis = KullaniciServisi();

  AddressInfo selectedAddressInfo = AddressInfo();
  String? selectedRT;
  String? selectedRTW;
  String? selectedClient;
  String Durum = "İstek Alındı";

  @override
  void initState() {
    super.initState();
  }

  setSelectedRT(String value) {
    setState(() {
      selectedRT = value;
    });
  }

  setSelectedRTW(String val) {
    setState(() {
      selectedRTW = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5.0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 10,),
                Container(child: Text("ATIK TÜRÜ SEÇİNİZ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.35),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      RadioListTile(
                        value: "Elektronik",
                        groupValue: selectedRT,
                        onChanged: (value) {
                          print("$value Türünü Seçtiniz");
                          setSelectedRT(value!);
                        },
                        activeColor: Colors.green,
                        toggleable: true,
                        title: const Text("Elektronik"),
                      ),
                      RadioListTile(
                        value: "Kağıt",
                        groupValue: selectedRT,
                        onChanged: (value) {
                          print("$value Türünü Seçtiniz");
                          setSelectedRT(value!);
                        },
                        toggleable: true,
                        activeColor: Colors.green,
                        title: const Text("Kağıt"),
                      ),
                      RadioListTile(
                        value: "Metal",
                        groupValue: selectedRT,
                        onChanged: ( value) {
                          print("$value Türünü Seçtiniz");
                          setSelectedRT(value!);
                        },
                        toggleable: true,
                        activeColor: Colors.green,
                        title: const Text("Metal"),
                      ),
                      RadioListTile(
                        value: "Plastik",
                        groupValue: selectedRT,
                        onChanged: (value) {
                          print("$value Türünü Seçtiniz");
                          setSelectedRT(value!);
                        },
                        toggleable: true,
                        activeColor: Colors.green,
                        title: const Text("Plastik"),
                      ),
                      RadioListTile(
                        value: "Diğer",
                        groupValue: selectedRT,
                        onChanged: (value) {
                          print("$value Türünü Seçtiniz");
                          setSelectedRT(value!);
                        },
                        toggleable: true,
                        activeColor: Colors.green,
                        title: const Text("Diğer"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(child: Text("AĞIRLIK SEÇİNİZ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green.withOpacity(0.35),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      RadioListTile(
                        value: '500 gr',
                        groupValue: selectedRTW,
                        onChanged: (val) {
                          print("Ağırlığı $val olarak belirlediniz");
                          setSelectedRTW(val!);
                        },
                        toggleable: true,
                        activeColor: Colors.green,
                        title: const Text("500 Gr"),
                      ),
                      RadioListTile(
                        value: '1 Kg',
                        groupValue: selectedRTW,
                        onChanged: (val) {
                          print("Ağırlığı $val olarak belirlediniz");
                          setSelectedRTW(val!);
                        },
                        toggleable: true,
                        activeColor: Colors.green,
                        title: const Text("1 Kg"),
                      ),
                      RadioListTile(
                        value: '2 kg',
                        groupValue: selectedRTW,
                        onChanged: (val) {
                          print("Ağırlığı $val olarak belirlediniz");
                          setSelectedRTW(val!);
                        },
                        toggleable: true,
                        activeColor: Colors.green,
                        title: const Text("2 Kg"),
                      ),
                      RadioListTile(
                        value: '3 kg',
                        groupValue: selectedRTW,
                        onChanged: (val) {
                          print("Ağırlığı $val olarak belirlediniz");
                          setSelectedRTW(val!);
                        },
                        toggleable: true,
                        activeColor: Colors.green,
                        title: const Text("3 Kg"),
                      ),
                      RadioListTile(
                        value: 'Daha Fazla',
                        groupValue: selectedRTW,
                        onChanged: (val) {
                          print("Ağırlığı $val olarak belirlediniz");
                          setSelectedRTW(val!);
                        },
                        toggleable: true,
                        activeColor: Colors.green,
                        title: const Text("Daha Fazla"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('tasimaSirketi').snapshots(),
                        builder: (context, snapshot) {
                          List<DropdownMenuItem> clientsItems = [];
                          if (!snapshot.hasData) {
                            return CircularProgressIndicator();
                          } else {
                            final clients = snapshot.data!.docs.reversed.toList();
                            for (var client in clients) {
                              clientsItems.add(DropdownMenuItem(
                                value: client['Ad'],
                                child: Text(client['Ad'],),
                              ),
                              );
                            }
                          }
                          return DropdownButton(
                            items: clientsItems,
                            onChanged: (clientValue) {
                              print("$clientValue Seçimini Yaptınız");
                              setState(() {
                                selectedClient = clientValue;
                              });
                            },
                            hint: Text("Taşıma Şirketi Seçiniz"),
                            value: selectedClient,
                            isExpanded: false,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            );
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children:[
                      CSCPicker(
                  layout: Layout.vertical,
                  onCountryChanged: (country) {
                    setState(() {
                      selectedAddressInfo.country=country;
                    });
                  },
                    countryFilter: [CscCountry.Turkey],
                        flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                    countrySearchPlaceholder: "Ülke Seçiniz",
                    countryDropdownLabel: "Ülke",
                  onStateChanged: (state) {
                    setState(() {
                      selectedAddressInfo.state=state;
                    });
                  },
                    stateSearchPlaceholder: "İl Seçiniz",
                    stateDropdownLabel: "İl",
                  onCityChanged: (city) {
                    setState(() {
                      selectedAddressInfo.city=city;
                    });
                  },
                    citySearchPlaceholder: "İlçe Seçiniz",
                    cityDropdownLabel: "İlçe",
                    dropdownDecoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                ),
                    SizedBox(height:10),
                  TextField(
                      maxLines: 5,
                      onChanged:(address){
                        setState(() {
                          selectedAddressInfo.address=address;
                        });
                      },
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: "Açık Adres",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15.5,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )
                    ),
                    ),
                     ],
                ),),
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        textStyle: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.w600)
                    ),
                    onPressed: () async {
                      User? user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        if (selectedRT != null &&
                            selectedRTW != null &&
                            selectedClient != null &&
                            selectedAddressInfo.isValid()) {
                          String userId = user.uid;
                          _servis.addRequest(
                              selectedRT!, selectedRTW!, selectedClient!, Durum, selectedAddressInfo.toString(), userId);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => basvuruGecmisi()));
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Hata'),
                                content: Text('Lütfen tüm alanları doldurun.'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Tamam'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    child: Text(
                        "KAYDET"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
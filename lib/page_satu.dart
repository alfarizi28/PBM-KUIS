import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malingkundang/pade_dua.dart';

// ignore: camel_case_types
class pageSatu extends StatelessWidget {
  const pageSatu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: mediaQueryHeight * 0.45,
            // color: Colors.black,
            child: const Image(
                fit: BoxFit.cover, image: AssetImage("images/bg.jpg")),
          ),
          Container(
            height: mediaQueryHeight * 0.01,
            color: Color(0xffe1e1e1),
          ),
          Container(
            // height: mediaQueryHeight * 0.1,
            // width: mediaQueryWidth * 0.5,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff499595),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const pageDua();
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.play_arrow),
                    Text(
                      "Play The Audio",
                    )
                  ],
                )),
          ),
          SizedBox(
            height: mediaQueryHeight * 0.05,
            child: const Text(
              "Malin Kundang",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24,
                  height: 1.5,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff808080)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mediaQueryHeight * 0.13,
              // color: Colors.amber,
              child: const Text(
                "Pada zaman dahulu kalah di pesisir pantai Sumatera Barat hidup lah satu keluarga nelayan yang terdiri dari ayah, ibu dan anak laki-laki bernama Malin Kundang. Kehidupan mereka sangat lah susah dan serba kekurangan.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mediaQueryHeight * 0.105,
              // color: Colors.red,
              child: const Text(
                "Menyadari kondisinya tersebut, sang ayah akhirnya memutuskan untuk merantau ke negeri seberang. Ia berharap bisa mengubah nasib keluarganya, terutama sang anak.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mediaQueryHeight * 0.105,
              // color: Colors.red,
              child: const Text(
                "Malin Kundang pun tinggal berdua bersama sang ibu. Setelah satu tahun lamanya ditinggal, sang ayah tak kunjung pulang dan memberikan kabar. Keluarga itu pun pasrah menerima kenyataan.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mediaQueryHeight * 0.105,
              // color: Colors.red,
              child: const Text(
                "Waktu terus berjalan hingga akhirnya Malin Kundang tumbuh menjadi pemuda yang pekerja keras. Dia selalu membantu ibunya mencari uang dan akhirnya memutuskan untuk merantau juga.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mediaQueryHeight * 0.105,
              // color: Colors.red,
              child: const Text(
                "Walau dengan berat hati, sang ibu mengikhlaskan Malin Kundang untuk pergi mencari uang ke negeri seberang. Malin pun berjanji untuk kembali dan membahagiakan sang ibu.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mediaQueryHeight * 0.15,
              // color: Colors.red,
              child: const Text(
                "Setelah beberapa tahun, Malin Kundang kembali ke kampung halamannya. Ia menggunakan pakaian yang bagus dan berlayar dengan kapal besar. Hal itu pun menjadi perhatian warga setempat hingga akhirnya salah satu warga mengenali Malin Kundang.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mediaQueryHeight * 0.13,
              // color: Colors.red,
              child: const Text(
                "Ibunya pun mendengar kabar Malin Kundang kembali dan berada di pelabuhan. Saat sang Ibu memanggil namanya, Malin tak mengakui bahwa wanita tua tersebut adalah wanita yang telah melahirkannya.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mediaQueryHeight * 0.1,
              // color: Colors.red,
              child: const Text(
                "Istri Malin Kundang juga bertanya terkait kebenaran apakah sang ibu adalah wanita tua dan miskin. Malin tetap kukuh dan menolak mengakui keberadaan sang Ibu.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mediaQueryHeight * 0.13,
              // color: Colors.red,
              child: const Text(
                "Kecewa melihat perilaku sang anak, Ibu Malin Kundang pun berdoa kepada tuhan agar anaknya diberi hukuman yang berat. Sehari setelahnya, Malin Kundang, kapal dan awak kapalnya tersambar petir dan berubah menjadi batu.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: mediaQueryHeight * 0.1,
              // color: Colors.red,
              child: const Text(
                "Sang ibu percaya bahwa itu adalah hukuman dari Tuhan yang maha Esa kepada Malin Kundang karena durhaka tak mengakui sang ibu. Saat ini, batu yang dipercaya sebagai Malin Kundang masih berdiri di pantai di Sumatera Barat.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

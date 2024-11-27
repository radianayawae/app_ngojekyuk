import 'package:flutter/material.dart';
import 'package:gojek/constans.dart';
import 'package:gojek/beranda/beranda_gojek_appbar.dart';
import 'dart:async';

class BerandaPage extends StatefulWidget {
  @override
  _BerandaPageState createState() => new _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  List<GojekService> _gojekServiceList = [];

  @override
  void initState() {
    super.initState();

    _gojekServiceList = [
      GojekService(
          image: Icons.directions_bike,
          color: GojekPalette.menuRide,
          title: "GO-RIDE"),
      GojekService(
          image: Icons.local_car_wash,
          color: GojekPalette.menuCar,
          title: "GO-CAR"),
      GojekService(
          image: Icons.directions_car,
          color: GojekPalette.menuBluebird,
          title: "GO-BLUEBIRD"),
      GojekService(
          image: Icons.restaurant,
          color: GojekPalette.menuFood,
          title: "GO-FOOD"),
      GojekService(
          image: Icons.next_week,
          color: GojekPalette.menuSend,
          title: "GO-SEND"),
      GojekService(
          image: Icons.local_offer,
          color: GojekPalette.menuDeals,
          title: "GO-DEALS"),
      GojekService(
          image: Icons.phonelink_ring,
          color: GojekPalette.menuPulsa,
          title: "GO-PULSA"),
      GojekService(
          image: Icons.apps, color: GojekPalette.menuOther, title: "LAINNYA"),
      GojekService(
          image: Icons.shopping_basket,
          color: GojekPalette.menuShop,
          title: "GO-SHOP"),
      GojekService(
          image: Icons.shopping_cart,
          color: GojekPalette.menuMart,
          title: "GO-MART"),
      GojekService(
          image: Icons.local_play,
          color: GojekPalette.menuTix,
          title: "GO-TIX"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GojekAppBar(),
        backgroundColor: GojekPalette.grey,
        body: Container(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    _buildGopayMenu(),
                    _buildGojekServicesMenu(),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 16.0),
                child: Column(
                  children: <Widget>[
                    _buildGoFoodFeatured(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGopayMenu() {
    return Container(
      height: 120.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
        ),
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [const Color(0xff3164bd), const Color(0xff295cb5)],
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(3.0),
                  topRight: Radius.circular(3.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "GOPAY",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: "NeoSansBold"),
                ),
                Container(
                  child: Text(
                    "Rp. 120.000",
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontFamily: "NeoSansBold"),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 32.0, right: 32.0, top: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildGopayAction("Transfer", "assets/icons/icon_transfer.png"),
                _buildGopayAction("Scan QR", "assets/icons/icon_scan.png"),
                _buildGopayAction("Isi Saldo", "assets/icons/icon_saldo.png"),
                _buildGopayAction("Lainnya", "assets/icons/icon_menu.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGopayAction(String title, String assetPath) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          assetPath,
          width: 32.0,
          height: 32.0,
        ),
        SizedBox(height: 10.0),
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
      ],
    );
  }

  Widget _buildGojekServicesMenu() {
    return SizedBox(
      width: double.infinity,
      height: 220.0,
      child: Container(
        margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: GridView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: _gojekServiceList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, position) {
            return _rowGojekService(_gojekServiceList[position]);
          },
        ),
      ),
    );
  }

  Widget _rowGojekService(GojekService gojekService) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return _buildMenuBottomSheet();
                  });
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: GojekPalette.grey200, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              padding: EdgeInsets.all(12.0),
              child: Icon(
                gojekService.image,
                color: gojekService.color,
                size: 32.0,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 6.0)),
          Text(gojekService.title, style: TextStyle(fontSize: 10.0)),
        ],
      ),
    );
  }

  Widget _buildGoFoodFeatured() {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "GO-FOOD",
            style: TextStyle(fontFamily: "NeoSansBold"),
          ),
          Padding(padding: EdgeInsets.only(top: 8.0)),
          Text(
            "Pilihan Terlaris",
            style: TextStyle(fontFamily: "NeoSansBold"),
          ),
          SizedBox(
            height: 172.0,
            child: FutureBuilder<List<Food>>(
              future: fetchFood(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SizedBox(
                      width: 40.0,
                      height: 40.0,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData && snapshot.data != null) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    padding: EdgeInsets.only(top: 12.0),
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return _rowGoFoodFeatured(snapshot.data![index]);
                    },
                  );
                }
                return Center(child: Text("No data available"));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowGoFoodFeatured(Food food) {
    return Container(
      margin: EdgeInsets.only(right: 16.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              food.image,
              width: 132.0,
              height: 132.0,
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 8.0)),
          Text(
            food.title,
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuBottomSheet() {
    return StatefulBuilder(builder: (context, setState) {
      return SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0), color: Colors.white),
          child: Column(children: <Widget>[
            Icon(
              Icons.drag_handle,
              color: GojekPalette.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "GO-JEK Services",
                  style: TextStyle(fontFamily: "NeoSansBold", fontSize: 18.0),
                ),
                OutlinedButton(
                  onPressed: () {}, // Add relevant action here
                  child: Text(
                    "EDIT FAVORITES",
                    style: TextStyle(fontSize: 12.0, color: GojekPalette.green),
                  ),
                ),
              ],
            ),
            Container(
              height: 300.0,
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: _gojekServiceList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, position) {
                  return _rowGojekService(_gojekServiceList[position]);
                },
              ),
            ),
          ]),
        ),
      );
    });
  }

  Future<List<Food>> fetchFood() async {
    List<Food> _goFoodFeaturedList = [];
    _goFoodFeaturedList
        .add(Food(title: "Steak Andakar", image: "assets/images/food_1.jpg"));
    _goFoodFeaturedList
        .add(Food(title: "Mie Ayam Tumini", image: "assets/images/food_2.jpg"));
    _goFoodFeaturedList
        .add(Food(title: "Tengkleng Hohah", image: "assets/images/food_3.jpg"));
    _goFoodFeaturedList
        .add(Food(title: "Warung Steak", image: "assets/images/food_4.jpg"));
    _goFoodFeaturedList.add(
        Food(title: "Kindai Warung Banjar", image: "assets/images/food_5.jpg"));

    return Future.delayed(Duration(seconds: 1), () {
      return _goFoodFeaturedList;
    });
  }

  Future<List<Promo>> fetchPromo() async {
    List<Promo> _promoList = [];

    _promoList.add(Promo(
      image: "assets/images/promo_1.jpg",
      title: "Bayar PLN dan BPJS, dapat cashback 10%",
      content:
          "Nikmatin cashback 10% untuk pembayaran PLN, BPJS, Google Voucher dan tagihan lain di GO-BILS.",
      button: "MAU!",
    ));
    _promoList.add(Promo(
      image: "assets/images/promo_2.jpg",
      title: "#CeritaGojek",
      content:
          "Berulang kali terpuruk tak menghalanginya untuk bangkit dan jadi kebanggaan kami. Simak selengkapnya di sini.",
      button: "SELENGKAPNYA",
    ));
    _promoList.add(Promo(
      image: "assets/images/promo_3.jpg",
      title: "GOJEK Ultah Ke 8",
      content:
          "8 Tahun berdiri ada satu alasan kami tetap tumbuh dan berinovasi.",
      button: "CARI TAU!",
    ));
    _promoList.add(Promo(
      image: "assets/images/promo_4.jpg",
      title: "Gratis Pulsa 100rb*",
      content:
          "Aktifkan 10 Voucher GO-PULSAmu sekarang biar ngabarin yang terdekat gak pakai terhambat.",
      button: "LAKSANAKAN",
    ));

    return Future.delayed(Duration(seconds: 3), () {
      return _promoList;
    });
  }
}

class GojekService {
  IconData image;
  Color color;
  String title;

  GojekService({required this.image, required this.color, required this.title});
}

class Food {
  String title;
  String image;

  Food({required this.title, required this.image});
}

class Promo {
  String image;
  String title;
  String content;
  String button;

  Promo(
      {required this.image,
      required this.title,
      required this.content,
      required this.button});
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mauriapp/pages/detailPage.dart';

const menus = [
  'Electronics',
  'Home Applicance',
  'Health & Beauty',
  'Baby\'s Accessories',
  'Men Fashion',
  'Women Fashion'
];
var bottomAppBarItems = [
  'My Orders',
  'Category',
  'Home',
  'My Cart',
  'My Account'
];

class NavItem {
  IconData? icon;
  String name;
  Function onPressed;
  NavItem({this.icon, required this.name, required this.onPressed});
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 32,
          backgroundColor: Colors.red,
          child: Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[200],
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
          child: Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  5,
                  (index) => Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (index == 0) Icon(Icons.menu_open),
                          if (index == 1) Icon(Icons.favorite_outline),
                          if (index == 3) Icon(Icons.shopping_bag),
                          if (index == 4) Icon(Icons.person),
                          SizedBox(height: 10),
                          // if (index == 2) Icon(Icons.home),
                          Text(
                            bottomAppBarItems[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.blueGrey),
                          )
                        ],
                      ))),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          AppHeader(),
          SizedBox(
            height: 20,
          ),
          Carousel(),
          SizedBox(
            height: 30,
          ),
          Categories(),
          SizedBox(
            height: 30,
          ),
          FlashSaleRow(),
          SizedBox(
            height: 10,
          ),
          FlashSaleItem(),
          SizedBox(
            height: 30,
          ),
          FeaturedProductsTitle(),
          SizedBox(
            height: 10,
          ),
          FeaturedProductsItems(),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: NetworkImage(
                //         "https://images.unsplash.com/photo-1651224074828-78818c4b74f9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2R1Y3QlMjBzYWxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                //     fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
            height: 190,
            width: MediaQuery.of(context).size.width * .9,
          ),
          SizedBox(
            height: 40,
          ),
          OurServices(),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Best Sellar",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.grey.shade700,
                  ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300)),
                      child: Stack(alignment: Alignment.center, children: [
                        Image.asset('assets/veg.png'),
                        Positioned(
                            right: 20,
                            top: 10,
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.red,
                                  ),
                                ),
                                child: Text(
                                  "50% off all",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: Colors.red),
                                ))),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Colors.grey.withOpacity(.1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 6),
                            // width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Rs 1200",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                Text("Hair Care Set",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium)
                              ],
                            ),
                          ),
                        )
                      ]),
                    )),
          ),
          SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: NetworkImage(
                //         "https://images.unsplash.com/photo-1651224074828-78818c4b74f9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2R1Y3QlMjBzYWxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                //     fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
            height: 190,
            width: MediaQuery.of(context).size.width * .9,
          ),
          SizedBox(height: 40),
          FeaturedProductsTitle(title: "New Arrival"),
          SizedBox(height: 20),
          ...List.generate(
              7,
              (index) => Container(
                  margin: const EdgeInsets.all(8),
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: List.generate(
                              5,
                              (index) => Icon(
                                  index == 4 ? Icons.star_half : Icons.star,
                                  size: 16,
                                  color: Colors.red)),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(.8)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset("assets/veg.png")),
                          SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 80,
                              width: 240,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Easy Heating Cup ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                    Text(
                                        "Easy Heating Cup Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus voluptatibus error sed itaque sit quasi voluptatem quidem, cumque explicabo maxime eum officiis eveniet quo aliquid eos nihil deserunt dicta, ipsa animi nostrum asperiores quaerat, laudantium provident. Id maxime quas velit eveniet et, dignissimos officia recusandae asperiores at, ipsam nisi, cupiditate ratione dolorem. Nesciunt quam voluptas quo nihil voluptates rem? Labore cumque sit impedit libero laudantium ducimus temporibus voluptates nemo, tempore perferendis perspiciatis iusto repellat minima cum totam quas facilis deleniti quia. Nam ab non quod ipsum placeat fuga beatae laborum dolore et, itaque veritatis reiciendis, dolores dolor porro. Maxime, nesciunt totam. Dolore aperiam aspernatur possimus ut, excepturi autem! Vero dolor maiores aspernatur in, deleniti natus cum asperiores ratione corporis officia quas totam quo odio! Labore omnis quo tenetur officia consequatur. Quo deserunt assumenda nostrum perspiciatis illum inventore, quaerat laborum, quisquam voluptates itaque ipsum molestiae quasi deleniti ipsa voluptatibus commodi? Exercitationem quaerat incidunt perferendis a ullam, rerum ducimus praesentium deleniti nulla, suscipit, totam aspernatur beatae quis illum dolores alias? Nobis delectus eos amet est impedit neque porro veniam? Modi voluptas voluptatibus magni est. Alias fugit hic porro consequuntur nostrum corporis asperiores, quasi cupiditate, doloribus non a. Dolores laboriosam autem optio atque consequatur sapiente eaque quod voluptatem earum facilis repellat, modi, sit cum veniam distinctio itaque reiciendis aliquam assumenda. Ad, exercitationem qui culpa deserunt quis modi iure excepturi repudiandae, veniam dicta doloremque illo magni, a quia error autem? Quis suscipit quidem unde in animi atque, illo illum hic quibusdam porro, blanditiis quisquam, nam enim accusantium quae at voluptate voluptates quo impedit? Dignissimos temporibus magnam dolorum tempore qui fugiat eos, ab corrupti, accusantium dolore consequuntur, aperiam nesciunt repellendus a eius. Officiis quo ipsa est, natus dicta quasi fugiat minima nemo debitis perferendis modi eaque, at sequi aperiam placeat nam in illo soluta? Facere eos repellat nam sequi. Quae vitae corporis consectetur veritatis aut inventore necessitatibus nihil molestiae ex porro temporibus suscipit atque, praesentium officia dicta sunt deleniti eligendi ipsam minima at non? Aperiam natus repellendus possimus obcaecati at provident quaerat vero autem ipsa, sit tempora animi repudiandae, cumque officiis quae incidunt. Iusto unde facilis nisi sint atque reiciendis reprehenderit, tempore temporibus facere neque dolor ut optio eligendi laborum libero laboriosam? Earum, optio id? Non dignissimos labore qui, totam officiis eos saepe accusantium, aliquam adipisci consectetur repellat, voluptatem deleniti! Veniam optio, mollitia dicta ullam laudantium modi neque molestiae, vitae suscipit quae et. Rem pariatur harum blanditiis esse similique fuga! Optio culpa eligendi accusantium maxime tempora consectetur esse soluta excepturi, odio laboriosam, explicabo suscipit quos illo ad exercitationem rem voluptas? Cum esse explicabo nobis mollitia. Vitae in magnam animi labore aliquid iusto, laboriosam dignissimos ex tenetur quas natus impedit voluptatibus sunt rem, commodi expedita odit laudantium illum dolore eum dolorum ipsa? Labore repellat itaque voluptates eveniet cupiditate quis qui reprehenderit dolorum, laborum reiciendis rem tenetur necessitatibus vel, recusandae aliquid libero architecto magnam! Nisi velit, atque hic qui, id quia nostrum odio nobis modi suscipit reiciendis cumque facere dolorem totam quas omnis necessitatibus quos non deleniti.",
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis),
                                  ]),
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                      Text("Rs 12000")
                    ],
                  ))),
          SizedBox(height: 20),
        ]),
      ),
    );
  }
}

class OurServices extends StatelessWidget {
  const OurServices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(50)),
                  child:
                      Icon(Icons.local_shipping_outlined, color: Colors.red)),
              SizedBox(height: 10),
              Text(
                "Free Shipping",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 6),
              Text("Free shipping on all \norders",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "💰",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Money Return Policy",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 6),
              Text("100% money back gurantee\nin default case",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.support_agent,
                    color: Colors.red,
                  )),
              SizedBox(height: 10),
              Text("Free Shipping",
                  style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 6),
              Text("Free shipping on all \norders",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}

class FeaturedProductsItems extends StatelessWidget {
  const FeaturedProductsItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        6,
        (index) => InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => DetailPage()));
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 230,
            width: 180,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            //   color: Colors.grey,
            // ),
            child: Stack(children: [
              Container(
                // margin: const EdgeInsets.all(8),
                height: 230,
                width: 200,
                decoration: BoxDecoration(
                    // color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: .1,
                        // offset: new Offset(5.0, 5.0),
                      ), // BoxShadow(color: Colors.grey.shade300, blurRadius: .2)
                    ]),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(height: 10),
                        Container(
                          height: 145,
                          width: 150,
                          child: Stack(children: [
                            Center(child: Image.asset("assets/veg.png")),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  margin: const EdgeInsets.all(8),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54, blurRadius: 1)
                                    ],
                                    color: Colors.grey[200],
                                  ),
                                  child: Icon(Icons.favorite_border,
                                      color: Colors.red)),
                            ),
                            Align(
                                alignment: Alignment.topRight,
                                child: Column(
                                  children: [
                                    Container(
                                        margin: const EdgeInsets.all(8),
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black54,
                                                blurRadius: 1)
                                          ],
                                          color: Colors.grey[200],
                                        ),
                                        child: Icon(Icons.phone,
                                            color: Colors.red)),
                                    Container(
                                        margin: const EdgeInsets.all(8),
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black54,
                                                blurRadius: 1)
                                          ],
                                          color: Colors.grey[200],
                                        ),
                                        child: Icon(Icons.restart_alt_sharp,
                                            color: Colors.red)),
                                  ],
                                ))
                          ]),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          // width: 120,
                          child: Text(
                            "Two Piece Knee Brace",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                            // width: 120,
                            child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Jeam ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontSize: 12),
                              ),
                              TextSpan(
                                text: "RS 2500",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          // textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ))
                      ]),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class FeaturedProductsTitle extends StatelessWidget {
  final String title;
  const FeaturedProductsTitle({Key? key, this.title = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Text(title == "" ? "Featured Products" : title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.grey.shade700,
                  )),
          Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            child: Text("See All",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey.shade200,
                    )),
          )
        ],
      ),
    );
  }
}

class FlashSaleItem extends StatelessWidget {
  const FlashSaleItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // color: Colors.grey,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (_, i) => InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => DetailPage()));
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  width: 160,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 1)
                      ]),
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.red),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text("50% off",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                            )),
                        Center(
                          child: Container(
                              height: 100,
                              width: 120,
                              child:
                                  Stack(alignment: Alignment.center, children: [
                                Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          Colors.red.shade400.withOpacity(.5)),
                                ),
                                Image.asset('assets/veg.png'),
                              ])),
                        ),
                        Text("Rs 1200",
                            style: Theme.of(context).textTheme.bodyLarge),
                        Expanded(
                          child: Text(
                            "Hair Care set curl iron.",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )
                      ]),
                ),
              )),
    );
  }
}

class FlashSaleRow extends StatelessWidget {
  const FlashSaleRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("Flash Sale",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.grey.shade700,
                  )),
          Spacer(),
          Text(
            "Closing In: ",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.grey[600]),
          ),
          Container(
            padding: const EdgeInsets.all(3),
            color: Colors.red,
            child: Text(
              "02",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.all(3),
            color: Colors.red,
            child: Text(
              "12",
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.all(3),
            color: Colors.red,
            child: Text(
              "56",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      // color: Colors.grey,
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 12),
          scrollDirection: Axis.horizontal,
          itemCount: menus.length,
          itemBuilder: (_, i) => Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.circular(45)),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  menus[i],
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.red),
                ),
              )),
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // color: Colors.grey,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                // image: DecorationImage(
                //     image: NetworkImage(
                //         "https://images.unsplash.com/photo-1651224074828-78818c4b74f9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2R1Y3QlMjBzYWxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                //     fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
            height: 190,
            width: MediaQuery.of(context).size.width * .9,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
            height: 190,
            width: MediaQuery.of(context).size.width * .9,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)]),
            height: 190,
            width: MediaQuery.of(context).size.width * .9,
          ),
        ],
      ),
    );
  }
}

class AppHeader extends StatelessWidget {
  const AppHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // color: Colors.grey,
      child: Stack(
        children: [
          Container(
            height: 180,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
            ),
            child: Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  // color: Colors.white,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 6,
                          child: Text(
                            '2',
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Text(
                  "MAAHURI",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                ),
                Spacer(),
                Icon(
                  Icons.grid_view,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 36, right: 36),
              // color: Colors.white,
              height: 50,
              width: MediaQuery.of(context).size.width,

              child: Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2)],
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Text('Search Product'),
                    Spacer(),
                    Icon(Icons.search)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

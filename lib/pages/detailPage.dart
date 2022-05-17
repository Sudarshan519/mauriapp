import 'package:flutter/material.dart';
import 'package:mauriapp/notification.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: 400,
              child: Stack(children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                        Colors.red.shade200,
                        Colors.red.shade100,
                        // Colors.red.withOpacity(.01),
                        Colors.white
                      ])),
                ),
                SafeArea(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.only(left: 10, top: 10),
                        color: Colors.white,
                        child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.arrow_back_ios, size: 18))),
                  ),
                ),
                SafeArea(
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0, top: 10),
                        child: Column(children: [
                          Text(
                            "Knee Brace",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            "View Brand",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ]),
                      )),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      height: 30,
                      width: 30,
                      margin: const EdgeInsets.only(bottom: 10, right: 10),
                      decoration:
                          BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(color: Colors.grey, blurRadius: 1),
                      ]),
                      child: Icon(Icons.favorite, color: Colors.red)),
                ),
                Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 230,
                      width: 230,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        color: Colors.grey.withOpacity(.5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              3,
                              (index) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 3),
                                    height: 10,
                                    width: index == 0 ? 20 : 10,
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ))),
                    )
                  ],
                ))
              ])),

          //Detail
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Gym Knee Brace",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      "Nepalipasal",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                          5,
                          (index) => Icon(
                              index == 4 ? Icons.star_half : Icons.star,
                              size: 16,
                              color: Colors.red)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Spacer(),
                InkWell(
                    onTap: () async {
                      await NotifyHelper().initializeNotification();
                      NotifyHelper().displayNotification(
                          title: "MauriApp",
                          body:
                              "Thank you for contacting us, We will get back to you soon");
                    },
                    child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(6)),
                        child: Text("Message Seller")))
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Text("Description",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white))),
              Spacer(),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text("Specification")),
              Spacer(),
              Text("Reviews"),
              Spacer(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
                "Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellendus voluptatibus error sed itaque sit quasi voluptatem quidem, cumque explicabo maxime eum officiis eveniet quo aliquid eos nihil deserunt dicta, ipsa animi nostrum asperiores quaerat, laudantium provident. Id maxime quas velit eveniet et, dignissimos officia recusandae asperiores at, ipsam nisi, cupiditate ratione dolorem. Nesciunt quam voluptas quo nihil voluptates rem? Labore cumque sit impedit libero laudantium ducimus temporibus voluptates nemo, tempore perferendis perspiciatis iusto repellat minima cum totam quas facilis deleniti quia. Nam ab non quod ipsum placeat fuga beatae laborum dolore et, itaque veritatis reiciendis, dolores dolor porro. Maxime, nesciunt totam. Dolore aperiam aspernatur possimus ut, excepturi autem! Vero dolor maiores aspernatur in, deleniti natus cum asperiores ratione corporis officia quas totam quo odio! Labore omnis quo tenetur officia consequatur. Quo deserunt assumenda nostrum perspiciatis illum inventore, quaerat laborum, quisquam voluptates itaque ipsum molestiae quasi deleniti ipsa voluptatibus commodi? Exercitationem quaerat incidunt perferendis a ullam, rerum ducimus praesentium deleniti nulla, suscipit, totam aspernatur beatae quis illum dolores alias? Nobis delectus eos amet est impedit neque porro veniam? Modi voluptas voluptatibus magni est. Alias fugit hic porro consequuntur nostrum corporis asperiores, quasi cupiditate, doloribus non a. Dolores laboriosam autem optio atque consequatur sapiente eaque quod voluptatem earum facilis repellat, modi, sit cum veniam distinctio itaque reiciendis aliquam assumenda. Ad, exercitationem qui culpa deserunt quis modi iure excepturi repudiandae, veniam dicta doloremque illo magni, a quia error autem? Quis suscipit quidem unde in animi atque, illo illum hic quibusdam porro, blanditiis quisquam, nam enim accusantium quae at voluptate voluptates quo impedit? Dignissimos temporibus magnam dolorum tempore qui fugiat eos, ab corrupti, accusantium dolore consequuntur, aperiam nesciunt repellendus a eius. Officiis quo ipsa est, natus dicta quasi fugiat minima nemo debitis perferendis modi eaque, at sequi aperiam placeat nam in illo soluta? Facere eos repellat nam sequi. Quae vitae corporis consectetur veritatis aut inventore necessitatibus nihil molestiae ex porro temporibus suscipit atque, praesentium officia dicta sunt deleniti eligendi ipsam minima at non? Aperiam natus repellendus possimus obcaecati at provident quaerat vero autem ipsa, sit tempora animi repudiandae, cumque officiis quae incidunt. Iusto unde facilis nisi sint atque reiciendis reprehenderit, tempore temporibus facere neque dolor ut optio eligendi laborum libero laboriosam? Earum, optio id? Non dignissimos labore qui, totam officiis eos saepe accusantium, aliquam adipisci consectetur repellat, voluptatem deleniti! Veniam optio, mollitia dicta ullam laudantium modi neque molestiae, vitae suscipit quae et. Rem pariatur harum blanditiis esse similique fuga! Optio culpa eligendi accusantium maxime tempora consectetur esse soluta excepturi, odio laboriosam, explicabo suscipit quos illo ad exercitationem rem voluptas? Cum esse explicabo nobis mollitia. Vitae in magnam animi labore aliquid iusto, laboriosam dignissimos ex tenetur quas natus impedit voluptatibus sunt rem, commodi expedita odit laudantium illum dolore eum dolorum ipsa? Labore repellat itaque voluptates eveniet cupiditate quis qui reprehenderit dolorum, laborum reiciendis rem tenetur necessitatibus vel, recusandae aliquid libero architecto magnam! Nisi velit, atque hic qui, id quia nostrum odio nobis modi suscipit reiciendis cumque facere dolorem totam quas omnis necessitatibus quos non deleniti.",
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.grey[700])),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Text("24 inch",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white))),
                SizedBox(
                  width: 20,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: Text("24 inch")),
                SizedBox(
                  width: 20,
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: Text("24 inch")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text(
                  "Rs 249",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(width: 20),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: Text("-")),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: Text(
                      "3",
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: Text('+')),
                SizedBox(width: 20),
                Text(
                  "0 Available",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.grey[700]),
                )
              ],
            ),
          )
        ]),
      ),
      bottomNavigationBar: Row(children: [
        Expanded(
            child: CustomButton(
          icon: Icons.shopping_bag,
          label: "Add To Cart",
        )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: CustomButton(
          icon: Icons.shopping_cart,
          label: "Buy Now",
        ))
      ]),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.label, required this.icon})
      : super(key: key);
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(10),
      height: 60,
      child: Row(children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4)),
          child: Icon(
            icon,
            color: Colors.red,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(label,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
      ]),
    );
  }
}

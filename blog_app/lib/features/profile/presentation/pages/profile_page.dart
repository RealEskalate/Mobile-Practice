import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(15, 15, 10, 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Text(
                    "Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 358,
                    width: 401,
                    padding: const EdgeInsets.only(
                        top: 35.0, left: 58.5, right: 28.5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                const SizedBox(
                                  width: 117,
                                  height: 110,
                                ),
                                Container(
                                  width: 114,
                                  height: 106,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(28)),
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color.fromRGBO(55, 106, 237, 1),
                                        Color.fromRGBO(73, 176, 226, 1),
                                        Color.fromRGBO(156, 236, 251, 1),
                                      ],
                                    ),
                                  ),
                                  child: Container(
                                    width: 110,
                                    height: 102,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(28)),
                                      color: Colors.white,
                                    ),
                                    alignment: Alignment.center,
                                    child: Container(
                                      width: 90,
                                      height: 84,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(28)),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "image/profile.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    // alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(67, 154, 229, 1),
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                        iconSize: 17,
                                        alignment: Alignment.center,
                                        color: Colors.white,
                                        onPressed: () {},
                                        icon: Icon(Icons.edit)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'John Doe',
                                  style: TextStyle(
                                    color: Color.fromRGBO(13, 37, 60, 1),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'UX Designer',
                                  style: TextStyle(
                                    color: Color.fromRGBO(55, 106, 237, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "About me",
                                  style: TextStyle(
                                    color: Color.fromRGBO(13, 37, 60, 1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "About me I’m a a software engineer and UX Designer at Eskalate with a passion working with a team",
                              style: TextStyle(
                                  color: Color.fromRGBO(45, 67, 121, 1),
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                  height: 1.5,
                                  overflow: TextOverflow.clip),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ];
      },
      body: Container(
        width: 401,
        padding: const EdgeInsets.fromLTRB(15, 15, 10, 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 30.0, 10.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Posts",
                        style: TextStyle(
                          color: Color.fromRGBO(13, 37, 60, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.apps),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.list)
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //TODO: The list of cards
                Expanded(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: ListView.separated(
                      itemCount: 10,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 10),
                      itemBuilder: (BuildContext cnt, int index) {
                        return Container(
                          width: 358,
                          height: 157,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(82, 130, 255, 0.06),
                                offset: Offset(0, 5),
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16),
                            ),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              //todo: the image
                              Container(
                                width: 112,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage("image/profile.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5,),
                              //todo: the texts using a column
                              Container(
                                width: 170,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "BIG DATA".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w900,
                                        color: Color.fromRGBO(55, 106, 237, 1),
                                      ),
                                    ),
                                    Text(
                                      "Why Big Data Needs Thick Data?",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromRGBO(13, 37, 60, 1),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.alarm_rounded,
                                              size: 17,
                                            ),
                                            SizedBox(width: 8.5),
                                            Text("1hr ago"),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Icon(
                                          Icons.bookmark,
                                          color:
                                              Color.fromRGBO(55, 106, 237, 1),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              //TODO: the three dot icon to the top
                              Container(
                                alignment: Alignment.topLeft,
                                width: 20,
                                child: PopupMenuButton(
                                  color: Colors.white,
                                  elevation: 20,
                                  shape: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2)),
                                  itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Row(
                                        children: [
                                          Icon(Icons.edit_calendar_rounded),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "Edit",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                      value: 1,
                                    ),
                                    PopupMenuItem(
                                      child: Row(
                                        children: [
                                          Icon(Icons.delete),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "Delete",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      value: 2,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
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

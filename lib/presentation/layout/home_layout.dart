import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magedsoft/business_logic/global_cubit/global_cubit.dart';
import 'package:magedsoft/presentation/screens/login.dart';
import 'package:magedsoft/presentation/screens/shared/component.dart';
import 'package:magedsoft/presentation/screens/user/help.dart';
import 'package:magedsoft/presentation/screens/user/product_details.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  BlocProvider(
      create: (BuildContext context)=>GlobalCubit()..getProduct(),
      child: BlocConsumer<GlobalCubit,GlobalState>(
        listener: (context,state){
          if (state is HelpPageState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpPage()));
          }
          if(state is LogoutState){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
          }
        },
        builder: (context,state){
          var cubit = GlobalCubit.get(context);
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0062BD).withOpacity(0.85), Colors.white],
                  // Set your desired gradient colors
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width *
                                0.0465116279069767),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 3), // changes the position of the shadow
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                      decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Color(0xffB1B1B1),)),
                                        labelText: 'Search',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.transparent),
                                          borderRadius: BorderRadius.circular(20.0),
                                        ),
                                      )),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.0372093023255814,
                            ),
                            Container(
                                height: MediaQuery.of(context).size.height *
                                    0.0803524672708963,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes the position of the shadow
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.filter_alt_rounded,color: Color(0xffB1B1B1),)))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.0221550855991944,
                      ),
                      Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.asset(
                                  'assets/images/Acer-Predator-Helios-300-2021 1.png')),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.027906976744186,
                                vertical: height * 0.0090634441087613),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'New Release',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text('Acer Predator Helios 300',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          )
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              chooseCategory(
                                width: width,text: 'All',path: 'assets/images/vector-trophy-cup-icon 2.png',selected: true
                              ),
                              SizedBox(
                                width: width * 0.0581395348837209,
                              ),
                              chooseCategory(
                                  width: width, path: ('assets/images/acer.png'), text: 'Acer'),
                              SizedBox(
                                width: width * 0.0581395348837209,
                              ),
                              chooseCategory(
                                  width: width, path: ('assets/images/Razer-Logo 2.png'), text: 'Razer'),
                              SizedBox(
                                width: width * 0.0581395348837209,
                              ),
                              chooseCategory(
                                  width: width, path: ('assets/images/ios 1.png'), text: 'Apple'),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Recommended',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                      GridView.builder(
                        padding: EdgeInsets.only(bottom: 50),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.1,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Transform.translate(
                            offset: Offset(0.0, index.isEven ? 50 : 0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsPage(company: cubit.product[index]['company'],
                                    networkImage: cubit.product[index]['image'],
                                    price: cubit.product[index]['price'],
                                    text: cubit.product[index]['description'],
                                    type: cubit.product[index]['name'],
                                    name: cubit.product[index]['type'],
                                  )));
                                },
                                child: Container(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 3), // changes the position of the shadow
                                      ),
                                    ],
                                  ),
                                  height: height * 0.2406847935548842,
                                  width: width * 0.3906976744186047,
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Image(
                                                height:height*0.1591137965760322,
                                                width:width*0.3674418604651163,
                                                image: NetworkImage('${GlobalCubit.get(context).product[index]['image']}'),fit: BoxFit.fill,),
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.symmetric(horizontal: width*0.0209302325581395),
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('${GlobalCubit.get(context).product[index]['company']}',style: TextStyle(color: Color(0xff0062BD),fontSize: width*0.0418604651162791),),
                                                    Text('${GlobalCubit.get(context).product[index]['name']}',style: TextStyle(fontSize: width*0.027906976744186),),
                                                    Text('${GlobalCubit.get(context).product[index]['price']}',style: TextStyle(fontSize: width*0.0232558139534884),),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: height*0.040281973816717,
                                        height: height*0.040281973816717,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                                          gradient: LinearGradient(
                                            colors: [Color(0xFF0062BD).withOpacity(1), Color(0xFF0062BD).withOpacity(0.5)],
                                            // Set your desired gradient colors
                                            begin: Alignment.topLeft,
                                            
                                          ),
                                        ),
                                        child: Padding(
                                          padding:  EdgeInsets.only(right:width*0.0325581395348837 ),
                                          child: IconButton(onPressed: (){}, icon: Icon(Icons.add,size: width*0.0325581395348837,color: Colors.white,)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: GlobalCubit.get(context).product.length,
                      )
                    ],
                  ),
                ),
              ),
            ),
            extendBody: true,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.home),
              backgroundColor: Color(0xff0062BD),
            ),
            bottomNavigationBar: BottomAppBar(
              clipBehavior: Clip.antiAlias,
              shape: CircularNotchedRectangle(),
              notchMargin: 12,
              color: Colors.white,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0.5),
                    )),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: GlobalCubit.get(context).currentIndex,
                  onTap: (index){
                    GlobalCubit.get(context).changeIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(icon: Icon(Icons.login), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.heart_fill), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(CupertinoIcons.heart_fill), label: ''),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.notification_add), label: ''),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: '',
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

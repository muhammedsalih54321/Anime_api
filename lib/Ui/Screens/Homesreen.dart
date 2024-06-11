import 'package:anime_api/Bloc/Anime/anime_bloc.dart';
import 'package:anime_api/Repository/Model/Anime_model.dart';
import 'package:anime_api/Ui/Screens/Detailscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Homesreen extends StatefulWidget {
  const Homesreen({super.key});

  @override
  State<Homesreen> createState() => _HomesreenState();
}

class _HomesreenState extends State<Homesreen> {
  late AnimeModel anime;
  @override
  void initState() {
    BlocProvider.of<AnimeBloc>(context).add(FetchanimeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  AppBar(
                    centerTitle: true,
                    leading: Icon(
                      Icons.more_vert,
                      color: Colors.black,
                      size: 25.sp,
                    ),
                    title: Text('Anime App',
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w900)),
                    actions: [
                      Stack(
                        children: [
                          Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.black,
                            size: 30.sp,
                          ),
                          Positioned(
                            top: 5.h,
                            left: 17.w,
                            child: CircleAvatar(
                                radius: 4.r, backgroundColor: Colors.red),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Now Showing',
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900)),
                      Container(
                        height: 20.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text('See more',
                              style: GoogleFonts.mulish(
                                  color: Colors.grey,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocBuilder<AnimeBloc, AnimeState>(
                    builder: (context, state) {
                      if (state is Animeblocloading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is Animeblocerror) {
                        return RefreshIndicator(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * .9,
                              child: const Center(
                                  child: Text('Oops something went wrong')),
                            ),
                          ),
                          onRefresh: () async {
                            return BlocProvider.of<AnimeBloc>(context)
                                .add(FetchanimeEvent());
                          },
                        );
                      }
                      if (state is Animeblocloaded) {
                        anime = BlocProvider.of<AnimeBloc>(context).animeModel;
                        return Expanded(
                            child: ListView.builder(
                          itemCount: anime.data!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                height: 300.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Color.fromARGB(29, 247, 3, 149)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.push(context,MaterialPageRoute(builder: (_)=>Detailscreen(model: anime, index: index,))),
                                      child: Container(
                                        height: 210.h,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              anime.data![index].image.toString(),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    Center(
                                      child: Text(
                                          anime.data![index].title.toString(),
                                          style: GoogleFonts.robotoCondensed(
                                              color: Colors.black,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w900)),
                                    ),
                                    Text('Episode:- ${anime.data![index].episodes.toString()}',
                                                              style: GoogleFonts.robotoCondensed(
                                                                  color: Colors.black,
                                                                  fontSize: 15.sp,
                                                                  fontWeight: FontWeight.w900)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ));
                      } else {
                        return SizedBox();
                      }
                    },
                  )
                ]))));
  }
}

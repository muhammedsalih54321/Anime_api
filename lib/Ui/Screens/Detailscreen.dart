import 'package:anime_api/Repository/Model/Anime_model.dart';
import 'package:anime_api/Ui/Screens/Reviewpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Detailscreen extends StatefulWidget {
  final AnimeModel model;
  final int index;
  const Detailscreen({super.key, required this.model, required this.index});

  @override
  State<Detailscreen> createState() => _DetailscreenState();
}

class _DetailscreenState extends State<Detailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView
      (
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    height: 280.h,
                    width: double.infinity,
                    child: Image.network(
                      widget.model.data![widget.index].image.toString(),
                      fit: BoxFit.cover,
                    )),
                AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25.sp,
                      )),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        Icons.more_horiz_outlined,
                        color: Colors.white,
                        size: 25.sp,
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
            
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 60.h,
                            width: 300.w,
                            child: Text(
                                widget.model.data![widget.index].title.toString(),
                                style: GoogleFonts.robotoCondensed(
                                    color: Colors.black,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700)),
                          ),
                          Icon(
                            Icons.bookmark_border_outlined,
                            color: Colors.black,
                            size: 25.sp,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                     Row(
                        children: [
                          Text('Episode :- ',
                              style: GoogleFonts.robotoCondensed(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w900)),
                          Text(
                              widget.model.data![widget.index].episodes.toString(),
                              style: GoogleFonts.mulish(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                        height: 20.h,
                        width: 300.w,
                        child: ListView.builder(
                          itemCount: widget.model.data![widget.index].genres!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3),
                              child: Container(
                                height: 20.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: Color.fromARGB(68, 39, 89, 176)),
                                child: Center(
                                  child: SizedBox(
                                    child: Text(
                                        widget.model.data![widget.index].genres![index].toString()
                                           ,
                                        style: GoogleFonts.robotoCondensed(
                                            color: Colors.blueAccent,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w700)),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text('Length',
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.grey,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text('2h 28min',
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          Column(
                            children: [
                              Text('Language',
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.grey,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text('English',
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                          SizedBox(
                            width: 50.w,
                          ),
                          Column(
                            children: [
                              Text('Rating',
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.grey,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: 3.h,
                              ),
                              Text('PG-13',
                                  style: GoogleFonts.robotoCondensed(
                                      color: Colors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text('Description',
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w900)),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(widget.model.data![widget.index].synopsis.toString(),
                          style: GoogleFonts.robotoCondensed(
                              color: Colors.grey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              height: 2)),
                      SizedBox(
                        height: 10.h,
                      ),
                      TextButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (_)=>Webscreen(videoUrl:widget.model.data![widget.index].link.toString() ,)));}, child:Text('See Review',
                          style: GoogleFonts.robotoCondensed(
                            decoration: TextDecoration.underline,
                              color: Colors.blue,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400,
                              height: 2)), ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

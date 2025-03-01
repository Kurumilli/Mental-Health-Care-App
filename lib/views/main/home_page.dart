import 'package:flutter_application_1/controllers/home_controller.dart';
import 'package:flutter_application_1/services/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

import '../../services/custom_colors.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  Future<String> getTrendingVideoUrl() async {
    const String apiKey = "AIzaSyC76j4UtKqhPu8SWpH9EG3dckNMM8QwvII";  // Replace with your actual API key
    const String apiUrl =
        "https://www.googleapis.com/youtube/v3/videos?part=snippet&chart=mostPopular&regionCode=US&maxResults=1&key=$apiKey";

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final videoId = data["items"][0]["id"];
      return "https://www.youtube.com/watch?v=$videoId";
    } else {
      throw Exception("Failed to fetch trending video");
    }
  }

  @override
  Widget build(BuildContext context) {
    var firstname = FirebaseAuth.instance.currentUser?.displayName == null
        ? 'buddy'
        : FirebaseAuth.instance.currentUser?.displayName?.split(" ")[0];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            toolbarHeight: SizeConfig.safeVertical! * 0.15,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/memphis.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.safeHorizontal! * 0.05,
                    top: SizeConfig.safeVertical! * 0.1,
                  ),
                  child: Text(
                    'Hello, ${firstname![0].toUpperCase() + firstname.substring(1)}!',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.black,
                          fontFamily: 'JekoBold',
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.safeVertical! * 0.02),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.safeHorizontal! * 0.05),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Browse Sessions",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: CustomColors.appLightGrey,
                            fontFamily: 'JekoBold',
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.safeVertical! * 0.02),
                FutureBuilder<String>(
                  future: getTrendingVideoUrl(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text("Error loading video");
                    } else {
                      return InkWell(
                        onTap: () async {
                          await launchUrl(Uri.parse(snapshot.data!));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: SizeConfig.safeVertical! * 0.2,
                          decoration: BoxDecoration(
                            color: CustomColors.appSecondaryGrey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text("Tap to watch trending video",
                                style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: SizeConfig.safeVertical! * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

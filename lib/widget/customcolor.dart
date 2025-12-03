import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


class Customcolor {
 static Style tableboderstyle(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double leftPadding = screenWidth > 600 ? 8 : 4;
    double topBottomPadding = screenWidth > 600 ? 12 : 8;

    return Style(
      padding: HtmlPaddings.only(left: leftPadding, top: topBottomPadding, bottom: topBottomPadding, right: 0),
      border: Border.all(color: Customcolor.tablebordercolor, width: 0.5),
    );
  }

  static const tablebordercolor = const Color(0xff000000);
  static const textsubtitlecolor = const Color(0xFF4b4e53);
  static const colorPrimary = const Color(0xffFFBD00);
  static const colorPrimaryDark = const Color(0xff89cff0);
  static const yellow_transparent = const Color(0x10FFFFFF);
  static const colorAccent = const Color(0xff532E92);
  static const colorPink = const Color(0xffE43799);
  static const colorblack = const Color(0xff000000);

  static const colorBlue = const Color(0xff2467B6);
  static const colorSkyBlue = const Color(0xff32BCC5);
  static const colorGreen = const Color(0xff359B5C);
  static const colorLightBlue = const Color(0xff9ED5D2);
  static const colorVoilet = const Color(0xff532E92);
  static const transparent_white = const Color(0x80FFFFFF);

  static const fb_blue = const Color(0xff3b5998);
  static const media_color = const Color(0xffA0D4D2);
  static const twitter_blue = const Color(0xff1DA1F2);
  static const youtube_red = const Color(0xffbb0000);

  static const colorLightGreen = const Color(0xffAACE2E);
  static const colorGrey = const Color(0xff7AA2BC);
  static const colorBrown = const Color(0xffD69345);
  static const colorAfricanVoilet = const Color(0xffb284be);
  static const gallery_blue = const Color(0xff072ECC);
  static const covid_19_tile = const Color(0xff503291);
  static const baby_blue = const Color(0xff89cff0);
  static const background = const Color(0xffEBF9FF);

  //home page list color code
  static const pink_col = const Color(0xffEF3997);
  static const green_col = const Color(0xff299B5D);
  static const ligthpink = const Color(0xffFFA4D3);

  static const violet_col = const Color(0xff532F8F);
  static const darkblue_col = const Color(0xff2D3091);
  static const lightblue_col = const Color(0xff2368B3);
  static const lightgreen_col = const Color(0xffA6CC38);
  static const orange_col = const Color(0xffD79541);
  static const programyellow = const Color(0xffFFE891);
  static const skyblue_col = const Color(0xff9CD4D1);

  //new colo®
  static const text_blue = const Color(0xff125CAB);
  static const text_grey = const Color(0xff888888);
  static const text_darkblue = const Color(0xff115CAB);
  static const text_darkgrey = const Color(0xff333333);
  static const descriptiontext = const Color(0xff4B4E5E);
  static const pinkbg = const Color(0xffFFA4D3);
  static const cardbg = const Color(0xffCEF5FF);
  static const stemskyblue = const Color(0xffA9E2FC);

  static const purple = const Color(0xffb284be);

  //program
  static const prog1 = const Color(0xff0e69af);
  static const prog2 = const Color(0xffa4cf49);
  static const prog3 = const Color(0xffb184bd);
  static const prog4 = const Color(0xffeb3d96);
  static const prog5 = const Color(0xff503390);
  static const prog6 = const Color(0xff985ba9);
  static const prog7 = const Color(0xff80a62f);

  static const prog8 = const Color(0xff149b60);
}

class AppFonts {
  static String normal = "Verdana";
  static String normalnew = "Verdana";
}

class Constantstring {
//link to be shared on app directly
//merck foundation on
  static String homeheader = "";
  static String homeheaderlink = "";
  static String baseurllink = "https://merck-foundation.com/";
  static String followinsta = "https://www.instagram.com/merckfoundation";
  static String followfacebook = "https://www.facebook.com/merckfoundation/";
  static String followtwitter = "https://twitter.com/MerckFoundation/";
  static String followyoutube =
      "https://www.youtube.com/channel/UCwU6L6rvR-6q0-5Jw03wscg";
  //static String followflicker = "https://www.flickr.com/photos/163124125@N08/";
  static String followflicker =
      "https://www.flickr.com/photos/merckfoundation/";

  static String followrashaflicker =
      "https://www.flickr.com/photos/rashakelej/";

  static String threadsUrlScheme = 'threads://';
  // URL to Threads app in the Play Store
  static String followthreas = 'https://www.threads.net/@merckfoundation';
//Follow Rasha
  static String followrashainsta = "https://www.instagram.com/rasha_kelej/";
  static String followrashafacebook =
      "https://www.facebook.com/KelejRasha/";
  static String followrashatwitter = "https://twitter.com/Rashakelej";
  static String followerashayoutube =
      "https://www.youtube.com/channel/UCO_bN_T_NodcOYwcPjknaog";
  static String followthreasrasha = 'https://www.threads.net/@rasha_kelej';

  //share who we are
  static String sharevision = "${baseurllink}who-we-are/Vision";
  static String shareleadership = "${baseurllink}who-we-are/Leadership-Team";

  static String sharemessagefromleadership =
      "${baseurllink}who-we-are/Leadership-Team-Message";

  //share what we do
  static String sharemission = "${baseurllink}what-we-do/Mission";

  static String shareourpolicy = "${baseurllink}what-we-do/Our-Policies";

  static String shareouractivity = "${baseurllink}what-we-do/Our-Activities";
  static String sharelegaldisclaimer =
      "${baseurllink}what-we-do/Legal-Disclaimer";
  static String sharedataprivacy = "${baseurllink}what-we-do/Privacy-Statement";

  static String shareouractivitydetail = "${baseurllink}news-articles/";

  //share ourpartner
  static String shareourpartner = "${baseurllink}our-partners";

  //share Media&events
  static String sharevideolibrary = "${baseurllink}videos";
  static String sharestories = "${baseurllink}Stories";
  static String sharetestimonial =
      "${baseurllink}Merck-Foundation-Alumni-Testimonials";

  static String sharenewsletter = "${baseurllink}News-Articles";

  static String sharecallforapp =
      "${baseurllink}Upcoming-Programs-&-Call-For-Applications";
  static String sharenewsrelease = "${baseurllink}News-Releases";
  static String sharemerckmedia = "${baseurllink}media";

  //subprogram link
  //mmtm
  static String aboutmmtm =
      "${baseurllink}our-programs/Merck-Foundation-More-Than-a-Mother/About-Program";
  static String strategy =
      "${baseurllink}our-programs/Merck-Foundation-More-Than-a-Mother/Strategy";
  static String merckambassadar =
      "${baseurllink}our-programs/Merck-Foundation-More-Than-a-Mother/Merck-Foundation-More-Than-a-Mother-Ambassadors";
  static String fertility =
      "${baseurllink}our-programs/Merck-Foundation-More-Than-a-Mother/Merck-Foundation-Fertility-and-Embryology-Training-Program";
  static String communityawarnessmmtm =
      "${baseurllink}our-programs/Merck-Foundation-More-Than-a-Mother/Community-Awareness-and-Awards-Program";
  static String empoweringberna =
      "${baseurllink}our-programs/Merck-Foundation-More-Than-a-Mother/Empowering-Bernaa";
  static String localsong =
      "${baseurllink}our-programs/Merck-Foundation-More-Than-a-Mother/Local-Songs-and-Children-Stories";
  static String videommtm =
      "${baseurllink}watch_all_videos/merck-foundation-more-than-a-mother";

  //cancer
  static String cancerobjective =
      "${baseurllink}our-programs/Merck-Foundation-Cancer-Access-Program/Objectives";
  static String cancerfellowship =
      "${baseurllink}our-programs/Merck-Foundation-Cancer-Access-Program/Merck-Oncology-Fellowship-Program";
  static String cancerpatient =
      "${baseurllink}our-programs/Merck-Foundation-Cancer-Access-Program/Merck-More-Than-a-Patient";
  static String cancercommunityawareness =
      "${baseurllink}our-programs/Merck-Foundation-Cancer-Access-Program/Merck-Community-Awareness";
  static String cancervideo =
      "${baseurllink}watch_all_videos/merck-foundation-cancer-access-program";
  static String cancersocial =
      "${baseurllink}our-programs/Merck-Foundation-Cancer-Access-Program/Social-Media";
  //award

  //award detail pages
  static String shareawarddetailpage = "${baseurllink}awards/";

  //testimonial viewmore page
  static String sharetestimonialviewmorehome = "${baseurllink}Testimonials";
  static String sharetestimonialviewmorecapacity =
      "${baseurllink}our-programs/Merck-Foundation-Capacity-Advancement-Nationwide-Diabetes-Blue-Points-Program/Alumni_Testimonies";
  static String sharetestimonialviewmoremmtm =
      "${baseurllink}our-programs/Merck-Foundation-More-Than-a-Mother/Alumni_Testimonies";
  static String sharetestimonialviewmorecancer =
      "${baseurllink}our-programs/Merck-Foundation-Cancer-Access-Program/Alumni_Testimonies";
  static String sharetestimonialviewmorecancerfellowship =
      "${baseurllink}our-programs/Merck-Foundation-Oncology-Fellowship-Program/Alumni_Testimonies";

  //testimonial detail page
  static String sharetestimonialdetailpage =
      "${baseurllink}Merck_Testimonials/";

  //leadership detail
  static String shareceodetailpage = "${baseurllink}get_details/";
  static String shareceohomeeodetailpage = "${baseurllink}CEO-Message/";
  static String shareceoviewmore = "${baseurllink}CEO-Message";
  static String sharearticledetailpage = "${baseurllink}News-Articles/";

  static String photogalleryviewall = "${baseurllink}Photo-Gallery";
  static String photogalleryyearwise = "${baseurllink}Photo-Gallery/";

  //digital share
  static String sharedigitalhome = "${baseurllink}Digital-Library";

  static String sharedigitalmmtm =
      "${baseurllink}our-programs/Merck-Foundation-More-Than-a-Mother/Digital-Library";
  static String sharedigitalcancer =
      "${baseurllink}our-programs/Merck-Foundation-Cancer-Access-Program/Digital-Library";
  static String sharedigitalcapacity =
      "${baseurllink}our-programs/Merck-Foundation-Capacity-Advancement-Nationwide-Diabetes-Blue-Points-Program/Digital-Library";

  static String sharedigitalfirst =
      "${baseurllink}our-programs/Merck-Foundation-First-Ladies-Initiative-Summit-MFFLI/Digital-Library";

  static String sharedigitalstem =
      "${baseurllink}our-programs/Merck-Foundation-STEM-Program/Digital-Library";
  static String sharedigitalsubstain =
      "h${baseurllink}our-programs/Merck-Foundation-Sustainability-Initiative/Digital-Library";
  static String sharedigitalafrica =
      "${baseurllink}our-programs/Merck-Foundation-Africa-Asia-Luminary/Digital-Library";
  static String sharedigitaleducating =
      "${baseurllink}our-programs/Merck-Foundation-Educating-Linda-Program/Digital-Library";

  //share call for app

  static String sharecallforapphome =
      "${baseurllink}Upcoming-Programs-&-Call-For-Applications";
  static String sharecallforappmmtm =
      "${baseurllink}our-programs/Merck-Foundation-More-Than-a-Mother/Call-for-Applications";
  static String sharecallforappstem =
      "${baseurllink}our-programs/Merck-Foundation-STEM-Program/Call-for-Applications";
  static String sharecallforappafrica =
      "${baseurllink}our-programs/Merck-Foundation-Africa-Asia-Luminary/Call-for-Applications";

  //share mmtmambassadar
  static String sharemmtmambassadarhome =
      "${baseurllink}Merck-More-Than-a-Mother-Ambassadors/Home";
  static String sharemmtmambassadarmmtm =
      "${baseurllink}Merck-More-Than-a-Mother-Ambassadors/merck-foundation-more-than-a-mother";
  static String sharemmtmambassadarfirstlady =
      "${baseurllink}Merck-More-Than-a-Mother-Ambassadors/merck-foundation-first-ladies-initiative-summit";

  //share watch all videos
  static String sharewatchallvideocovid = "${baseurllink}COVID19-Videos";
  static String sharewatchallvideoaboutmmtm =
      "${baseurllink}our-programs/Merck-Foundation-More-Than-a-Mother/Video";
  static String sharewatchallvideoafrica =
      "${baseurllink}our-programs/Merck-Foundation-Africa-Asia-Luminary/Video";
  static String sharewatchallvideoeducatinglinda =
      "${baseurllink}our-programs/Merck-Foundation-Educating-Linda-Program/Video";
  static String sharewatchallvideofertility =
      "${baseurllink}our-programs/Merck-Foundation-Fertility-and-Embryology-Training-Program/Video";
  static String sharewatchallvideofirstlady =
      "${baseurllink}our-programs/Merck-Foundation-First-Ladies-Initiative-Summit-MFFLI/Video";

  static String sharewatchallvideocapaity =
      "${baseurllink}our-programs/Merck-Foundation-Capacity-Advancement-Nationwide-Diabetes-Blue-Points-Program/Video";
  static String sharewatchallvideommtm =
      "${baseurllink}our-programs/Merck-Foundation-More-Than-a-Mother/Video";
  static String sharewatchallvideostem =
      "${baseurllink}our-programs/Merck-Foundation-STEM-Program/Video";
  static String sharewatchallvideosubstain = "${baseurllink}";
  static String sharewatchallvideocancer =
      "${baseurllink}our-programs/Merck-Foundation-Cancer-Access-Program/Video";
  static String sharewatchallvideovideommtm =
      "${baseurllink}our-programs/Merck-Foundation-More-Than-a-Mother/Video";
  static String sharewatchallvideovideocancer =
      "${baseurllink}our-programs/Merck-Foundation-Cancer-Access-Program/Video";

  //followus Merck Foundation More Than a Mother
  static String followmmtminsta =
      "https://www.instagram.com/merckmorethanamother";
  static String followmmtmfacebook =
      "https://www.facebook.com/merckmorethanamother";
  static String followmmtmtwitter = "https://www.twitter.com/merckandmothers";
  static String followmmtmyoutube =
      "https://www.youtube.com/c/merckmorethanamother";
  // static String followmmtmflicker =
  //     "https://www.flickr.com/photos/163124125@N08/";

  //followus merck cancer access program
  static String followmmerckCancerFb =
      "https://www.facebook.com/merckcancercontrolprogram";
  static String followmmerckCancertwitter =
      "https://www.twitter.com/merck_mccp";
  static String followmmerckCancergmailPlus = "merckmccp@gmail.com";
  static String followmmerckCanceryoutube =
      "https://www.youtube.com/channel/UCokfpTgsO86UV4YzUXXqDAw";

//follow us Merck Capacity Advancement & Nationwide
  static String followmmerckAdvancementFb = "https://www.facebook.com/merckcap";
  static String followmmerckAdvancementtwitter =
      "https://www.twitter.com/merckcap";
  static String followmmerckAdvancementinstagram =
      "https://www.instagram.com/merckcap";
  static String followmmerckAdvancementyoutube =
      "https://www.youtube.com/channel/UCs2EmCvezkOC_KPDeGNcB9Q";

  //followus on merck stem program
  static String followmmerckStemFb =
      "https://www.facebook.com/merckafricaresearchsummit";
  static String followmmerckStemtwitter = "https://www.twitter.com/merck_mars";
  static String followmmerckStemgmailPlus = "unescomars@gmail.com";
  static String followmmerckStemyoutube =
      "https://www.youtube.com/channel/UCtXbhRueJd8Zftd1tIFu2BQ";

  static String followmsg = "follow us";
  static String emptyData = "No Data Found";
  static String baseUrl = "";
  static String pdfUrl = "";
  static double tabheight = 500;
  static double callimageheight = 300;
  static double callimagewidth = 220;
  static double callcoursaheight = 360;

  //call ambassdar width as per client
  static double callAmbassadarimagewidth = 240;
}

import 'package:merckfoundation22dec/model/dataprivacy.dart' as dataPrivacy;
import 'package:merckfoundation22dec/model/legaldisclaimerResponse.dart'
    as legalDisclaimer;
import 'package:merckfoundation22dec/model/ourmissionResponse.dart'
    as ourMission;
import 'package:merckfoundation22dec/model/ourpolicy.dart' as ourPolicy;
import 'package:merckfoundation22dec/model/visionResponse.dart' as visionResp;
import 'package:merckfoundation22dec/model/ourActivitiesObjectiveResp.dart'
    as objectives;
import 'package:merckfoundation22dec/model/ourActivitiesResponse.dart'
    as activitiesResp;
import 'package:merckfoundation22dec/model/leadershipTeamResponse.dart'
    as leadershipTeam;

import 'package:merckfoundation22dec/model/ourPartnerObjectivesResp.dart'
    as ourPartnerobjective;

import 'package:merckfoundation22dec/model/ourPartnerResponse.dart'
    as ourPartnerResp;
import 'package:merckfoundation22dec/model/videoLibraryResponse.dart'
    as videolibrayResp;
import 'package:merckfoundation22dec/model/getStoriesResponse.dart'
    as storiesResp;
import 'package:merckfoundation22dec/model/newsLettersArticlesResp.dart'
    as newsArticles;
import 'package:merckfoundation22dec/model/getNewsRelease.dart' as newsRelease;
import 'package:merckfoundation22dec/model/merckFoundationMediaResp.dart'
    as merckMediaresp;
import 'package:merckfoundation22dec/model/getMerckTestimonialResp.dart'
    as merckTestimonialResp;
import 'package:merckfoundation22dec/model/callforapplicationResponse.dart'
    as callforapp;
import 'package:merckfoundation22dec/model/StrategyResponse.dart' as strategy;
import 'package:merckfoundation22dec/model/GetFirstLadiesInitaiveResponse.dart'
    as firstladies;
import 'package:merckfoundation22dec/model/mmtmResponse.dart' as mmtm;
import 'package:merckfoundation22dec/model/empoweringbernacontentResponse.dart'
    as empowerbernacontent;
import 'package:merckfoundation22dec/model/empoweingbernavideo.dart'
    as empowerbernavideo;
import 'package:merckfoundation22dec/model/MMTMSlider.dart' as mmtmslider;
import 'package:merckfoundation22dec/model/mmtmContentResponse.dart'
    as mmtmcontent;
import 'package:merckfoundation22dec/model/merckothervideo.dart' as merckvideo;
import 'package:merckfoundation22dec/model/MMTMlatestupdateResponse.dart'
    as mmtmlatestupdate;
import 'package:merckfoundation22dec/model/mmtminmediaResponse.dart'
    as mmtminmedia;
import 'package:merckfoundation22dec/model/mmtmTestimonialResponse.dart'
    as mmtmtestimonial;
import 'package:merckfoundation22dec/model/mmtmcallforappResponse.dart'
    as mmtmcallforapp;
import 'package:merckfoundation22dec/model/mmtmdigitallibrary.dart'
    as mmtmdigitallibrary;

import 'package:merckfoundation22dec/model/GetFertilityContentResp.dart'
    as fertilityContent;
import 'package:merckfoundation22dec/model/GetFertilityTestimonialResp.dart'
    as fertilityTestimonial;
import 'package:merckfoundation22dec/model/GetFertilityVideosResp.dart'
    as fertilityVideos;

import 'package:merckfoundation22dec/model/GetLocalSongsContentResp.dart'
    as localContet;

import 'package:merckfoundation22dec/model/GetLocalSongsDigitalResp.dart'
    as localDigitalLib;

import 'package:merckfoundation22dec/model/GetLocalSongsVideosResp.dart'
    as localVideos;
import 'package:merckfoundation22dec/model/GetAboutMerckContentResp.dart'
    as aboutContent;
import 'package:merckfoundation22dec/model/GetAboutMerckVideosResp.dart'
    as aboutVidoes;
import 'package:merckfoundation22dec/model/CountrylistResponse.dart'
    as countrylist;
import 'package:merckfoundation22dec/model/CategorylistResponse.dart'
    as categorylist;
import 'package:merckfoundation22dec/model/LeadershipResponse.dart' as ceolist;
import 'package:merckfoundation22dec/model/OurawardResponse.dart' as awardlist;
import 'package:merckfoundation22dec/model/FilterdataResponse.dart'
    as filterlist;
import 'package:merckfoundation22dec/model/OurawarddetailResponse.dart'
    as awarddetail;
import 'package:merckfoundation22dec/model/HomepageResponse.dart' as home;
import 'package:merckfoundation22dec/model/searchmodel/SearchvideocategoryResponse.dart'
    as searchvideo;
import 'package:merckfoundation22dec/model/searchmodel/SearchnewreleasecategoryResponse.dart'
    as searchnewrelease;

class GlobalLists {
  static List<visionResp.ListElement> vision = [];
  static List<legalDisclaimer.ListElement> legaldisclaimer = [];
  static List<ourMission.ListElement> ourmission = [];
  static List<ourPolicy.ListElement> ourpolicy = [];
  static List<objectives.ListElement> ourActivitiesObjectives = [];
  static List<activitiesResp.ListElement> ourActivitiesData = [];
  static List<leadershipTeam.ListElement> leadershipTeamResp = [];

  static List<dataPrivacy.ListElement> dataprivacy = [];
  static List<ourPartnerobjective.ListElement> ourPartnerObjectives = [];
  static List<ourPartnerResp.ListElement> ourPartnerList = [];

  //media event
  static List<videolibrayResp.ListElement> videolibrary = [];

  static List<storiesResp.ListElement> storiesList = [];

  static List<newsArticles.ListElement> newsLettersList = [];
  static List<newsRelease.ListElement> newsReleaseList = [];
  static List<merckMediaresp.ListElement> merckinMediaList = [];
  static List<merckTestimonialResp.ListElement> merckTestimonialList = [];

  static List<callforapp.Past> upcomingevent = [];
  static List<callforapp.Past> pastevent = [];

  //ourprogram
  static List<strategy.ListElement> strategylist = [];
  static List<firstladies.ListElement> firstladieslist = [];
  static List<mmtm.Datum> mmtmlist = [];

  static List<empowerbernacontent.ListElement> empowercontentlist = [];
  static List<empowerbernavideo.ListElement> empowervideotlist = [];
//MMTM
  static List<mmtmslider.ListElement> mmtmsliderlist = [];
  static List<mmtmcontent.ListElement> mmtmcontentlist = [];

  static List<merckvideo.ListElement> mmtmvideoseclist = [];
  static List<mmtmlatestupdate.ListElement> mmtmlatestupdatelist = [];
  static List<mmtminmedia.ListElement> mmtminmediaresp = [];

  static List<mmtmtestimonial.ListElement> mmtmtestimonialresp = [];
  static List<mmtmcallforapp.ListElement> mmtmcallforappresp = [];

  static List<mmtmdigitallibrary.ListElement> mmtmdigitallibresp = [];

  //Fertility program
  static List<fertilityContent.ListElement> fertilityContentList = [];
  static List<fertilityTestimonial.ListElement> fertilityTestimonialList = [];
  static List<fertilityVideos.ListElement> fertilityVideosList = [];

  static List<localContet.ListElement> localSongsContent = [];

  static List<localDigitalLib.ListElement> localSongsDigitalList = [];
  static List<localVideos.ListElement> localSongsVideosList = [];

  static List<aboutContent.ListElement> merckAboutcontent = [];
  static List<aboutVidoes.ListElement> merckAboutVideos = [];

  //filter
  static List<countrylist.ListElement> countrylisting = [];
  static List<categorylist.ListElement> categorylisting = [];
  static List<filterlist.ListElement> filterdatalisting = [];

  //leadership
  static List<ceolist.BoardOfTrusteesOfMerckFoundation> ceolisting = [];
  static List<ceolist.BoardOfTrusteesOfMerckFoundation> boardoftrust = [];

  //ouraward
  static List<awardlist.ListElement> awardlisting = [];
  static List<awarddetail.ListElement> awarddetallisting = [];

  //search
  static List<dynamic> searchvideollisting = [];
  static List<dynamic> searchnewreleaselisting = [];
  static List<dynamic> searcharticlelisting = [];
  static List<dynamic> searcheventslisting = [];
  static List<dynamic> searchtestimoniallisting = [];
  static List<dynamic> searchphotolisting = [];
  static List<dynamic> searchmedialisting = [];
  static List<dynamic> searchceomeassagelisting = [];
  static List<dynamic> searchawardlisting = [];

  //ourprogram
  static List<dynamic> programvideollisting = [];

  //home api
  static List<dynamic> homevideolist = [];
  static List<dynamic> homeawardlist = [];
  static List<dynamic> homecontentlist = [];

  static List<dynamic> homegallerylist = [];
  static String homegallerybaseurl = "";
  static String homeceomsgbaseurl = "";
  static String homeCallForAppBaseURL = "";
  static String homeDigitalLibraryBaseURL = "";
  static String homeMMTMBaseURL = "";

  static List<dynamic> homeceomsglist = [];

  static List<dynamic> homecallforapp = [];
  static List<dynamic> homedigitallib = [];
  static List<dynamic> homemmtm = [];

  //mmtm

  static List<dynamic> mmtmmedialist = [];
  static String mmtmmediabaseurl = "";

  static List<dynamic> mmttestimoniallist = [];
  static String mmttestimonialbaseurl = "";
  static String merckcancerawardbaseurl = "";
  static List<dynamic> merckcancerawardlist = [];

  //testimonailprogram
  static List<dynamic> testimonialprolist = [];
  static String testimonialprobaseurl = "";
}

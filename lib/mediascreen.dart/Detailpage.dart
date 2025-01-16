import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:merckfoundation22dec/screens/dashboard.dart';
import 'package:merckfoundation22dec/utility/GlobalLists.dart';
import 'package:merckfoundation22dec/widget/customcolor.dart';
import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';

import 'package:merckfoundation22dec/widget/showdailog.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Detailpage extends StatefulWidget {
  final int indexIs;
  final int callfrom;
  const Detailpage({Key key, this.indexIs, this.callfrom}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DetailpageState();
  }
}

class DetailpageState extends State<Detailpage> with TickerProviderStateMixin {
  AnimationController _controller;
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    log(widget.indexIs.toString(), name: 'is cdhd');
    log(widget.callfrom.toString(), name: 'is cdhd');

    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Customcolor.background,
        appBar: InnerCustomAppBar(
          onTapval: () {
            Navigator.pop(context);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (BuildContext context) => Dashboard(
            //               index: 0,
            //             )));
            // if (widget.callfrom == 1) {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (BuildContext context) => Dashboard(
            //                 index: 3,
            //               )));
            // } else {
            //   Navigator.pop(context);
            // }
          },
          index: widget.callfrom == 1
              ? 2
              : widget.callfrom == 3
                  ? 2
                  : 1,
          titleshowingindex: "1",
          sharelink: widget.callfrom == 1
              ? Constantstring.sharearticledetailpage +
                  GlobalLists.newsLettersList[widget.indexIs].detailPageUrl
              : widget.callfrom == 3
                  ? Constantstring.sharearticledetailpage +
                      GlobalLists.homeceoList[widget.indexIs].detailPageUrl
                  : "",
          title: widget.callfrom == 1
              ? GlobalLists.newsLettersList[widget.indexIs].title
              : widget.callfrom == 3
                  ? GlobalLists.homeceoList[widget.indexIs].title
                  : "Articles",
          titleImg: "assets/newImages/vision_logo.png",
          trallingImg1: "assets/newImages/share.png",
          trallingImg2: "assets/newImages/search.png",
          height: 85,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: ListView(
                shrinkWrap: true,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.callfrom == 1
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 8, top: 8, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                GlobalLists
                                    .newsLettersList[widget.indexIs].title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize:
                                      ResponsiveFlutter.of(context).fontSize(2),
                                  fontWeight: FontWeight.w600,
                                  color: Customcolor.colorVoilet,
                                ),
                              ),
                              HtmlWidget(
                                """${GlobalLists.newsLettersList[widget.indexIs].details} """,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              HtmlWidget(
                                """${GlobalLists.newsLettersList[widget.indexIs].detailPageUrl} """,
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(
                              //       right: 60, left: 60, top: 20),
                              //   child: Image.asset(
                              //     "assets/newImages/flowers_footer.png",
                              //   ),
                              // ),
                              // Padding(
                              //   padding:
                              //       const EdgeInsets.only(right: 0, left: 0),
                              //   child: Align(
                              //     alignment: Alignment.topRight,
                              //     child: Image.asset(
                              //       "assets/newImages/flowers_footer.png",
                              //       height: 170,
                              //     ),
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // )
                            ],
                          ),
                        )
                      : widget.callfrom == 2
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8, bottom: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HtmlWidget(
                                    """${GlobalLists.homeceomsglist[widget.indexIs].title} """,
                                  ),
                                  HtmlWidget(
                                    """${GlobalLists.homeceomsglist[widget.indexIs].details} """,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),

                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       right: 60, left: 60, top: 20),
                                  //   child: Image.asset(
                                  //     "assets/newImages/flowers_footer.png",
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 0, left: 0),
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Image.asset(
                                        "assets/newImages/flowers_footer.png",
                                        height: 170,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              ),
                            )
                          : widget.callfrom == 3
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 8, bottom: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HtmlWidget(
                                        """${GlobalLists.homeceoList[widget.indexIs].title} """,
                                      ),
                                      HtmlWidget(
                                          '${GlobalLists.homeceoList[widget.indexIs].details}'),
                                      // Html(
                                      //   data:
                                      //       """<p class=\"MsoPlainText\" style=\"margin: 0in; text-align: right;\"><span style=\"font-size:10.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong>View <a href=\"https://merck-foundation.com/news-articles/Merck-Foundation-and-African-First-Ladies-mark-World-Assisted-Reproductive-Technology-Day-2023\"><span style=\"color:#2980b9;\">English</span></a><font color=\"#2980b9\">&nbsp;</font>| <a href=\"https://merck-foundation.com/news-articles/Merck-Foundation-and-African-First-Ladies-mark-World-Assisted-Reproductive-Technology-Day-2023-Portuguese\"><span style=\"color:#2980b9;\">Portuguese</span></a> version</strong></span></span></p>\r\n\r\n<p class=\"MsoPlainText\" style=\"margin: 0in; text-align: right;\">&nbsp;</p>\r\n\r\n<p class=\"MsoPlainText\" style=\"margin: 0in; text-align: center;\"><img src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=1_Main_Senator+Dr+Rasha+Kelej%2C+CEO+of+Merck+Foundation+with+African+First+Ladies%281%29.JPG\" style=\"width: 600px; height: 400px;\" /></p>\r\n\r\n<ul>\r\n\t<li class=\"MsoPlainText\" style=\"text-align: justify; margin: 0in;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><b><span lang=\"FR\"><span style=\"line-height:150%\"><span style=\"color:#002060\">La Fondation Merck c&eacute;l&egrave;bre la Journ&eacute;e Mondiale de l&#39;ART (Technologies de Procr&eacute;ation Assist&eacute;e) 2023 en offrant 490 bourses d&#39;Embryologie, de Fertilit&eacute; et de Soins de Reproduction dans 39 pays d&#39;Afrique et d&#39;Asie.</span></span></span></b></span></span></span></li>\r\n\t<li class=\"MsoPlainText\" style=\"text-align: justify; margin: 0in;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><b><span lang=\"FR\"><span style=\"line-height:150%\"><span style=\"color:#002060\">La Fondation Merck entre dans l&#39;histoire en formant les premiers Embryologistes locaux et Experts en Reproduction et Fertilit&eacute; dans de nombreux pays tels que la Gambie, le Lib&eacute;ria, le Burundi, la Guin&eacute;e, le Tchad, le Niger, la Sierra Leone, le Malawi et le Congo. En outre, a soutenu la formation du personnel des premiers centres publics de FIV au Rwanda, au Burundi, en &Eacute;thiopie, au Niger, au Bangladesh et au Myanmar.</span></span></span></b></span></span></span></li>\r\n</ul>\r\n\r\n<p class=\"MsoPlainText\" style=\"margin: 0in; text-align: center;\"><img src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Merck+Foundation+marks+Assisted+Reproductive+Technology+Day+2023+%281%29%283%29.jpg\" style=\"width: 600px; height: 601px;\" /></p>\r\n\r\n<p class=\"MsoPlainText\" style=\"margin-left:.5in; text-align:justify; margin:0in\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><b>&nbsp;</b></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><b><span lang=\"FR\"><span style=\"line-height:106%\">La Fondation Merck, </span></span></b><span lang=\"FR\"><span style=\"line-height:106%\">la branche philanthropique de Merck KGaA Allemagne, c&eacute;l&egrave;bre la <b>&laquo; Journ&eacute;e Mondiale de l&#39;ART (Technologies de Procr&eacute;ation Assist&eacute;e) 2023 &raquo; </b>avec les<b> Premi&egrave;res Dames Africaines, </b>qui sont &eacute;galement les <b>Ambassadrices de la Campagne &laquo; La Fondation Merck Plus Qu&#39;une M&egrave;re &raquo;, </b>en renfor&ccedil;ant et en faisant progresser les capacit&eacute;s de soins de fertilit&eacute; en Afrique et en Asie.</span></span></span></span></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><span style=\"color:#2980b9;\"><span style=\"font-size:10.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><img height=\"400\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Senator%2C+Dr+Rasha+Kelej+during+her+visit+to+Uganda%281%29.jpg\" width=\"600\" /><br />\r\n<em><strong>Senator, Dr. Rasha Kelej during her visit to Uganda</strong></em></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><b><span lang=\"FR\"><span style=\"line-height:150%\">S&eacute;natrice, Dr. Rasha Kelej, CEO de la Fondation Merck et Pr&eacute;sidente de &laquo; Plus Qu&#39;une M&egrave;re &raquo; </span></span></b><span lang=\"FR\"><span style=\"line-height:150%\">a soulign&eacute; : &laquo; &Agrave; la Fondation Merck, nous croyons fermement au r&ocirc;le essentiel des embryologistes et des sp&eacute;cialistes de la fertilit&eacute; et des soins de reproduction pour autonomiser les femmes infertiles en am&eacute;liorant leur acc&egrave;s &agrave; l&#39;information, leur changement de mentalit&eacute; et des soins de fertilit&eacute; de qualit&eacute; et &eacute;quitables en Afrique et en Asie dans le cadre de notre campagne &laquo; Plus Qu&#39;une M&egrave;re &raquo;. </span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span lang=\"FR\"><span style=\"line-height:150%\">Dans le cadre de la campagne, nous avons marqu&eacute; la <b>Journ&eacute;e Mondiale de l&#39;ART</b> en offrant plus de <b>490 bourses</b> &agrave; de jeunes m&eacute;decins de <b>39 pays</b> pour qu&#39;ils deviennent les experts locaux en Embryologie, en Fertilit&eacute; et en Soins de Reproduction dans leur pays. De plus, beaucoup de nos anciens ont &eacute;t&eacute; form&eacute;s pour &ecirc;tre les premiers experts locaux dans leur pays o&ugrave; ils n&#39;ont jamais eu un seul embryologiste local ou sp&eacute;cialiste de la fertilit&eacute; avant notre programme, tels que ; La Gambie, le Burundi, la Guin&eacute;e, le Tchad, le Niger, la Sierra Leone, le Lib&eacute;ria, le Malawi, le Congo, le Mozambique et plus encore.</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span lang=\"FR\"><span style=\"line-height:150%\">En collaboration avec les Anciens de la Fondation Merck et nos partenaires, nous &eacute;crivons l&#39;histoire et remodelons le paysage de la fertilit&eacute; et des soins de reproduction &agrave; travers l&#39;Afrique et au-del&agrave;.&nbsp;&raquo;</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"color:#2980b9;\"><span style=\"font-size:10.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><img height=\"400\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Senator+Dr+Rasha+Kelej+during+her+visit+to+Uganda+1+%283%29_1.jpg\" width=\"600\" /><br />\r\n<em><strong>Senator, Dr. Rasha Kelej during her visit to Uganda&nbsp;</strong></em></span></span></span></p>\r\n\r\n<p style=\"text-align: center;\"><img src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Dr+Rasha+Kelej+in+Uganda%2C+holding+a+chicken+gifted+to+her+by+the+women%283%29.jpg\" style=\"width: 600px; height: 400px;\" /></p>\r\n\r\n<p style=\"text-align: center;\">&nbsp;</p>\r\n\r\n<p style=\"text-align: center;\"><span style=\"color:#2980b9;\"><span style=\"font-size:10.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><img height=\"400\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Senator+Dr+Rasha+Kelej+during+her+visit+to+Uganda+1+%282%29_1.jpg\" width=\"600\" /></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:11.0pt;\"><span style=\"line-height:150%;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><b><span lang=\"FR\"><span style=\"margin:0in 0in 8pt;text-align:justify;\">La</span><span style=\"font-family:Calibri,sans-serif\"><b><span lang=\"FR\" style=\"font-size:10.0pt\"><span style=\"line-height:150%\"><span style=\"font-family:&quot;Verdana&quot;,sans-serif\"> </span></span></span></b></span><span style=\"line-height:150%\">Fondation Merck &laquo; Plus Qu&#39;une M&egrave;re &raquo; </span></span></b><span lang=\"FR\"><span style=\"line-height:150%\">est un mouvement fort qui vise &agrave; autonomiser les femmes vivant avec l&#39;infertilit&eacute; gr&acirc;ce &agrave; l&#39;acc&egrave;s &agrave; l&#39;information, &agrave; l&#39;&eacute;ducation, au changement de mentalit&eacute; et &agrave; l&#39;autonomisation &eacute;conomique. Cette puissante campagne d&eacute;finit les interventions visant &agrave; renforcer la qualit&eacute; et l&#39;&eacute;quit&eacute; des capacit&eacute;s en mati&egrave;re de soins de reproduction et de fertilit&eacute;, &agrave; briser la stigmatisation li&eacute;e &agrave; l&#39;infertilit&eacute; et &agrave; sensibiliser sur la pr&eacute;vention de l&#39;infertilit&eacute; et l&#39;infertilit&eacute; masculine.</span></span></span></span></span></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><img height=\"400\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Main+Image_Dr+Rasha+Kelej+with+infertile+women+in+The+Gambia.jpg\" width=\"600\" /><br />\r\n<span style=\"text-align:center;\"><span style=\"color:#2980b9;\"><span style=\"font-size:10.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><em><strong>Senator, Dr. Rasha Kelej with infertile women in The Gambia.</strong></em></span></span></span></span></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><img src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Dr+Rasha+Kelej+in+Gambia+with+local+women%282%29.JPG\" style=\"width: 600px; height: 400px;\" /></p>\r\n\r\n<p style=\"text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span lang=\"FR\"><span style=\"line-height:150%\">&laquo; Pour donner un aper&ccedil;u, sur nos <b>1580 bourses</b> au total, nous avons fourni plus de <b>215 bourses</b> de formation clinique et pratique &agrave; des Sp&eacute;cialistes de la Fertilit&eacute; et &agrave; des Embryologistes, et plus de <b>275 bourses</b> pour un Dipl&ocirc;me Post-Universitaire et un Master en M&eacute;decine Sexuelle et Reproductive, Psychiatrie Clinique, Sant&eacute; des Femmes, Biotechnologie de la Reproduction Assist&eacute;e Humaine et Embryologie, Urologie, Comp&eacute;tences Chirurgicales Laparoscopiques &agrave; des m&eacute;decins de 39 pays d&#39;Afrique et d&#39;Asie. Nous sommes fiers de cette r&eacute;alisation &raquo;, a ajout&eacute; le <b>Dr. Rasha Kelej.</b></span></span></span></span></span></p>\r\n\r\n<div class=\"videoEmbed\" style=\"text-align: center;\"><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"349\" mozallowfullscreen=\"\" src=\"https://www.youtube.com/embed/chNOnrQXYxA\" webkitallowfullscreen=\"\" width=\"560\"></iframe></div>\r\n\r\n<div class=\"videoEmbed\" style=\"text-align: center;\">\r\n<div class=\"videoEmbed\"><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"349\" mozallowfullscreen=\"\" src=\"https://www.youtube.com/embed/pLmnCP5Eyk8\" webkitallowfullscreen=\"\" width=\"560\"></iframe></div>\r\n</div>\r\n\r\n<p style=\"text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span lang=\"FR\"><span style=\"line-height:150%\">De plus, la Fondation Merck a form&eacute; plus de 2500 repr&eacute;sentants des m&eacute;dias de plus de 35 pays pour sensibiliser la communaut&eacute; et briser la stigmatisation autour de l&#39;infertilit&eacute; et des femmes infertiles et sans enfant.</span></span></span></span></span></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><img height=\"400\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Senator+Dr+Rasha+Kelej+during+her+visit+to+Uganda+1+%282%29.jpg\" width=\"600\" /><br />\r\n<span style=\"margin:0in 0in 8pt;text-align:center;\"><span style=\"color:#2980b9;\"><span style=\"font-size:10.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><em><strong>Senator, Dr. Rasha Kelej during her visit to Uganda&nbsp;</strong></em></span></span></span></span><br />\r\n&nbsp;</p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><img src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Senator+Dr_+Rasha+Kelej%2C+CEO+of+Merck+Foundation+with+infertile+women+%282%29%283%29.jpg\" style=\"width: 600px; height: 400px;\" /></p>\r\n\r\n<p style=\"text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span lang=\"FR\"><span style=\"line-height:150%\">La Fondation Merck a &eacute;galement autonomis&eacute; les femmes sans enfant et infertiles gr&acirc;ce &agrave; son initiative <b>&laquo; Empowering Berna &raquo;</b> dans le cadre de son mouvement <b>&laquo; Plus Qu&#39;une M&egrave;re &raquo;</b>. Cette initiative aide les femmes qui ne peuvent plus &ecirc;tre trait&eacute;es pour l&#39;infertilit&eacute; en les aidant &agrave; se former pour cr&eacute;er de petits commerces afin qu&#39;elles puissent &ecirc;tre ind&eacute;pendantes et reconstruire leur vie. Gr&acirc;ce &agrave; &laquo; Empowering Berna &raquo;, la vie de nombreuses femmes infertiles a &eacute;t&eacute; transform&eacute;e dans de nombreux pays africains comme le Kenya, l&#39;Ouganda, le Nigeria, la R&eacute;publique Centrafricaine, le Niger, le Malawi et bien d&#39;autres.</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align: center;\"><em><strong><img height=\"400\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Senator+Dr+Rasha+Kelej+with+H_E_+First+Lady+of+Central+African+Republic+with+a+group+of+infertile+women.jpg\" width=\"600\" /><br />\r\n<span style=\"margin:0in 0in 8pt;text-align:center;\"><span style=\"color:#2980b9;\"><span style=\"font-size:10.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">Senator, Dr. Rasha Kelej with H.E. First Lady of Central African Republic with a group of infertile women.</span></span></span></span></strong></em></p>\r\n\r\n<p style=\"text-align: center;\"><img height=\"400\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Senator+Dr+Rasha+Kelej+with+H_E_+First+Lady+of+Central+African+Republic+with+a+group+of+infertile+women+1.jpg\" width=\"600\" /></p>\r\n\r\n<p style=\"text-align: center;\"><img src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Merck+Foundation+CEO+with+infertile+women+%282%29.jpeg\" style=\"width: 600px; height: 400px;\" /></p>\r\n\r\n<p style=\"text-align: center;\"><img src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Merck+Foundation+CEO+with+infertile+women+%281%29%281%29.jpeg\" style=\"width: 600px; height: 400px;\" /></p>\r\n\r\n<p style=\"text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:11.0pt;\"><span style=\"margin:0in 0in 8pt;text-align:justify;\"><span lang=\"FR\"><span style=\"line-height:106%;\"><span style=\"font-family:&quot;Verdana&quot;,sans-serif;\">La</span></span></span></span><span style=\"line-height:106%\"><span style=\"font-family:&quot;Verdana&quot;,sans-serif\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"> Fondation Merck, en partenariat avec les Premi&egrave;res Dames Africaines, a &eacute;galement lanc&eacute; L&rsquo;Histoire de David, un livre de contes pour enfants qui met l&#39;accent sur les fortes valeurs familiales d&#39;amour et de respect d&egrave;s le plus jeune &acirc;ge, qui refl&eacute;tera sur l&#39;&eacute;limination de la stigmatisation de l&#39;infertilit&eacute; et de la violence domestique qui en r&eacute;sulte &agrave; l&#39;avenir. Les livres de contes ont &eacute;t&eacute; adapt&eacute;s pour chaque pays et en trois langues, anglais, fran&ccedil;ais et portugais pour avoir une meilleure connexion avec les jeunes lecteurs. Lisez l&#39;histoire de David ici :</span></span></span></span><span lang=\"FR\" style=\"font-size:10.0pt\"><span style=\"line-height:106%\"><span style=\"font-family:&quot;Verdana&quot;,sans-serif\"> </span></span></span></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><strong><a href=\"https://merck-foundation.com/merckfoundation/public/uploads/digital_library/1623068222_8c2d31133aeda35530d4.pdf\"><span style=\"color:#2980b9;\">English</span></a> | <a href=\"https://merck-foundation.com/merckfoundation/public/uploads/digital_library/1623068239_d5ac161f52a276e3a2d8.pdf\"><span style=\"color:#2980b9;\">French </span></a>| <a href=\"https://merck-foundation.com/merckfoundation/public/uploads/digital_library/1623068256_e25a84f80ce1244c7c9a.pdf\"><span style=\"color:#2980b9;\">Portuguese</span></a></strong></span></span></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><img alt=\"\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=4%2817%29.jpg\" style=\"width: 430px; height: 596px;\" /></p>\r\n\r\n<p style=\"text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span lang=\"FR\"><span style=\"line-height:150%\">Le programme <b>t&eacute;l&eacute;vis&eacute; panafricain de la Fondation Merck &laquo; Notre Afrique &raquo;</b>, qui est <b>conceptualis&eacute;, produit, r&eacute;alis&eacute; et coanim&eacute; par la S&eacute;natrice, Dr. Rasha Kelej, CEO de la Fondation Merck </b>et pr&eacute;sente des cr&eacute;ateurs de mode africains, des chanteurs et des experts &eacute;minents de divers domaines dans le but de sensibiliser et de cr&eacute;er un changement de culture &agrave; travers l&#39;Afrique, comporte de nombreux &eacute;pisodes consacr&eacute;s &agrave; la sensibilisation sur l&#39;infertilit&eacute; et la lutte contre la stigmatisation de l&#39;infertilit&eacute;.</span></span></span></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0in 0in 8pt\">&nbsp;</p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><span style=\"font-size:11.0pt;\"><span lang=\"FR\"><span style=\"line-height:106%\"><span style=\"font-family:&quot;Verdana&quot;,sans-serif\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">Regardez les &eacute;pisodes ici :</span></span></span></span><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span style=\"line-height:150%\"><span verdana=\"\"> </span></span></span></span></span></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><b><span style=\"line-height:150%\"><span verdana=\"\">Episode 3:&nbsp;</span></span></b></span></span></span></p>\r\n\r\n<div class=\"videoEmbed\" style=\"text-align: center;\"><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"349\" mozallowfullscreen=\"\" src=\"https://www.youtube.com/embed/BONCtUJZLHI\" webkitallowfullscreen=\"\" width=\"560\"></iframe></div>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><br />\r\n<span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><b><span style=\"line-height:150%\"><span verdana=\"\">Episode 5:&nbsp;</span></span></b></span></span></span></p>\r\n\r\n<div class=\"videoEmbed\">\r\n<div class=\"videoEmbed\" style=\"text-align: center;\"><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"349\" mozallowfullscreen=\"\" src=\"https://www.youtube.com/embed/RqobIDOHc4E\" webkitallowfullscreen=\"\" width=\"560\"></iframe></div>\r\n</div>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><br />\r\n<span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><b><span style=\"line-height:150%\"><span verdana=\"\">Episode 10:&nbsp;</span></span></b></span></span></span></p>\r\n\r\n<div class=\"videoEmbed\" style=\"text-align: center;\"><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"349\" mozallowfullscreen=\"\" src=\"https://www.youtube.com/embed/FXkB6sYb2Rw\" webkitallowfullscreen=\"\" width=\"560\"></iframe></div>\r\n\r\n<div class=\"videoEmbed\">&nbsp;</div>\r\n\r\n<p style=\"text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span lang=\"FR\"><span style=\"line-height:150%\">La Fondation Merck a &eacute;galement publi&eacute; environ 30 chansons, dont beaucoup ont &eacute;t&eacute; cr&eacute;&eacute;es dans le but de briser la stigmatisation de l&#39;infertilit&eacute;, dans le cadre de leur campagne &laquo; Plus Qu&#39;une M&egrave;re &raquo;. &Eacute;coutez quelques-unes des chansons ici :</span></span></span></span></span></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span lang=\"FR\"><span style=\"line-height:106%\">Regardez, partagez et abonnez-vous au <b>&laquo; Plus qu&#39;une MERE &raquo;</b> compos&eacute; et chant&eacute; par <b>Mme Lucky-Lou, la fille du Pr&eacute;sident et de la Premi&egrave;re Dame du Burundi</b> : </span></span></span></span><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"349\" mozallowfullscreen=\"\" src=\"https://www.youtube.com/embed/EEUjxjqlHv0\" webkitallowfullscreen=\"\" width=\"560\"></iframe></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span lang=\"FR\"><span style=\"line-height:106%\">Regardez, partagez et abonnez-vous &agrave; la chanson <b>&laquo; More Than a Mother &raquo;</b> de <b>Cwesi Oteng et Adina du Ghana</b> : </span></span></span></span></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"349\" mozallowfullscreen=\"\" src=\"https://www.youtube.com/embed/NQ6ZprqAAJs\" webkitallowfullscreen=\"\" width=\"560\"></iframe><br />\r\n&nbsp;</p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><span style=\"font-size:11.0pt;\"><span lang=\"FR\"><span style=\"line-height:106%\"><span style=\"font-family:&quot;Verdana&quot;,sans-serif\"><span style=\"font-family:Verdana,Geneva,sans-serif;\">Regardez, partagez et abonnez-vous &agrave; la chanson <b>&laquo; More Than a Mother &raquo;</b> de <b>S.E. George Weah, Pr&eacute;sident de la R&eacute;publique du Lib&eacute;ria</b> cr&eacute;&eacute; pour soutenir le mouvement <b>&laquo; Plus Qu&#39;une M&egrave;re &raquo;</b> de la Fondation Merck :</span></span></span></span></span><span lang=\"FR\" style=\"font-size:10.0pt\"><span style=\"line-height:106%\"><span style=\"font-family:&quot;Verdana&quot;,sans-serif\"> </span></span></span></p>\r\n\r\n<p style=\"margin: 0in 0in 8pt; text-align: center;\"><iframe allowfullscreen=\"\" frameborder=\"0\" height=\"349\" mozallowfullscreen=\"\" src=\"https://www.youtube.com/embed/DfjS3kY2YWY\" webkitallowfullscreen=\"\" width=\"560\"></iframe></p>\r\n\r\n<div class=\"videoEmbed\" style=\"margin: 0in 0in 0in 0.5in;\">&nbsp;</div>\r\n\r\n<p style=\"text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span lang=\"FR\"><span style=\"line-height:150%\">&Eacute;coutez toutes les chansons de &laquo; Plus Qu&#39;une M&egrave;re &raquo; ici</span></span></span>:<u><strong><span style=\"color:#2980b9;\">https://merck-foundation.com/videos/merck-foundation-more-than-a-mother-songs&nbsp;</span></strong></u></span></span></p>\r\n\r\n<p style=\"text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span lang=\"FR\"><span style=\"line-height:150%\">&laquo; Pour r&eacute;soudre ce probl&egrave;me important de briser la stigmatisation de l&#39;infertilit&eacute; ainsi qu&#39;un large &eacute;ventail d&#39;autres probl&egrave;mes sociaux, nous lan&ccedil;ons chaque ann&eacute;e les prix &laquo; Plus Qu&#39;une M&egrave;re &raquo; de la Fondation Merck en partenariat avec les Premi&egrave;res Dames Africaines. Je voudrais &eacute;galement inviter la communaut&eacute; africaine des m&eacute;dias, de la mode, de la r&eacute;alisation de films et des musiciens, des &eacute;tudiants et des talents potentiels dans ces domaines &agrave; postuler pour les prix cette ann&eacute;e, afin de cr&eacute;er un changement de culture et de briser le silence sur un ou plusieurs des sujets suivants : Briser la stigmatisation li&eacute;e &agrave; l&#39;infertilit&eacute;, soutenir l&#39;&eacute;ducation des filles, l&#39;autonomisation des femmes, mettre fin au mariage des enfants, mettre fin aux MGF et/ou mettre fin &agrave; la VBG &agrave; tous les niveaux. J&#39;ai h&acirc;te de recevoir leur travail cr&eacute;atif sur </span></span><a href=\"mailto:submit@merck-foundation.com\" style=\"color:blue; text-decoration:underline\"><b><span style=\"line-height:150%\">submit@merck-foundation.com</span></b></a><span lang=\"FR\"><span style=\"line-height:150%\">&rdquo;, a conclu la <b>S&eacute;natrice, Dr. Rasha Kelej.</b></span></span></span></span></span></p>\r\n\r\n<p align=\"center\" style=\"margin-top:0in; margin-right:0in; margin-bottom:0in; margin-left:.25in; text-align:center; margin:0in 0in 8pt\">&nbsp;</p>\r\n\r\n<p align=\"center\" style=\"margin-top:0in; margin-right:0in; margin-bottom:0in; margin-left:.25in; text-align:center; margin:0in 0in 8pt\"><span style=\"font-size:12.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><b><span lang=\"FR\"><span style=\"color:#0070c0\">Cliquez sur l&#39;ic&ocirc;ne ci-dessous pour</span></span></b></span><br />\r\n<span style=\"line-height:normal\"><b><span lang=\"FR\"><span style=\"color:#00b0f0\">T&eacute;l&eacute;charger l&#39;APPLICATION de la Fondation Merck</span></span></b></span></span></span></p>\r\n\r\n<p align=\"center\" style=\"margin-top:0in; margin-right:0in; margin-bottom:0in; margin-left:.25in; text-align:center; margin:0in 0in 8pt\"><span style=\"font-size:11.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><b><span lang=\"CS\"><span style=\"color:#00b0f0\"><a href=\"https://www.merck-foundation.com/MF_StoreRedirection\"><img alt=\"\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=MF+App+Download+Icon%289%29.png\" style=\"width: 79px; height: 80px;\" /></a></span></span></b></span></span></span></p>\r\n\r\n<p align=\"center\" style=\"margin-top:0in; margin-right:0in; margin-bottom:0in; margin-left:.25in; text-align:center; margin:0in 0in 8pt\"><span style=\"font-size:12.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:107%\"><b><span lang=\"FR\"><span style=\"line-height:107%\"><span style=\"color:#ff33cc\">Rejoignez la conversation sur nos plateformes de r&eacute;seaux sociaux ci-dessous et faites entendre votre voix</span></span></span></b></span></span></span></p>\r\n\r\n<p align=\"center\" style=\"margin-top:0in; margin-right:0in; margin-bottom:0in; margin-left:.25in; text-align:center; margin:0in 0in 8pt\"><span style=\"font-size:12.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><b><span lang=\"EN-GB\" verdana=\"\"><span style=\"color:#ff33cc\"><img alt=\"\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=FB%2822%29.png\" style=\"width: 40px; height: 40px;\" />&nbsp;</span></span></b><a href=\"https://www.facebook.com/merckfoundation/\"><span style=\"color:#2980b9;\"><strong><em><span lang=\"EN-GB\">Merck Foundation</span></em></strong></span></a></span></span></span></p>\r\n\r\n<p align=\"center\" style=\"margin-top:0in; margin-right:0in; margin-bottom:0in; margin-left:.25in; text-align:center; margin:0in 0in 8pt\"><span style=\"font-size:12.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span style=\"color:#000000;\"><strong><em><span lang=\"EN-GB\"><img alt=\"\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Webp_net-resizeimage+%288%29%2814%29.png\" style=\"width: 41px; height: 39px;\" />&nbsp;</span></em></strong></span><strong><em><span lang=\"EN-GB\"><a href=\"https://www.youtube.com/@MerckFoundation\"><span style=\"color:#2980b9;\">Merck Foundation</span></a></span></em></strong></span></span></span></p>\r\n\r\n<p align=\"center\" style=\"margin-top:0in; margin-right:0in; margin-bottom:0in; margin-left:.25in; text-align:center; margin:0in 0in 8pt\"><span style=\"font-size:12.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span style=\"color:#000000;\"><strong><em><span lang=\"EN-GB\"><img alt=\"\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Instagram%2819%29.png\" style=\"width: 40px; height: 40px;\" />&nbsp;</span></em></strong></span><strong><em><span lang=\"EN-GB\"><a href=\"https://www.instagram.com/merckfoundation/\"><span style=\"color:#2980b9;\">Merck Foundation</span></a></span></em></strong></span></span></span></p>\r\n\r\n<p align=\"center\" style=\"margin-top:0in; margin-right:0in; margin-bottom:0in; margin-left:.25in; text-align:center; margin:0in 0in 8pt\"><span style=\"font-size:12.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span style=\"color:#000000;\"><strong><em><span lang=\"EN-GB\"><img alt=\"\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=twitter-x-logo-png-9.png\" style=\"width: 36px; height: 36px;\" /></span></em></strong></span><strong><em><span lang=\"EN-GB\"><a href=\"https://twitter.com/MerckFoundation\"><span style=\"color:#2980b9;\">@merckfoundation</span></a></span></em></strong></span></span></span></p>\r\n\r\n<p align=\"center\" style=\"margin-top:0in; margin-right:0in; margin-bottom:0in; margin-left:.25in; text-align:center; margin:0in 0in 8pt\"><span style=\"font-size:12.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span style=\"color:#000000;\"><strong><em><span lang=\"EN-GB\"><img alt=\"\" src=\"https://merck-foundation.com/merckfoundation/public/assets/plugins/ckfinder/core/connector/php/connector.php?command=Proxy&amp;type=Files&amp;currentFolder=%2F&amp;fileName=Flicker%289%29.png\" style=\"width: 40px; height: 40px;\" />&nbsp;</span></em></strong></span><strong><em><span lang=\"EN-GB\"><a href=\"https://www.flickr.com/photos/merckfoundation/\"><span style=\"color:#2980b9;\">Merck Foundation</span></a></span></em></strong></span></span></span></p>\r\n\r\n<p style=\"margin-left:.25in; text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:10.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><b><u><span lang=\"FR\"><span style=\"line-height:150%\">&Agrave; propos de la Fondation Merck</span></span></u></b></span></span></span></p>\r\n\r\n<p style=\"margin-left:.25in; text-align:justify; margin:0in 0in 8pt\"><span style=\"font-size:10.0pt;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"line-height:150%\"><span lang=\"FR\"><span style=\"line-height:150%\"><span style=\"color:black\">La Fondation Merck cr&eacute;&eacute;e en 2017, est la branche philanthropique de Merck KGaA Allemagne. Elle vise &agrave; </span>am&eacute;liorer la sant&eacute; et le bien-&ecirc;tre des personnes et &agrave; faire progresser leur vie gr&acirc;ce &agrave; la science et la technologie. Nos efforts sont principalement ax&eacute;s sur l&#39;am&eacute;lioration de l&#39;acc&egrave;s &agrave; des solutions de soins de sant&eacute; de qualit&eacute; et &eacute;quitables dans les communaut&eacute;s mal desservies, le renforcement des capacit&eacute;s de sant&eacute; et de recherche scientifique et l&#39;autonomisation des personnes en STEM (Science, Technologie, Ing&eacute;nierie et Math&eacute;matiques) avec un accent particulier sur les femmes et les jeunes. Tous les communiqu&eacute;s de presse de la Fondation Merck sont distribu&eacute;s par e-mail en m&ecirc;me temps qu&#39;ils deviennent disponibles sur le site Web de la Fondation Merck. Veuillez visiter </span></span><a href=\"http://www.merck-foundation.com\" style=\"color:blue; text-decoration:underline\"><span style=\"color:#0000ff;\"><span style=\"line-height:150%\">www.merck-foundation.com</span></span></a><span lang=\"FR\"><span style=\"line-height:150%\"> pour en savoir plus. Pour en savoir plus, contactez nos r&eacute;seaux sociaux :<span style=\"color:#0000ff;\"> </span></span></span><a href=\"https://www.merck-foundation.com/\" style=\"color:blue; text-decoration:underline\"><span style=\"color:#0000ff;\"><span style=\"line-height:150%\">Merck Foundation</span></span></a><span style=\"color:#0000ff;\"><span lang=\"FR\"><span style=\"line-height:150%\">, </span></span></span><a href=\"https://www.facebook.com/merckfoundation/\" style=\"color:blue; text-decoration:underline\"><span style=\"color:#0000ff;\"><span style=\"line-height:150%\">Facebook</span></span></a><span style=\"color:#0000ff;\"><span lang=\"FR\"><span style=\"line-height:150%\">, </span></span></span><a href=\"https://twitter.com/MerckFoundation\" style=\"color:blue; text-decoration:underline\"><span style=\"color:#0000ff;\"><span style=\"line-height:150%\">Twitter</span></span></a><span style=\"color:#0000ff;\"><span lang=\"FR\"><span style=\"line-height:150%\">,</span></span></span><a href=\"https://www.instagram.com/merckfoundation/\" style=\"color:blue; text-decoration:underline\"><span style=\"color:#0000ff;\"><span style=\"line-height:150%\"> Instagram</span></span></a><a href=\"https://www.youtube.com/@MerckFoundation\" style=\"color:blue; text-decoration:underline\"><span style=\"color:#0000ff;\"><span style=\"line-height:150%\">, YouTube</span></span></a><span style=\"color:#000000;\"><span lang=\"FR\"><span style=\"line-height:150%\"> and</span></span></span><span style=\"color:#0000ff;\"><span lang=\"FR\"><span style=\"line-height:150%\"> </span></span></span><a href=\"https://www.flickr.com/browser/upgrade/?continue=%2Fphotos%2F163124125%40N08%2F\" style=\"color:blue; text-decoration:underline\"><span style=\"color:#0000ff;\"><span style=\"line-height:150%\">Flickr</span></span></a><span style=\"color:#0000ff;\"><span lang=\"FR\"><span style=\"line-height:150%\">.</span></span></span></span></span></span></p>""",
                                      //   onLinkTap: (url) {
                                      //     print("Opening $url...");
                                      //     ShowDialogs.launchURL(url);
                                      //   },
                                      //   style: {
                                      //     "tr": Customcolor.tableboderstyle(context),
                                      //   },
                                      // ),
                                      SizedBox(
                                        height: 15,
                                      ),

                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       right: 60, left: 60, top: 20),
                                      //   child: Image.asset(
                                      //     "assets/newImages/flowers_footer.png",
                                      //   ),
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 0, left: 0),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Image.asset(
                                            "assets/newImages/flowers_footer.png",
                                            height: 170,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 8, top: 8, bottom: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HtmlWidget(
                                        """${GlobalLists.searcharticlelisting[widget.indexIs]['detail_page_url']} """,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      // Html(
                                      //   data:
                                      //       """${GlobalLists.newsLettersList[widget.indexIs].detailPageUrl} """,
                                      //     onLinkTap:(url, _, __, ___) {
                                      //     print("Opening $url...");
                                      //   },
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.only(
                                      //       right: 60, left: 60, top: 20),
                                      //   child: Image.asset(
                                      //     "assets/newImages/flowers_footer.png",
                                      //   ),
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 0, left: 0),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: Image.asset(
                                            "assets/newImages/flowers_footer.png",
                                            height: 170,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                )
                ],
              ),
            ),

            // TextSpan(

            // ),
          ],
        ));
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:merckfoundation22dec/screens/dashboard.dart';
// import 'package:merckfoundation22dec/utility/GlobalLists.dart';
// import 'package:merckfoundation22dec/widget/customcolor.dart';
// import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
// import 'package:flutter_html/style.dart';
// import 'package:merckfoundation22dec/widget/showdailog.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';

// class Detailpage extends StatefulWidget {
//   final int indexIs;
//   final int callfrom;
//   const Detailpage({Key key, this.indexIs, this.callfrom}) : super(key: key);
//   @override
//   State<StatefulWidget> createState() {
//     return DetailpageState();
//   }
// }

// class DetailpageState extends State<Detailpage> with TickerProviderStateMixin {
//   AnimationController _controller;
//   final GlobalKey<State> _keyLoader = new GlobalKey<State>();

//   @override
//   void initState() {
//     super.initState();

//     _controller = new AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 250),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Customcolor.background,
//         appBar: InnerCustomAppBar(
//           onTapval: () {
//             Navigator.pop(context);
//             // Navigator.push(
//             //     context,
//             //     MaterialPageRoute(
//             //         builder: (BuildContext context) => Dashboard(
//             //               index: 0,
//             //             )));
//             // if (widget.callfrom == 1) {
//             //   Navigator.push(
//             //       context,
//             //       MaterialPageRoute(
//             //           builder: (BuildContext context) => Dashboard(
//             //                 index: 3,
//             //               )));
//             // } else {
//             //   Navigator.pop(context);
//             // }
//           },
//           index: widget.callfrom == 1 ? 2 : 1,
//           titleshowingindex: "1",
//           sharelink: widget.callfrom == 1
//               ? Constantstring.sharearticledetailpage +
//                   GlobalLists.newsLettersList[widget.indexIs].detailPageUrl
//               : "",
//           title: widget.callfrom == 1
//               ? GlobalLists.newsLettersList[widget.indexIs].title
//               : "Articles",
//           titleImg: "assets/newImages/vision_logo.png",
//           trallingImg1: "assets/newImages/share.png",
//           trallingImg2: "assets/newImages/search.png",
//           height: 85,
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//         body: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 1),
//               child: ListView(
//                 shrinkWrap: true,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   widget.callfrom == 1
//                       ? Padding(
//                           padding: const EdgeInsets.only(
//                               left: 15, right: 8, top: 8, bottom: 15),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 GlobalLists
//                                     .newsLettersList[widget.indexIs].title,
//                                 textAlign: TextAlign.start,
//                                 style: TextStyle(
//                                   fontSize:
//                                       ResponsiveFlutter.of(context).fontSize(2),
//                                   fontWeight: FontWeight.w600,
//                                   color: Customcolor.colorVoilet,
//                                 ),
//                               ),
//                               Html(
//                                 data:
//                                     """${GlobalLists.newsLettersList[widget.indexIs].details} """,
//                                   onLinkTap:(url, _, __, ___) {
//                                   print("Opening $url...");
//                                   ShowDialogs.launchURL(url);
//                                 },
//                               ),
//                               SizedBox(
//                                 height: 15,
//                               ),
//                               Html(
//                                 data:
//                                     """${GlobalLists.newsLettersList[widget.indexIs].detailPageUrl} """,
//                                   onLinkTap:(url, _, __, ___) {
//                                   print("Opening $url...");
//                                   ShowDialogs.launchURL(url);
//                                 },
//                               ),
//                               // Padding(
//                               //   padding: const EdgeInsets.only(
//                               //       right: 60, left: 60, top: 20),
//                               //   child: Image.asset(
//                               //     "assets/newImages/flowers_footer.png",
//                               //   ),
//                               // ),
//                               // Padding(
//                               //   padding:
//                               //       const EdgeInsets.only(right: 0, left: 0),
//                               //   child: Align(
//                               //     alignment: Alignment.topRight,
//                               //     child: Image.asset(
//                               //       "assets/newImages/flowers_footer.png",
//                               //       height: 170,
//                               //     ),
//                               //   ),
//                               // ),
//                               // SizedBox(
//                               //   height: 10,
//                               // )
//                             ],
//                           ),
//                         )
//                       : widget.callfrom == 2
//                           ? Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 8, right: 8, top: 8, bottom: 15),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Html(
//                                     data:
//                                         """${GlobalLists.homeceomsglist[widget.indexIs].title} """,
//                                       onLinkTap:(url, _, __, ___) {
//                                       print("Opening $url...");
//                                       ShowDialogs.launchURL(url);
//                                     },
//                                     style: {
//                                       "body": Style(
//                                           textAlign: TextAlign.center,
//                                           color: Customcolor.colorVoilet,
//                                           fontSize: FontSize.larger,
//                                           fontWeight: FontWeight.w600),
//                                     },
//                                   ),
//                                   Html(
//                                     data:
//                                         """${GlobalLists.homeceomsglist[widget.indexIs].details} """,
//                                       onLinkTap:(url, _, __, ___) {
//                                       print("Opening $url...");
//                                       ShowDialogs.launchURL(url);
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 15,
//                                   ),

//                                   // Padding(
//                                   //   padding: const EdgeInsets.only(
//                                   //       right: 60, left: 60, top: 20),
//                                   //   child: Image.asset(
//                                   //     "assets/newImages/flowers_footer.png",
//                                   //   ),
//                                   // ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         right: 0, left: 0),
//                                     child: Align(
//                                       alignment: Alignment.topRight,
//                                       child: Image.asset(
//                                         "assets/newImages/flowers_footer.png",
//                                         height: 170,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   )
//                                 ],
//                               ),
//                             )
//                           : Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 15, right: 8, top: 8, bottom: 15),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Html(
//                                     data:
//                                         """${GlobalLists.searcharticlelisting[widget.indexIs]['detail_page_url']} """,
//                                       onLinkTap:(url, _, __, ___) {
//                                       print("Opening $url...");
//                                       ShowDialogs.launchURL(url);
//                                     },
//                                   ),
//                                   SizedBox(
//                                     height: 15,
//                                   ),
//                                   // Html(
//                                   //   data:
//                                   //       """${GlobalLists.newsLettersList[widget.indexIs].detailPageUrl} """,
//                                   //     onLinkTap:(url, _, __, ___) {
//                                   //     print("Opening $url...");
//                                   //   },
//                                   // ),
//                                   // Padding(
//                                   //   padding: const EdgeInsets.only(
//                                   //       right: 60, left: 60, top: 20),
//                                   //   child: Image.asset(
//                                   //     "assets/newImages/flowers_footer.png",
//                                   //   ),
//                                   // ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         right: 0, left: 0),
//                                     child: Align(
//                                       alignment: Alignment.topRight,
//                                       child: Image.asset(
//                                         "assets/newImages/flowers_footer.png",
//                                         height: 170,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   )
//                                 ],
//                               ),
//                             )
//                 ],
//               ),
//             ),

//             // TextSpan(

//             // ),
//           ],
//         ));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:merckfoundation22dec/screens/dashboard.dart';
// import 'package:merckfoundation22dec/utility/GlobalLists.dart';
// import 'package:merckfoundation22dec/widget/botttomlink.dart';
// import 'package:merckfoundation22dec/widget/customcolor.dart';
// import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
// import 'package:flutter_html/style.dart';
// import 'package:merckfoundation22dec/widget/showdailog.dart';
// import 'package:responsive_flutter/responsive_flutter.dart';

// class Detailpage extends StatefulWidget {
//   final int indexIs;
//   final int callfrom;
//   const Detailpage({Key key, this.indexIs, this.callfrom}) : super(key: key);
//   @override
//   State<StatefulWidget> createState() {
//     return DetailpageState();
//   }
// }

// class DetailpageState extends State<Detailpage> with TickerProviderStateMixin {
//   AnimationController _controller;
//   final GlobalKey<State> _keyLoader = new GlobalKey<State>();

//   @override
//   void initState() {
//     super.initState();

//     _controller = new AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 250),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Customcolor.background,
//         appBar: InnerCustomAppBar(
//           onTapval: () {
//             Navigator.pop(context);
//             // Navigator.push(
//             //     context,
//             //     MaterialPageRoute(
//             //         builder: (BuildContext context) => Dashboard(
//             //               index: 0,
//             //             )));
//             // if (widget.callfrom == 1) {
//             //   Navigator.push(
//             //       context,
//             //       MaterialPageRoute(
//             //           builder: (BuildContext context) => Dashboard(
//             //                 index: 3,
//             //               )));
//             // } else {
//             //   Navigator.pop(context);
//             // }
//           },
//           index: widget.callfrom == 1
//               ? 2
//               : widget.callfrom == 3
//                   ? 2
//                   : 1,
//           titleshowingindex: "1",
//           sharelink: widget.callfrom == 1
//               ? Constantstring.sharearticledetailpage +
//                   GlobalLists.newsLettersList[widget.indexIs].detailPageUrl
//               : widget.callfrom == 3
//                   ? Constantstring.sharearticledetailpage +
//                       GlobalLists.homeceoList[widget.indexIs].detailPageUrl
//                   : "",
//           title: widget.callfrom == 1
//               ? GlobalLists.newsLettersList[widget.indexIs].title
//               : widget.callfrom == 3
//                   ? GlobalLists.homeceoList[widget.indexIs].title
//                   : "Articles",
//           titleImg: "assets/newImages/vision_logo.png",
//           trallingImg1: "assets/newImages/share.png",
//           trallingImg2: "assets/newImages/search.png",
//           height: 85,
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//         body: Stack(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 1),
//               child: ListView(
//                 shrinkWrap: true,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   widget.callfrom == 1
//                       ? Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 15, right: 8, top: 8, bottom: 5),
//                               child: Text(
//                                 GlobalLists
//                                     .newsLettersList[widget.indexIs].title,
//                                 textAlign: TextAlign.start,
//                                 style: TextStyle(
//                                   fontSize:
//                                       ResponsiveFlutter.of(context).fontSize(2),
//                                   fontWeight: FontWeight.w600,
//                                   color: Customcolor.colorVoilet,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 15, right: 8, top: 8, bottom: 5),
//                               child: Html(
//                                 data:
//                                     """${GlobalLists.newsLettersList[widget.indexIs].details} """,
//                                 onLinkTap: (url) {
//                                   print("Opening $url...");
//                                   ShowDialogs.launchURL(url);
//                                 },
//                                 style: {
//                                   "tr": Customcolor.tableboderstyle(context),
//                                 },
//                               ),
//                             ),
//                             SizedBox(
//                               height: 15,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 15, right: 8, top: 8, bottom: 5),
//                               child: Html(
//                                 data:
//                                     """${GlobalLists.newsLettersList[widget.indexIs].detailPageUrl} """,
//                                 onLinkTap: (url) {
//                                   print("Opening $url...");
//                                   ShowDialogs.launchURL(url);
//                                 },
//                                 style: {
//                                   "tr": Customcolor.tableboderstyle(context),
//                                 },
//                               ),
//                             ),

//                             Padding(
//                               padding: const EdgeInsets.only(right: 0, left: 0),
//                               child: Align(
//                                 alignment: Alignment.topRight,
//                                 child: Image.asset(
//                                   "assets/newImages/flowers_footer.png",
//                                   height: 170,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Bottomcardlink(),
//                             // Padding(
//                             //   padding: const EdgeInsets.only(
//                             //       right: 60, left: 60, top: 20),
//                             //   child: Image.asset(
//                             //     "assets/newImages/flowers_footer.png",
//                             //   ),
//                             // ),
//                             // Padding(
//                             //   padding:
//                             //       const EdgeInsets.only(right: 0, left: 0),
//                             //   child: Align(
//                             //     alignment: Alignment.topRight,
//                             //     child: Image.asset(
//                             //       "assets/newImages/flowers_footer.png",
//                             //       height: 170,
//                             //     ),
//                             //   ),
//                             // ),
//                             // SizedBox(
//                             //   height: 10,
//                             // )
//                           ],
//                         )
//                       : widget.callfrom == 2
//                           ? Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 15, right: 8, top: 8, bottom: 5),
//                                   child: Html(
//                                     data:
//                                         """${GlobalLists.homeceomsglist[widget.indexIs].title} """,
//                                     onLinkTap: (url) {
//                                       print("Opening $url...");
//                                       ShowDialogs.launchURL(url);
//                                     },
//                                     style: {
//                                       "body": Style(
//                                           textAlign: TextAlign.center,
//                                           color: Customcolor.colorVoilet,
//                                           fontSize: FontSize.larger,
//                                           fontWeight: FontWeight.w600),
//                                       "tr": Customcolor.tableboderstyle(context),
//                                     },
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 15, right: 8, top: 8, bottom: 5),
//                                   child: Html(
//                                     data:
//                                         """${GlobalLists.homeceomsglist[widget.indexIs].details} """,
//                                     onLinkTap: (url) {
//                                       print("Opening $url...");
//                                       ShowDialogs.launchURL(url);
//                                     },
//                                     style: {
//                                       "tr": Customcolor.tableboderstyle(context),
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 ),

//                                 // Padding(
//                                 //   padding: const EdgeInsets.only(
//                                 //       right: 60, left: 60, top: 20),
//                                 //   child: Image.asset(
//                                 //     "assets/newImages/flowers_footer.png",
//                                 //   ),
//                                 // ),
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.only(right: 0, left: 0),
//                                   child: Align(
//                                     alignment: Alignment.topRight,
//                                     child: Image.asset(
//                                       "assets/newImages/flowers_footer.png",
//                                       height: 170,
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Bottomcardlink(),
//                               ],
//                             )
//                           : widget.callfrom == 3
//                               ? Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 15,
//                                           right: 8,
//                                           top: 8,
//                                           bottom: 5),
//                                       child: Html(
//                                         data:
//                                             """${GlobalLists.homeceoList[widget.indexIs].title} """,
//                                         onLinkTap: (url) {
//                                           print("Opening $url...");
//                                           ShowDialogs.launchURL(url);
//                                         },
//                                         style: {
//                                           "body": Style(
//                                               textAlign: TextAlign.center,
//                                               color: Customcolor.colorVoilet,
//                                               fontSize: FontSize.larger,
//                                               fontWeight: FontWeight.w600),
//                                           "tr": Customcolor.tableboderstyle(context),
//                                         },
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 15,
//                                           right: 8,
//                                           top: 8,
//                                           bottom: 5),
//                                       child: Html(
//                                         data:
//                                             """${GlobalLists.homeceoList[widget.indexIs].details} """,
//                                         onLinkTap: (url) {
//                                           print("Opening $url...");
//                                           ShowDialogs.launchURL(url);
//                                         },
//                                         style: {
//                                           "tr": Customcolor.tableboderstyle(context),
//                                         },
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 15,
//                                     ),

//                                     // Padding(
//                                     //   padding: const EdgeInsets.only(
//                                     //       right: 60, left: 60, top: 20),
//                                     //   child: Image.asset(
//                                     //     "assets/newImages/flowers_footer.png",
//                                     //   ),
//                                     // ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           right: 0, left: 0),
//                                       child: Align(
//                                         alignment: Alignment.topRight,
//                                         child: Image.asset(
//                                           "assets/newImages/flowers_footer.png",
//                                           height: 170,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Bottomcardlink(),
//                                   ],
//                                 )
//                               : Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 15,
//                                           right: 8,
//                                           top: 8,
//                                           bottom: 5),
//                                       child: Html(
//                                         data:
//                                             """${GlobalLists.searcharticlelisting[widget.indexIs]['detail_page_url']} """,
//                                         onLinkTap: (url) {
//                                           print("Opening $url...");
//                                           ShowDialogs.launchURL(url);
//                                         },
//                                         style: {
//                                           "tr": Customcolor.tableboderstyle(context),
//                                         },
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     // Html(
//                                     //   data:
//                                     //       """${GlobalLists.newsLettersList[widget.indexIs].detailPageUrl} """,
//                                     //       onLinkTap:(url) {
//                                     //     print("Opening $url...");
//                                     //   },
//                                     // ),
//                                     // Padding(
//                                     //   padding: const EdgeInsets.only(
//                                     //       right: 60, left: 60, top: 20),
//                                     //   child: Image.asset(
//                                     //     "assets/newImages/flowers_footer.png",
//                                     //   ),
//                                     // ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           right: 0, left: 0),
//                                       child: Align(
//                                         alignment: Alignment.topRight,
//                                         child: Image.asset(
//                                           "assets/newImages/flowers_footer.png",
//                                           height: 170,
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Bottomcardlink(),
//                                   ],
//                                 )
//                 ],
//               ),
//             ),

//             // TextSpan(

//             // ),
//           ],
//         ));
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'package:flutter_html/flutter_html.dart';
// // import 'package:merckfoundation22dec/screens/dashboard.dart';
// // import 'package:merckfoundation22dec/utility/GlobalLists.dart';
// // import 'package:merckfoundation22dec/widget/customcolor.dart';
// // import 'package:merckfoundation22dec/widget/innerCustomeAppBar.dart';
// // import 'package:flutter_html/style.dart';
// // import 'package:merckfoundation22dec/widget/showdailog.dart';
// // import 'package:responsive_flutter/responsive_flutter.dart';

// // class Detailpage extends StatefulWidget {
// //   final int indexIs;
// //   final int callfrom;
// //   const Detailpage({Key key, this.indexIs, this.callfrom}) : super(key: key);
// //   @override
// //   State<StatefulWidget> createState() {
// //     return DetailpageState();
// //   }
// // }

// // class DetailpageState extends State<Detailpage> with TickerProviderStateMixin {
// //   AnimationController _controller;
// //   final GlobalKey<State> _keyLoader = new GlobalKey<State>();

// //   @override
// //   void initState() {
// //     super.initState();

// //     _controller = new AnimationController(
// //       vsync: this,
// //       duration: const Duration(milliseconds: 250),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         backgroundColor: Customcolor.background,
// //         appBar: InnerCustomAppBar(
// //           onTapval: () {
// //             Navigator.pop(context);
// //             // Navigator.push(
// //             //     context,
// //             //     MaterialPageRoute(
// //             //         builder: (BuildContext context) => Dashboard(
// //             //               index: 0,
// //             //             )));
// //             // if (widget.callfrom == 1) {
// //             //   Navigator.push(
// //             //       context,
// //             //       MaterialPageRoute(
// //             //           builder: (BuildContext context) => Dashboard(
// //             //                 index: 3,
// //             //               )));
// //             // } else {
// //             //   Navigator.pop(context);
// //             // }
// //           },
// //           index: widget.callfrom == 1 ? 2 : 1,
// //           titleshowingindex: "1",
// //           sharelink: widget.callfrom == 1
// //               ? Constantstring.sharearticledetailpage +
// //                   GlobalLists.newsLettersList[widget.indexIs].detailPageUrl
// //               : "",
// //           title: widget.callfrom == 1
// //               ? GlobalLists.newsLettersList[widget.indexIs].title
// //               : "Articles",
// //           titleImg: "assets/newImages/vision_logo.png",
// //           trallingImg1: "assets/newImages/share.png",
// //           trallingImg2: "assets/newImages/search.png",
// //           height: 85,
// //         ),
// //         floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
// //         body: Stack(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.only(bottom: 1),
// //               child: ListView(
// //                 shrinkWrap: true,
// //                 // crossAxisAlignment: CrossAxisAlignment.center,
// //                 children: [
// //                   widget.callfrom == 1
// //                       ? Padding(
// //                           padding: const EdgeInsets.only(
// //                               left: 15, right: 8, top: 8, bottom: 15),
// //                           child: Column(
// //                             crossAxisAlignment: CrossAxisAlignment.start,
// //                             children: [
// //                               Text(
// //                                 GlobalLists
// //                                     .newsLettersList[widget.indexIs].title,
// //                                 textAlign: TextAlign.start,
// //                                 style: TextStyle(
// //                                   fontSize:
// //                                       ResponsiveFlutter.of(context).fontSize(2),
// //                                   fontWeight: FontWeight.w600,
// //                                   color: Customcolor.colorVoilet,
// //                                 ),
// //                               ),
// //                               Html(
// //                                 data:
// //                                     """${GlobalLists.newsLettersList[widget.indexIs].details} """,
// //                                     onLinkTap:(url) {
// //                                   print("Opening $url...");
// //                                   ShowDialogs.launchURL(url);
// //                                 },
// //                               ),
// //                               SizedBox(
// //                                 height: 15,
// //                               ),
// //                               Html(
// //                                 data:
// //                                     """${GlobalLists.newsLettersList[widget.indexIs].detailPageUrl} """,
// //                                     onLinkTap:(url) {
// //                                   print("Opening $url...");
// //                                   ShowDialogs.launchURL(url);
// //                                 },
// //                               ),
// //                               // Padding(
// //                               //   padding: const EdgeInsets.only(
// //                               //       right: 60, left: 60, top: 20),
// //                               //   child: Image.asset(
// //                               //     "assets/newImages/flowers_footer.png",
// //                               //   ),
// //                               // ),
// //                               // Padding(
// //                               //   padding:
// //                               //       const EdgeInsets.only(right: 0, left: 0),
// //                               //   child: Align(
// //                               //     alignment: Alignment.topRight,
// //                               //     child: Image.asset(
// //                               //       "assets/newImages/flowers_footer.png",
// //                               //       height: 170,
// //                               //     ),
// //                               //   ),
// //                               // ),
// //                               // SizedBox(
// //                               //   height: 10,
// //                               // )
// //                             ],
// //                           ),
// //                         )
// //                       : widget.callfrom == 2
// //                           ? Padding(
// //                               padding: const EdgeInsets.only(
// //                                   left: 8, right: 8, top: 8, bottom: 15),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Html(
// //                                     data:
// //                                         """${GlobalLists.homeceomsglist[widget.indexIs].title} """,
// //                                         onLinkTap:(url) {
// //                                       print("Opening $url...");
// //                                       ShowDialogs.launchURL(url);
// //                                     },
// //                                     style: {
// //                                       "body": Style(
// //                                           textAlign: TextAlign.center,
// //                                           color: Customcolor.colorVoilet,
// //                                           fontSize: FontSize.larger,
// //                                           fontWeight: FontWeight.w600),
// //                                     },
// //                                   ),
// //                                   Html(
// //                                     data:
// //                                         """${GlobalLists.homeceomsglist[widget.indexIs].details} """,
// //                                         onLinkTap:(url) {
// //                                       print("Opening $url...");
// //                                       ShowDialogs.launchURL(url);
// //                                     },
// //                                   ),
// //                                   SizedBox(
// //                                     height: 15,
// //                                   ),

// //                                   // Padding(
// //                                   //   padding: const EdgeInsets.only(
// //                                   //       right: 60, left: 60, top: 20),
// //                                   //   child: Image.asset(
// //                                   //     "assets/newImages/flowers_footer.png",
// //                                   //   ),
// //                                   // ),
// //                                   Padding(
// //                                     padding: const EdgeInsets.only(
// //                                         right: 0, left: 0),
// //                                     child: Align(
// //                                       alignment: Alignment.topRight,
// //                                       child: Image.asset(
// //                                         "assets/newImages/flowers_footer.png",
// //                                         height: 170,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 10,
// //                                   )
// //                                 ],
// //                               ),
// //                             )
// //                           : Padding(
// //                               padding: const EdgeInsets.only(
// //                                   left: 15, right: 8, top: 8, bottom: 15),
// //                               child: Column(
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Html(
// //                                     data:
// //                                         """${GlobalLists.searcharticlelisting[widget.indexIs]['detail_page_url']} """,
// //                                         onLinkTap:(url) {
// //                                       print("Opening $url...");
// //                                       ShowDialogs.launchURL(url);
// //                                     },
// //                                   ),
// //                                   SizedBox(
// //                                     height: 15,
// //                                   ),
// //                                   // Html(
// //                                   //   data:
// //                                   //       """${GlobalLists.newsLettersList[widget.indexIs].detailPageUrl} """,
// //                                   //       onLinkTap:(url) {
// //                                   //     print("Opening $url...");
// //                                   //   },
// //                                   // ),
// //                                   // Padding(
// //                                   //   padding: const EdgeInsets.only(
// //                                   //       right: 60, left: 60, top: 20),
// //                                   //   child: Image.asset(
// //                                   //     "assets/newImages/flowers_footer.png",
// //                                   //   ),
// //                                   // ),
// //                                   Padding(
// //                                     padding: const EdgeInsets.only(
// //                                         right: 0, left: 0),
// //                                     child: Align(
// //                                       alignment: Alignment.topRight,
// //                                       child: Image.asset(
// //                                         "assets/newImages/flowers_footer.png",
// //                                         height: 170,
// //                                       ),
// //                                     ),
// //                                   ),
// //                                   SizedBox(
// //                                     height: 10,
// //                                   )
// //                                 ],
// //                               ),
// //                             )
// //                 ],
// //               ),
// //             ),

// //             // TextSpan(

// //             // ),
// //           ],
// //         ));
// //   }
// // }

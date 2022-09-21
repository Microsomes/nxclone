import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TermsAndConditions extends StatefulWidget {
  @override
  _ApplicationInfoPageState createState() => _ApplicationInfoPageState();
}

class _ApplicationInfoPageState extends State<TermsAndConditions> {
  String applicationIdentifier;
  String accountIdentifier;
  String platformName;
  String deviceModel;
  int buildNumber;


  var options = [
        "## Definitions and descriptions",
        "In these Conditions “the Company” means West Midlands Travel Ltd. (National Express West Midlands and National Express Coventry.",
        "These terms and conditions (the ‘Terms’) will govern the purchase and use of National Express mTickets bought via the National Express West Midlands  mobile ticketing App (the ‘App’) and used on any Company bus service. When downloading and using the App you are also agreeing to be bound by the Terms.",
        "For the purposes of these Terms:",
        "\"we/us/our\" refers to the Company",
        "\"you/your\" refers to the person purchasing tickets or downloading the App.",
        "\"mTicket\" means a paperless ticket that is downloaded onto your mobile phone accepted for travel on the Company’s services.",
        "\"mobile phone\" means a mobile phone – iPhone or android, or any other hand help device running the appropriate software allowing you to download the App and a mTicket.",
        "The Terms may be modified at any time. This will not affect any existing terms accepted by you when making your purchase through the App.",
        "## Use of the App",
        "## We licence you to use:",
        "The App and any updates or supplements to them.",
        "The mTicket purchasing service you connect to via the App and the content we provide to you through it (‘Services) as permitted in the Terms.",
        "## The App",
        "**1.** Once you have downloaded the App you will be able to purchase tickets to travel with the Company. All tickets purchased through the App are subject to our Conditions of Carriage which can be found at [https://nxbus.co.uk/west-midlands/legal/conditions-of-carriage-new](https://nxbus.co.uk/west-midlands/legal/conditions-of-carriage-new)",
        "**2.** The App is licensed to you by the company and Masabi Ltd and may only be used for your own personal use. You must not try to alter, modify or in any way try to copy or transfer the App to any other users.",
        "**3.** You must ensure that your mobile device has the required version of the relevant operating system. You are responsible for all data charges incurred when using the app with your mobile phone provider.",
        "## mTickets",
        "**1.** mTickets are downloaded to your registered mobile device through the App. Tickets are downloaded to your registered mobile device via the internet. An internet connection will be required to activate your tickets. Following purchase, your mTicket cannot be changed and is non-refundable.",
        "**2.** mTickets must be activated prior to you boarding the bus, the ticket displayed on your mobile phone screen must be shown to the bus driver or conductor on the Tram. Please ensure you have sufficient battery charge to show to the driver and for the whole duration of your journey, the Company cannot be held responsible if you have insufficient battery.",
        "**3.** mTickets are available to purchase via your mobile phone using the App. Once you have purchased the mTicket it will be delivered as a mTicket to your mobile phone. mTickets sold on the App are for use on Company services only in the times and in the areas as specified at the time of purchase.",
        "**4.** The price you pay for the mTicket will be valid for the duration stated on the mTicket and any subsequent price changes during the validity of the mTicket will not affect the mTicket you have already purchased.",
        "**5.** mTickets are valid immediately for travel at the time you make your purchase. Please ensure that you wish to travel on the day you purchase the ticket as no refunds will be given.",
        "**6.** Payment for mTickets must be made by credit or debit card. The appropriate payment for the mTicket will be deducted from your bank account at time of purchase once it has been authorised by your bank. Please note we do not store your debit/credit card details.",
        "**7.** Students using an mTicket must show a valid college/university-issued matriculation card, displaying photographic identification and expiry date.",
        "**8.** Please allow time for the App to load whilst waiting for the bus. If you are unable to display the ticket on your phone the full cash fare must be paid. No refund will be given.",
        "**9.** You may be asked to show your mTicket to an Inspector or any member of staff employed by the Company or Police.",
        "**10.** We reserve the right to refuse travel on invalid mTickets or if used on a stolen phone. The mTickets are not transferable and may only be used by the registered phone user, mTickets do not give you priority over other passengers.",
        "## License Restrictions",
        "You agree that you will:",
        "**1.** not rent, lease, sub-license, loan, provide, or otherwise make available, the App or the Services in any form, in whole or in part to any person;",
        "**2.** not copy App or the Services, except as part of the normal use of the App or where it is necessary for the purpose of back-up or operational security;",
        "**3.** not translate, merge, adapt, vary, alter or modify, the whole or any part of the App or the Services nor permit the App or the Services or any part of them to be combined with, or become incorporated in, any other programs, except as necessary to use the App and the Services on devices as permitted in these terms;",
        "**4.** not disassemble, de-compile, reverse engineer or create derivative works based on the whole or any part of the App or the Services nor attempt to do any such things;",
        "## Acceptable use restrictions",
        "You must:",
        "**1.** not use the App or any Service in any unlawful manner, for any unlawful purpose, or in any manner inconsistent with these terms, or act fraudulently or maliciously, for example, by hacking into or inserting malicious code, such as viruses, or harmful data, into the App, any Service or any operating system;",
        "**2.** not infringe our intellectual property rights or those of any third party in relation to your use of, the App or any Service, including by the submission of any material (to the extent that such use is not licensed by these terms);",
        "**3.** not transmit any material that is defamatory, offensive or otherwise objectionable in relation to your use of the App or any Service;",
        "**4.** not use the App or any Service in a way that could damage, disable, overburden, impair or compromise our systems or security or interfere with other users; and",
        "**5.** not collect or harvest any information or data from any Service or our systems or attempt to decipher any transmissions to or from the servers running any Service.",
        "## Intellectual property rights",
        "All intellectual property rights in the App, and the Services throughout the world belong to us and the rights in the App and the Services are licensed (not sold) to you. You have no intellectual property rights in, or to, the App or the Services other than the right to use them in accordance with these terms.",
        "## Our responsibility for loss or damage suffered by you",
        "**1.** We are responsible to you for foreseeable loss and damage caused by us. If we fail to comply with these terms, we are responsible for loss or damage you suffer that is a direct and foreseeable result of our breaking these Terms, but we are not responsible for any loss or damage that is not foreseeable or direct. Loss or damage is foreseeable if either it is obvious that it will happen or if, at the time you accepted these terms, both we and you knew it might happen. For the avoidance of doubt, we will not be liable for any indirect losses or consequential damages of any kind, suffered or incurred by you in connection with either your access to or use of the App or the content on, or in any way resulting from your downloading and/or use (or inability to use) or the App or the Services.",
        "**2.** We do not exclude or limit in any way our liability to you where it would be unlawful to do so. This includes liability for death or personal injury caused by our negligence or the negligence of our employees, agents or subcontractors or for fraud or fraudulent misrepresentation.",
        "**3.** We are not liable for business losses. The App is for domestic and private use. If you use  the App for any commercial, business or resale purpose we will have no liability to you for any loss of profit, loss of business, business interruption, or loss of business opportunity.",
        "**4.** We may end your rights to use the App and the Services if you break these terms.",
        "**5.** We may end your rights to use the App and Services at any time by contacting you if you have broken these Terms. If we end your rights to use the App and Services.",
        "**6.** You must stop all activities authorised by these terms, including your use of the App and any Services.",
        "**7.** You must delete or remove the App from all devices in your possession and immediately destroy all copies of the App which you have and confirm to us that you have done this.",
        "## Legal responsibility",
        "**1.** If you lose your mobile phone with a valid mTicket saved on it, please call our Direct Sales Team on [0121 254 7272](tel:01212547272). Any value remaining on your mTicket will be transferred to you new mobile phone.",
        "**2.** We may cease to operate the service at anytime, the values of any balance associated with unused tickets at that time will be refunded.",
        "## Privacy Notice",
        "About your data",
        "At National Express we are committed to keeping your personal information safe and secure.",
        "When you use the App you trust us with your personal information and we will collect and store that securely.",
        "How do I access my data?",
        "You can access your personal information we hold by filling in our online form or by contacting the Data Protection Officer at [sar.nx@nationalexpress.com](mailto:sar.nx@nationalexpress.com).",
        "[Request your data](https://docs.google.com/forms/d/e/1FAIpQLScoSOLvAxJAp-hbyAeTpRWBhuKJeqFh6WYtSaDauINL1tjnkQ/viewform)",
        "Our Customer and Passenger privacy notice",
        "Our Customer and Passenger privacy notice explains exactly what we collect and how we use it, including your rights under the new Data Protection law changes that come into effect on 25 May 2018.",
        "Who does this privacy notice apply to, and what is it about?",
        "This privacy notice applies to you if you are or were a customer of any of the National Express group companies established in the UK referred to below and/or if you are or were a passenger on any of the passenger transport services arranged or provided by those National Express group companies.",
        "This privacy notice explains what personal data we collect about you and what we do with it via the App. It also explains your rights in respect of your personal data and it informs you what to do if you have any questions or complaints about our use of your personal data.",
        "We take your privacy seriously and are committed to abiding by the relevant data protection laws which protect your privacy.",
        "We reserve the right to modify and change this privacy notice at any time without notice. We encourage our customers to review this privacy notice periodically.  You should check this policy frequently to ensure you are aware of the most recent version that will apply each time you use the App.",
        "Who is controller of your personal data?",
        "The National Express group company established in the United Kingdom that sells or provides you with passenger transport services is the controller of your personal data that is or was processed for the purposes explained in this privacy notice.",
        "This will be that one of the following named National Express UK group companies for the passenger transport services set out opposite its name:",
        "## National Express group company",
        "National Express Limited",
        "## Data controller in relation to passenger transport services",
        "National Express network coach services within the UK and to European destinations",
        "## National Express group company",
        "The Kings Ferry Limited",
        "## Data controller in relation to passenger transport services",
        "Kings Ferry private coach or bus hire and certain commuter coach services in and around the South East of England",
        "## National Express group company",
        "E. Clarke & Son (Coaches) Limited",
        "## Data controller in relation to passenger transport services",
        "Clarkes of London private coach hire",
        "## National Express group company",
        "West Midlands Travel Limited ",
        "## Data controller in relation to passenger transport services",
        "National Express West Midlands bus services in and around the West Midlands and the Black Country",
        "## Data controller in relation to passenger transport services",
        "The data controller’s representative for the purposes of this privacy notice is the National Express UK Data Protection Officer, who can be contacted using the contact details set out at the end of this notice.",
        "What personal data do we collect about you, and how?",
        "We collect the following types of personal data about you:",
        "**•** The email address you used to create an account on the app, the internal application ID, and the internal account ID assigned to you via the App.",
        "**•** Information about mTicket purchased, such as the mTicket ID, type of mTicket, date and time of purchase of the mTicket, and the validity period of the mTicket. ",
        "**•** Payment details, information about the financial transactions, related to the credit or debit cards used for purchases, the email address the purchase receipt was sent to, and information about credit or debit cards saved in the account.",
        "**•** Information about mTicket activations, such as the type of mTicket and the date and time of activation, end of the validity time, or expiration of the mTicket.",
        "**•** Device information: We may also collect information about your device each time you use the App. For example, we may collect information on the type of mobile device that you are using and its unique device identifier (for example, the IMEI number, the device’s mobile phone number, or the MAC address of the device’s wireless network interface), the type of mobile browser that you are using, the mobile operating system that you are using, mobile network information, the time zone setting and insert any other information collected.",
        "We collect this personal data about in a variety of ways, including:",
        "**•** by you creating an account with us on the App;",
        "**•** by you submitting information via the App, for example via the ‘contact us’ links",
        "**•** by you providing information to us when communicating us in any manner, for example when you speak to our representatives in person at travel shops or on-board our passenger carrying vehicles, and when you contact us by letter, email, text message, telephone call or on social media;",
        "**•** by you consenting to receive certain information from us, such as marketing emails and other promotional material about seat sales, offers, exclusive deals and travel ideas;",
        "**•** by you entering our competitions or participating in post journey, market research and other surveys that we organise or conduct;",
        "**•** by you submitting information when registering or using our on-board wifi or entertainment services;",
        "**•** by us making visual and/or audio recordings at our owned or occupied sites, including at our coach and bus stations and on the passenger carrying vehicles used to provide our travel services; and",
        "**•** by us recording telephone conversations with our customer contact centre representatives.",
        "We may receive information about you from third parties, such as companies that market and sell our products and services on our behalf or from any person who has bought our products and services for you or contacted us on your behalf.",
        "What do we do with your personal data, and on what basis?",
        "We use your personal data for the following purposes and reasons and, where those reasons are our legitimate interest, we inform you about what that legitimate interest is:",
        "## What we use your information for",
        "**•** To provide our products and services to you",
        "**•** To provide you with information, advice and guidance about our products and services",
        "**•** To manage our relationship with you, including to respond to any questions you ask and deal with any complaints you make and, on occasion, to ascertain whether you wish to be a brand ambassador for us",
        "**•** To develop our business and develop new and/or better ways of meeting our customers’ needs, including by carrying out market research and consulting with you",
        "**•** To develop our strategy, operational processes and marketing activities",
        "**•** To study how our customers use products and services from us and other third parties",
        "**•** To manage how we work with other companies that provide services to us and our customers",
        "**•** To comply with the laws and regulations that apply to us",
        "**•** To seek to enforce and defend our legal rights",
        "**•** To seek to detect, investigate, prevent and report crime and anti-social behaviour",
        "**•** To seek to protect and promote your health & safety and that of our other customers, staff and third parties",
        "## Our reasons",
        "**•** Fulfilling our legal duty",
        "**•** Fulfilling our contracts with you",
        "**•** Our legitimate interest",
        "## Our legitimate interest",
        "**•** Being efficient about how we fulfil our legal and contractual duties and manage our relationship with you",
        "**•** Keeping our business records up to date",
        "**•** Developing and improving our business",
        "**•** Developing our products and services, and what we charge for them",
        "**•** Developing relationships with business partners, to enhance our product and service offering",
        "**•** Preserving our legal position, seeking to detect and prevent crime and anti-social behaviour and seeking to promote health & safety",
        "## What we use your information for",
        "**•** To market and promote our products and services to you",
        "**•** To inform you about incomplete purchases of our products and services",
        "## Our reasons",
        "**•** Consent",
        "**•** Our legitimate interest",
        "## Our legitimate interest",
        "**•** To inform you about similar products and services to those you have previously bought from us",
        "**•** To assist you in completing your purchase",
        "## What we use your information for",
        "**•** To market and promote third party products and services to you that may be of interest to you",
        "**•** To pass your information to third party sellers where you have asked us to",
        "## Our reasons",
        "**•** Consent",
        "## Our legitimate interest",
        "**•** N/A",
        "## What we use your information for",
        "**•** To administer and manage our website, including troubleshooting and testing",
        "**•** To ensure that our website content is presented in the most effective manner and customised for customers",
        "**•** For data analysis, research, statistical and survey purposes",
        "## Our reasons",
        "**•** Our legitimate interest",
        "**•** Consent (to our use of cookies)",
        "## Our legitimate interest",
        "**•** Providing an efficient and customised means for customers to get information about our products and services",
        "**•** What if we have obtained your consent to use your personal data?",
        "**•** Where we process any of your personal data on the basis of your consent you may withdraw that consent at any time.",
        "## What are our obligations to collect and your obligations to provide personal data?",
        "We have no legal obligation to collect personal data about you but we need to collect some personal data about you in order to provide our products and services to you and to collect payment for these and to deal with any questions or complaints you have about them.",
        "You have no legal obligation to provide your personal data to us, but we may not be able to provide our products and services to you or deal with your questions or complaints if you do not provide us with the information needed for this.",
        "Who will we share your personal data with?",
        "We may share your personal data with:",
        "**•** other companies in the National Express group of companies;",
        "**•** our suppliers, sub-contractors, business partners and our brand ambassadors who help us to provide our products and services to you;",
        "**•** other business partners in connection with the provision of their products and services to you;",
        "**•** our legal and professional advisors;",
        "**•** government bodies and regulatory authorities, including the Driver Vehicle & Standards Agency, the Police and other crime prevention and detection agencies, the UK Border Agency and other immigration authorities and the UK Information Commissioner’s Office;",
        "**•** the Traffic Commissioners, the courts and other dispute resolution arbitrators and mediators, other parties to legal proceedings and passenger transport watchdogs;",
        "**•** analytics and search engine providers that assist us in the improvement and optimisation of our websites; and",
        "**•** other companies that take on any part of our business as a result of a restructure, merger or transfer of that part of our business.",
        "Do we make international transfers of personal data?",
        "Where we transfer your personal data to other National Express Group companies and/or third parties who process your personal data on our behalf in countries outside the EEA that are not deemed to provide a similar level of protection for individuals’ rights in relation to their personal data as in the EEA, we have entered into appropriate contracts with those National Express companies and third parties based on the standard contractual clauses approved by the European Commission, a copy of which can be found here, such that your personal data should be afforded the same level of protection as when it is processed in the EEA.",
        "For how long will we process your personal data?",
        "Where we process your personal data to fulfil a legal obligation, we will process such personal data for so long as necessary to fulfil that obligation.",
        "Where we process your personal data to fulfil a contract with you, we will process such personal data until we fulfil that contract and for so long thereafter as may be necessary to keep a record of that contract, which will typically be for six (6) years, and to deal with any complaints or claims relating to that contract, which will be until the final resolution of such complaints or claims (having regard to the nature of any potential claims and the limitation of liability periods that apply to them).",
        "Where we process your personal data based on our legitimate interest, we will process such personal data for so long as necessary to achieve that legitimate interest, which will typically be for six (6) years after we collect your personal data or the last time we use your personal data (or longer in relation to any legal claims that might arise having regard to the nature of any potential claims and the limitation of liability periods that apply to them).",
        "Please bear in mind that it may take a short time to process any withdrawal of your consent. We aim to do this within 48 hours of receipt of your request, although you may still receive emails that are already in process around the time of your withdrawal.",
        "We may also retain your personal data for longer if we cannot delete it for legal, regulatory or technical reasons.",
        "What rights do you have in relation to your personal data?",
        "You have a number of rights in relation to your personal data. These include the right, subject to exceptions, to:",
        "**•** access your personal data;",
        "**•** request the rectification;",
        "**•** request restrictions on the processing of your personal data; and",
        "**•** object to our processing of your personal data.",
        "Please contact the National Express UK Data Protection Officer if you wish to exercise any of these rights.",
        "You also have the right in some circumstances to receive a copy of your personal data in a portable format. This right is limited to personal data that you have provided to us and is processed on the basis of your contract with us or your consent. It does not cover personal data that we process on other grounds.",
        "Please contact the National Express UK Data Protection Officer to request a portable copy of the data that you have provided and is processed on these bases.",
        "What should you do if you have any questions or complaints?",
        "If you have any questions or complaints about how we process your personal data or otherwise about the matters set out in this privacy notice, you should contact the National Express UK Data Protection Officer at:",
        "Address: Data Protection Officer, National Express, National Express House, Birmingham Coach Station, Mill Lane, Digbeth, Birmingham B5 6DD",
        "Contact us via Email at email address: [data.protection@nationalexpress.com](mailto:data.protection@nationalexpress.com)",
        "You also have the right to complain to the UK Information Commissioner's Office about how we use your personal data. You can do this by contacting them on their helpline: [0303 123 1113](tel:03031231113)."
    ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
              width: double.infinity,
              height: 90,
              color: Color.fromRGBO(168, 28, 25, 1),
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                    left: 0,
                    top: 60,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100,
                        child: Positioned(
                          top: 4,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              SvgPicture.asset(
                                "images/front/back.svg",
                                width: 21,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Text(
                                "Back",
                                style: GoogleFonts.roboto(
                                    fontSize: 16, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  top:60,
                  child: Text("Terms and conditions",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                )
              ])),
             Expanded(
              child: SingleChildScrollView(
                child: AppInfo(
                      options: options,
                    ),
              )
             )
            ],
          ),
        ));
  }
}

class AppInfo extends StatelessWidget {
  const AppInfo({
    Key key,
    @required this.options,
  }) : super(key: key);

  final List options;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
    
          SizedBox(height: 10,),
          for(var i=0;i< options.length;i++)
          Builder(builder: (ctx){
            return Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 30,
                top: 5,
                bottom: 5
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MarkdownBody(data:options[i])
                  // Text(options[i]['label'],
                  // style: GoogleFonts.roboto(
                  //   fontWeight: FontWeight.w800,
                  //   fontSize: 15
                  // ),
                  // ),
                  //   Text(options[i]['val'],
                  // style: GoogleFonts.roboto(
                  //   fontSize: 15
                  // ),
                  // ),
                  // Divider()
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}

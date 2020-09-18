import 'package:flutter/material.dart';

//actual terms page

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context, true);
            },
            child: PreferredSize(
                preferredSize: Size.fromHeight(500),
                child: Image.asset("images/leftarrow.png", width: 4))),
        title: Center(
          child: Text(
            "Terms and conditions",
            style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Text(
            """These terms and conditions apply to online sales of Travelcards by National Express West Midlands, please read through them carefully.
National Express West Midlands is the trading name of West Midlands Travel Limited, registered in England and Wales with company number 02652253, and registered office at 51 Bordesley Green, Birmingham, B9 4BZ.

All Travelcards are issued subject to:

the Conditions of the Travelcard Scheme
the Conditions of Carriage
all additional or special conditions and restrictions relating to a particular Travelcard as set out on any web pages or other notices or publications of National Express West Midlands, including as to the services, dates, days, times, periods and areas for which a Travelcard is valid.
Your Account
As an account holder, once you have registered your details you will be able to purchase tickets for yourself, family or friends. Each ticket purchased will require the details of the person who will use the ticket along with a photograph image for use on the photocard (where required). This can be done by digital upload or by posting a passport sized photograph to us at the address below.

Photocard Students
Student Travelcards can be purchased and used by anyone over the age of 18 years still in full time education and 16-18 year olds who are not eligible for the (n) network 16-18 Photocard.

That is those who or whose parents do not pay Council Tax to one of the 7 Metropolitan Borough Councils that make up the West Midlands County which are, Birmingham, Coventry, Dudley, Sandwell, Solihull, Walsall and Wolverhampton.

Full time study constitutes 12 hours or more a week. You will be asked to confirm your student ID number when buying a ticket.

National Express West Midlands reserve the right to undertake confirmatory checks with the University or College stated within the registration process. National Express West Midlands also reserves the right to refuse to issue Student Travelcards where statements are believed to be untrue.

Student Travelcards can be used on all National Express West Midlands buses all day every day within their specified area during their valid from and to dates, this includes National Express Coventry buses where applicable and Metro where the add-on supplement has been purchased. They are not valid on Night Services or certain Special Services.

The Metro add-on refers to the tram service that operates between Birmingham and Wolverhampton.

Young Persons
Young persons Travelcards are available to anyone between the ages of 5 and 15 (inclusive) and to the holders of network 16-18 Photocards (network conditions apply).

For holders of a 16-18 Photocard the ID number will be required at the time of purchase. Where Transport For West Midlands (TFWM) have not yet issued a 16-18 Photocard then we may at our discretion allow the purchase to take place for a period of time.

National Express West Midlands reserve the right to undertake confirmatory checks regarding entitlement with Transport for West Midlands (TFWM) National Express West Midlands also reserves the right to refuse to issue Young Persons Cards where statements are believed to be untrue.

Delivery
Once you have submitted your order and it has been accepted and processed, your ticket will be despatched by first class mail to the address provided by the account holder. Please allow 3 – 5 working days for delivery. Bank holidays and weekends are classed as non working days.

For security reasons all first class mail may be despatched by Recorded Delivery allowing the item to be tracked via Royal Mail.

If your ticket has not arrived 2 to 3 days before your selected start date please contact us (details below).

Where your order includes the attachment online of your photo image we will endeavour to post your tickets to you to arrive 2 to 3 working days before the start date selected for travel. Postal photograph orders can only be processed once the photograph is received at our offices. UK 1st class standard post should arrive next working day. If you are ordering your Student Travelcard in advance please note that it will only be despatched a few days before they go on sale at our retail outlets.

Please note we do not guarantee the delivery timescales once the Travelcards have been despatched from our offices as we are reliant on Royal Mail.

National Express West Midlands will make every effort to ensure that your order will be handled effectively and efficiently but please check the details of your Travelcard on receipt and report any incorrect details no later than 2 working days after the date you receive your Photocard and/or Travelcard using the contact details provided.

Payment
Your payment details are processed via Protx using their secure processing servers.

Full payment is required at the time of placing you order. Payment security features will be applied to protect card holders details in line with industry standards and those recommended by our merchant services.

Price Changes
National Express West Midlands reserves the right to change the prices of tickets available without notice.

Refunds & Cancellations
Please note that the onus is on you to purchase the correct product.

Any replacements / refunds will be subject to the Conditions of the Travelcard Scheme. Any refund will be calculated from the date the Travelcard is received at our offices less a £5 administration fee and must be applied for in writing to the address provided. If you are unable to do this immediately because of illness, a medical certificate must be included with the Travelcard to cover the period from the date you became ill.

It is your responsibility to return the Travelcard to us at your expense.

Termination
Our termination rights: We reserve the right to terminate the Agreement if you use the service for any purpose that is unlawful or prohibited by these terms and conditions. In addition, we may at any time at our sole discretion terminate or temporarily suspend your access to all or any part of the web site, without cause.

Notification of termination: If we suspend your access to all or any part of our web site or if we terminate the Agreement we will send you notification of our intention via your e-mail address or by letter to the address you provide on the registration page.

Student Care
Should your Student Travelcard be lost or stolen, please contact our Card Systems Department on 0121 254 6322 or via this form. When you call / email please ensure you have your membership number and your crime number (where applicable). You may be asked a few security questions. Replacement cards are issued at the discretion of National Express West Midlands. A charge of £15 is made for a replacement card. Please note Student Care is not available for Summer Specials.

Offers & Marketing
National Express West Midlands may, from time to time, contact the registered holder with offers available through National Express West Midlands.

Your Obligations:
You shall only access our web site for lawful purposes and you shall be responsible for complying with all applicable laws, statutes and regulations in connection with the use of our web site.

Information provided
The information you provide on the registration page must be complete and accurate.

Use of ticket ordering service
You may only use this service to make legitimate purchases of products.

Customer Responsibility
By purchasing a National Express West Midlands Travelcard for yourself or on behalf of any other persons for whom you are responsible, you confirm to us that you are 16 years of age or over and have the legal capacity to enter into this Agreement with us and that all information you provide in respect of your use of the service is true and accurate to the best of your knowledge and belief.

You are responsible for the security of your password and for all the transactions entered into using your password through our service. You confirm that you are the authorised user of the credit or debit card used in this transaction.

Variations
National Express West Midlands reserves the right to vary these terms and conditions on the provision of reasonable notice to the registered holder.

Security
We take security very seriously. This is done both online and offline. We also take advice and liaise with relevant authorities to help reduce and prevent the fraudulent use of credit cards with our business.

We do not store credit / debit card details in any electronic format (online or offline), you will need to enter your credit / debit card details each time an order is made.

Data Privacy
We do not give or share your credit / debit card information to any third party, except for the purposes of processing your payment. The information that you supply is kept confidential.

Thawte Certification
All of our secure transactions are done via our secure server. This has been certified by Thawte. For further details click on the Thawte seal displayed on the payment pages of the web site.

Contact Details
Tickets purchased on this website are sold by National Express West Midlands, Card Systems, 51 Bordesley Green, Birmingham B9 4BZ. The Bus Pass Administration team can be contacted on 0121 254 6322.

Customer complaints or concerns should be sent to Customer Relations, National Express West Midlands, 51 Bordesley Green, Birmingham B9 4BZ.

Data Protection
The Data Protection Act 1998 is designed to protect personal data that is entered and stored on computer and other systems. It lays down standards of accuracy, relevance and care of such data, including how it may be divulged.

Any data about individuals you enter onto our web site directly or include in any message to us will be subject to the Act and you are responsible for its accuracy and relevance and must have the authority to disclose it to us to utilise it for the purposes for which you have provided such information to us.

In the same way, we are committed to protecting personal data and using personal data information fairly and lawfully in accordance with the Data Protection Act.

We will use any personal data you provide (and any personal data we create relative to your account and transactions with us) for the purposes of managing and administering your account, performing your orders for Travelcards, and collecting payments.

We do not use or disclose personal data for direct marketing, unless we get your consent.

This web site may use cookies to monitor IP addresses of guests to access which pages are most popular. These IP addresses are not linked to any personal data so all guests who use our site remain anonymous.

The Data Protection Act gives you the following rights:

You have the right to be told what data we hold about you. We may charge you a fee of £10 to cover our costs in dealing with your request.
You have a right to stop your data being used for direct marketing.
You have the right to stop your data being used, if it is causing genuine substantial distress, which is not justified.
You have the right to ask for the rectification or erasure of any inaccurate information.
          
          
          
          """,
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Faqobj {
  String question;
  String answer;

  Faqobj({@required this.question, @required this.answer});

  String getQuestion() {
    return this.question;
  }

  String getAnswer() {
    return this.answer;
  }
}

class FaqPage extends StatelessWidget {
  List<Faqobj> allQuestions;

  FaqPage() {
    allQuestions = new List<Faqobj>();
    allQuestions.add(new Faqobj(
        question: "Where can i use my mTicket?",
        answer: "You can use your mTicket on any West Midlands services"));
    allQuestions.add(new Faqobj(
        question: "Which mobile phones can i use?",
        answer:
            "iPhone and Android devices are both supported by mTicket App. For iPhone users your operating system needs to be iOS 9.0 or higher and for Android users your operating system needs to be 4.4 or higher."));
    allQuestions.add(new Faqobj(
        question: "Does it matter which mobile network i use?",
        answer: "No, our mTicket App can be used across all mobile networks."));
    allQuestions.add(new Faqobj(
        question: "How do i get my mTicket?",
        answer:
            "Once purchased you will find your tickets in the Ticket Wallet."));
    allQuestions.add(new Faqobj(
        question: "Which mTickets can i purchase?",
        answer:
            "You may purchase adult single tickets, Daysavers, adult weekly and 4 weekly ticket, child tickets, student tickets and group tickets through the app."));
    allQuestions.add(new Faqobj(
        question: "How do i know the price of the mTicket before i purchase?",
        answer:
            "All mTickets prices are clearly visible prior to payment being taken."));
    allQuestions.add(new Faqobj(
        question: "How do i pay for my mTicket?",
        answer:
            "Payment will be taken by debit or credit card at the time of purchase. It is not possible to add the amount to your mobile phone bill."));
    allQuestions.add(new Faqobj(
        question: "Will you store my card details?",
        answer:
            "Only if you choose to. At the end of your purchase you will be given the opportunity to store your card details for quicker future purchases. Those card details are stored securely using non-reversible encryption."));
    allQuestions.add(new Faqobj(
        question: "What if i do not activate or use my mTicket?",
        answer:
            "1 week and 4 week passes are valid immediately after purchase. Single and Daysaver tickets are valid for use within the timespan specified on the ticket. No refunds can be provided."));
    allQuestions.add(new Faqobj(
        question: "What if i buy the wrong mTicket?",
        answer: "Please contact us for assistance."));
    allQuestions.add(new Faqobj(
        question: "Can i purchase in advance?",
        answer:
            " Single tickets can be stored in your ticket waller for up to 90 days. Multi-journey tickets take effect on the date of initial purchase. If more than one multi-journey ticket is purchaserd in a singel transaction, the first one will take effect from the date of purchase, and the rest will remain in your ticket wallet."));
    allQuestions.add(new Faqobj(
        question: "When should i activate my mTicket?",
        answer: "Please activate your ticket just prior to boarding."));
    allQuestions.add(new Faqobj(
        question: "How do i activate my mTicket?",
        answer:
            "Click the Ticket Wallet tab to access your saved tickets, then click to open the ticket you wish to use. Once the ticket has been opened pleasen tap the activation button to activate your ticket."));
    allQuestions.add(new Faqobj(
        question: "How many times can i activater my mTicket?",
        answer:
            "You may activate your mTicket as many times as neccessary during the validity period. Single tickets may only be activated once."));
    allQuestions.add(new Faqobj(
        question: "What do i need to do when i board the bus?",
        answer:
            "You need to ensure you have activated the required ticket and that it is displayed clearly on your screen. For a successfully activated ticket, a series of colors and the time ensue they are valid on that particular day and service. Please show the activation screen to the driver and do not touch the reader."));
    allQuestions.add(new Faqobj(
        question: "What if my phone battery runs out?",
        answer:
            "If you are unable to display your mTicket to the driver or a member of staff on request you will have to pay the driver for the journey and this fare is non-refundable."));
    allQuestions.add(new Faqobj(
        question: "Can more then one customer travel on one mTicket?",
        answer:
            "No, only one person can travel per mTicket with the exception of our GroupSaver which allows for up to five people travelling together."));
    allQuestions.add(new Faqobj(
        question:
            "What happens if i lose my phone, I upgrade my handset or change my phone number?",
        answer:
            "You can transfer your account to the new handset. Download the app on your new handset, enter your details and you will be provided with the opportunity to move your existing wallet to your new device. If this happens more then three times please contact us. Refunds are not available."));
    allQuestions.add(new Faqobj(
        question: "How do i change my credit/debit card details?",
        answer:
            "You may upgrade your credit card details within the app or alternatively you may add a new card."));
    allQuestions.add(new Faqobj(
        question: "I still need some help?",
        answer: "Please contact us if you require any more help"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "FAQ",
              style: TextStyle(color: Color.fromRGBO(189, 156, 106, 1)),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
              itemCount: allQuestions.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Container(
                     child: Column(
                  children: <Widget>[
                    SizedBox(height: 5,),
                    Container(
                       width: 400,
                      child: Text(allQuestions[index].getQuestion(), style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),),
                    ),
                    SizedBox(height: 5,),
                    Text(allQuestions[index].getAnswer(), style: TextStyle(
                      fontSize: 15
                    ),),
                  ],
                ));
              }),
        ));
  }
}

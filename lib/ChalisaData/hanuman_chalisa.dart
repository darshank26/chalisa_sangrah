import 'dart:io';
import 'dart:ui';

List<String> hanuman_chalisa_hindi =
[
"""
श्री गुरु चरन सरोज रज,
निज मनु मुकुर सुधारि।

बरनउं रघुबर विमल जसु,
जो दायकु फल चारि॥

बुद्धिहीन तनु जानिकै,
सुमिरौं पवन-कुमार।

बल बुद्धि विद्या देहु मोहिं,
हरहु कलेश विकार॥

जय हनुमान ज्ञान गुण सागर।
जय कपीस तिहुँ लोक उजागर॥

राम दूत अतुलित बल धामा।
अंजनि-पुत्र पवनसुत नामा॥

महावीर विक्रम बजरंगी।
कुमति निवार सुमति के संगी॥

कंचन बरन बिराज सुवेसा।
कानन कुण्डल कुंचित केसा॥

हाथ वज्र औ ध्वजा बिराजै।
काँधे मूँज जनेऊ साजै॥

शंकर सुवन केसरीनन्दन।
तेज प्रताप महा जग वन्दन॥

विद्यावान गुणी अति चातुर।
राम काज करिबे को आतुर॥

प्रभु चरित्र सुनिबे को रसिया।
राम लखन सीता मन बसिया॥

सूक्ष्म रुप धरि सियहिं दिखावा।
विकट रुप धरि लंक जरावा॥

भीम रुप धरि असुर संहारे।
रामचन्द्र के काज संवारे॥

लाय सजीवन लखन जियाये।
श्रीरघुवीर हरषि उर लाये॥

रघुपति कीन्ही बहुत बड़ाई।
तुम मम प्रिय भरतहि सम भाई॥

सहस बदन तुम्हरो यश गावैं।
अस कहि श्री पति कंठ लगावैं॥

सनकादिक ब्रह्मादि मुनीसा।
नारद सारद सहित अहीसा॥

जम कुबेर दिकपाल जहां ते।
कवि कोबिद कहि सके कहां ते॥

तुम उपकार सुग्रीवहिं कीन्हा।
राम मिलाय राज पद दीन्हा॥

तुम्हरो मन्त्र विभीषन माना।
लंकेश्वर भये सब जग जाना॥

जुग सहस्त्र योजन पर भानू ।
लील्यो ताहि मधुर फ़ल जानू॥

प्रभु मुद्रिका मेलि मुख माहीं।
जलधि लांघि गए अचरज नाहीं॥

दुर्गम काज जगत के जेते।
सुगम अनुग्रह तुम्हरे तेते॥

राम दुआरे तुम रखवारे।
होत न आज्ञा बिनु पैसारे॥

सब सुख लहै तुम्हारी सरना।
तुम रक्षक काहू को डरना॥

आपन तेज सम्हारो आपै।
तीनों लोक हांक तें कांपै॥

भूत पिशाच निकट नहिं आवै।
महावीर जब नाम सुनावै॥

नासै रोग हरै सब पीरा।
जपत निरंतर हनुमत बीरा॥

संकट ते हनुमान छुड़ावै।
मन क्रम वचन ध्यान जो लावै॥

सब पर राम तपस्वी राजा।
तिन के काज सकल तुम साजा॥

और मनोरथ जो कोई लावै।
सोइ अमित जीवन फ़ल पावै॥

चारों जुग परताप तुम्हारा।
है परसिद्ध जगत उजियारा॥

साधु सन्त के तुम रखवारे।
असुर निकन्दन राम दुलारे॥

अष्ट सिद्धि नवनिधि के दाता।
अस बर दीन जानकी माता॥

राम रसायन तुम्हरे पासा।
सदा रहो रघुपति के दासा॥

तुम्हरे भजन राम को पावै।
जनम जनम के दुख बिसरावै॥

अन्तकाल रघुबर पुर जाई।
जहाँ जन्म हरि-भक्त कहाई॥

और देवता चित्त न धरई।
हनुमत सेई सर्व सुख करई॥

संकट कटै मिटै सब पीरा।
जो सुमिरै हनुमत बलबीरा॥

जय जय जय हनुमान गोसाई।
कृपा करहु गुरुदेव की नाई॥

जो शत बार पाठ कर सोई।
छूटहिं बंदि महा सुख होई॥

जो यह पढ़ै हनुमान चालीसा।
होय सिद्धि साखी गौरीसा॥

तुलसीदास सदा हरि चेरा।
कीजै नाथ ह्रदय महँ डेरा॥

पवनतनय संकट हरन,
मंगल मूरति रुप।

राम लखन सीता सहित,
ह्रदय बसहु सुर भूप॥ """
];

List<String> hanuman_chalisa_english =
[
 """
 Shri Guru Charan Saroj Raj,
 Nij manu Mukuru Sudhaari।

Barnau Raghubar Bimal Jasu,
Jo Daayeku Phal Chaari॥

Buddhiheen Tanu Jaanike,
Sumirau Pavan-Kumaar।

Bal Buddhi Bidya Dehu Mohi,
Harahu Kales Bikaar॥

Jai Hanuman Gyaan Gun Sagar।
Jai Kapis Teehun Lok Ujagar॥

Ram Doot Atulit Bal Dhama।
Anjani-Putra Pavansut Nama॥

Mahabir Bikram Bajrangi।
Kumati Nivaar Sumati Ke Sangi॥

Kanchan Baran Biraaj Subesa।
Kaanan Kundal Kunchit Kesa॥

Haath Bajra Aau Dhwaja Biraaje।
Kaandhe Moonj Janeu Saaje॥

Sankar Suvan Kesarinandan।
Tej Prataap Maha Jag Bandan॥

Bidyabaan Guni Ati Chaatur।
Ram Kaaj Karibe Ko Aatur॥

Prabhu Charitra Sunibe Ko Rasiya।
Ram Lakhan Sita Man Basiya॥

Sukshma Roop Dhari Siyahin Dikhawa।
Bikat Roop Dhari Lanka Jarawa॥

Bheem Roop Dhari Asur Sanhaare।
Ramchandra Ke Kaaj Sanwaare॥

Laaye Sajivan Lakhan Jiyaaye।
Shri Raghubeer Harashi Ur Laaye॥

Raghupati Keenhi Bahut Badai।
Tum Mum Priy Bharat Hi Sam Bhai॥

Sahas Badan Tumhro Jas Gaavein।
As Kahi Shripati Kanth Lagavein॥

Sankadik Bramhadi Munisa।
Narad Sarad Sahit Ahisa॥

Jam Kuber Digpaal Jahan Te।
Kabi Kobid Kahi Sake Kahaan Te॥

Tum Upkaar Sugreevhin Kinha।
Ram Milaaye Raajpad Dinha॥

Tumhro Mantra Vibhishan Maana।
Lankeswar Bhaye Sab Jag Jana॥

Jug Sahastra Jojan Par Bhaanu।
Lilyo Taahi Madhur Phal Jaanu॥

Prabhu Mudrika Meli Mukh Maahi।
Jaldhi Laanghi Gaye Achraj Naahi॥

Durgam Kaaj Jagat Ke Jete।
Sugam Anugraha Tumhre Tete॥

Ram Dooare Tum Rakhwaare।
Hoat Na Aagya Binu Paisare॥

Sab Sukh Lahai Tumhari Sarna।
Tum Rakhshak Kaahu Ko Darna॥

Aapan Tej Samharo Aapai।
Teeno Lok Haank Te Kaanpen॥

Bhoot Pisaach Nikat Nahi Aave।
Mahabir Jab Naam Sunave॥

Naasai Rog Harai Sab Peera।
Japat Nirantar Hanumat Beera॥

Sankat Te Hanuman Chhoodave।
Man Krama Bachan Dhyaan Jo Laave॥

Sab Par Raam Tapasvi Raja।
Tin Ke Kaaj Sakal Tum Saaja॥

Aur Manorath Jo Koi Laave।
Soi Amit Jivan Phal Paave॥

Chaaro Jug Partaap Tumhara।
Hai Parsiddh Jagat Ujiyara॥

Saadhu Sant Ke Tum Rakhwaare।
Asur Nikandan Ram Dulaare॥

Asht Siddhi Nau Nidhi Ke Daata।
As bar Deen Janki Maata॥

Ram Rasayan Tumhre Paasa।
Sada Raho Raghupati Ke Daasa॥

Tumhre Bhajan Ram Ko Paave।
Janam Janam Ke Dukh Bisraave॥

Antakaal Raghubar Pur Jaayee।
Jahan Janam Hari-Bhakt Kahayee॥

Aur Devta Chitt Na Dharayi।
Hanumat Sei Sarb Sukh Karayi॥

Sankat Kate Mite Sab Peera।
Jo Sumirai Hanumat Balbira॥

Jai Jai Jai Hanuman Gosaai।
Kripa Karahun Gurudev Ki Naai॥

Jo Sat Baar Paath Kar Koi।
Chhootahin Bandi Maha sukh Hoyi॥

Jo Yeh Padhe Hanuman Chalisa।
Hoye Siddhi Saakhi Gaurisa॥

Tulsidas Sada Harichera।
Kije Naath Hridaya Mahn Dera॥

Pavantanaye Sankat Haran,
Mangal Moorti Roop।

Ram Lakhan Sita Sahit,
Hridaya Basahu Soor Bhoop॥
"""
];


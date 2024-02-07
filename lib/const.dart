import 'package:flutter/material.dart';

Color backgroundColor = Color(0xff0E172A);
Color purpleColor = Color(0xff8B5CF6);
Color iconColor = Color(0xffE3A008);
Color orangeCustomColor = Color(0xffFF5A1F);
Color lightGreyColor = Color(0xff475569);
Color middleGreyColor = Color(0xff172033);
Color dullPurpleColor = Color(0xff5A41A4);
Color animationGreyColor = Color(0xff191B38);
Color lightPurpleColor = Color(0xff3F3276);
var citiesList = <String>[
  "Şehiri Seç",
  "Adana",
  "Adıyaman",
  "Afyonkarahisar",
  "Ağrı",
  "Aksaray",
  "Amasya",
  " Ankara",
  "  Antalya",
  " Artvin",
  "Aydın",
  "Balıkesir",
  "Bartın",
  "Batman",
  "Bayburt",
  "Bilecik",
  "  Bingöl",
  "    Bitlis",
  "Bolu",
  "  Burdur",
  "   Bursa",
  " Çanakkale",
  " Çankırı",
  "   Çorum",
  "Denizli",
  "   Diyarbakır",
  " Edirne",
  "   Elazığ",
  "Erzincan",
  "  Erzurum",
  "Eskişehir",
  "Gaziantep",
  "    Giresun",
  "Gümüşhane",
  "Hakkari",
  "Hatay",
  "Isparta",
  " İçel",
  "İstanbul",
  "İzmir",
  "Kars",
  "Kastamonu",
  "Kayseri",
  "Kırklareli",
  "Kırşehir",
  "Kocaeli",
  "Konya",
  "Kütahya",
  "Malatya",
  "Manisa",
  "Mardin",
  "Mersin",
  "Muğla",
  "Muş",
  "Nevşehir",
  "Niğde",
  "Ordu",
  "Osmaniye",
  "Rize",
  "Sakarya",
  "Samsun",
  "Siirt",
  "Sinop",
  "Sivas",
  "Şanlıurfa",
  "Şırnak",
  "Tekirdağ",
  "Tokat",
  "Trabzon",
  "Tunceli",
  "Uşak",
  "Van",
  "Yozgat",
  "Zonguldak",

  // Add more locations as needed
];
String token =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozMTIsIm5hbWUiOiJIYXNzaW1pb3UgbmlhbmUiLCJ1c2VybmFtZSI6Ik5pYW5lIiwicm9sZSI6IldvcmtlciIsImVtYWlsIjoibmVuZW5hbmUyQGdtYWlsLmNvbSIsImNvbnRhY3QiOiI1NTQxNTI0NDAzIiwiY2l0eSI6IkHEn3LEsSIsInBhc3N3b3JkIjoiJDJiJDEwJHpTcHFwa1dWdDZxd0dFQUFYbHBMbHVxeU9nSDhxZlYxSzJNcmtJcnRHb215S3dTOGV1MGdLIiwicmVzZXRfdG9rZW4iOiIxMDAzMzcyMCIsImVtYWlsVmVyaWZpZWQiOm51bGwsInRva2VuIjoiOTkxMiIsImV4cGlyZXNfYXQiOiIxNzA0ODEzODAwNTcyIiwiaW1hZ2UiOiJodHRwczovL2FiY2J1bC5jb20vaW1nL2RlZmF1bHQud2VicCIsInNob3J0X2JpbyI6bnVsbCwiZmlyc3Rfam9iX2RhdGUiOm51bGwsInRyaWFsX2VuZF9kYXRlIjpudWxsLCJzdWJzY3JpcHRpb25fZGF0ZSI6bnVsbCwic3Vic2NyaXB0aW9uX2VuZF9kYXRlIjpudWxsLCJpZF9udW1iZXIiOiI5OTk4MDMyNjgwNCIsImxhc3RfbG9naW4iOm51bGwsImNhcmRfdG9rZW4iOm51bGwsInN0YXR1cyI6ZmFsc2UsInN0YXJzIjowLCJwcm9qZWN0X2NvbXBsZXRlZCI6MCwiY3JlYXRlZF9hdCI6IjIwMjMtMTItMTlUMTc6MjA6NTIuMDAwWiIsInVwZGF0ZWRfYXQiOiIyMDIzLTEyLTE5VDE3OjIwOjUyLjAwMFoifSwiaWF0IjoxNzA1MDgzNzI2LCJleHAiOjE3MDUxNzAxMjZ9.J9saWYN4JTtxMetBPm1khP1vQnismOEgvW8xZC3YWH8';
// const String baseUrl = 'https://abcbul.com';
const String baseUrl = 'https://test.abcbul.com';
Map<String, String> headers = {
  'Content-Type': 'application/json',
  'Cookie':
      '__Host-next-auth.csrf-token=216f69d3c3d5d581b844b536b1287a166b024508b1156dfc5caf91dc3c8f62a3%7C52a9888bea5eb459f7cc97282578a1cb95badc5a0f30ccaf4f0dca8fe1816b61; session=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjozMjYsIm5hbWUiOiJoYXNoaW0gYWRtaW4iLCJ1c2VybmFtZSI6InRlc3QzIiwicm9sZSI6IkNsaWVudCIsImVtYWlsIjoidGVzdDNAYWRtaW4uY29tIiwiY29udGFjdCI6bnVsbCwiY2l0eSI6ImRhbGFiYSIsInBhc3N3b3JkIjoiJDJiJDEwJHQ3TDQ3ZC5wQVVEbkIuQ2kuRm40bGU3dEZCVWloZWpMaExVQzJJOWxoQTdJY0cxSG1yd2xxIiwicmVzZXRfdG9rZW4iOiIxMDA0NTAzMyIsImVtYWlsVmVyaWZpZWQiOm51bGwsInRva2VuIjoiNjA3OCIsImV4cGlyZXNfYXQiOiIxNzA0OTgzMDQzNDgwIiwiaW1hZ2UiOiJodHRwczovL2FiY2J1bC5jb20vaW1nL2RlZmF1bHQud2VicCIsInNob3J0X2JpbyI6bnVsbCwiZmlyc3Rfam9iX2RhdGUiOm51bGwsInRyaWFsX2VuZF9kYXRlIjpudWxsLCJzdWJzY3JpcHRpb25fZGF0ZSI6bnVsbCwic3Vic2NyaXB0aW9uX2VuZF9kYXRlIjpudWxsLCJpZF9udW1iZXIiOm51bGwsImxhc3RfbG9naW4iOm51bGwsImNhcmRfdG9rZW4iOm51bGwsInN0YXR1cyI6ZmFsc2UsInN0YXJzIjowLCJwcm9qZWN0X2NvbXBsZXRlZCI6MCwiY3JlYXRlZF9hdCI6IjIwMjQtMDEtMTFUMTM6MjQ6MDMuMDAwWiIsInVwZGF0ZWRfYXQiOiIyMDI0LTAxLTExVDEzOjI0OjA1LjAwMFoifSwiaWF0IjoxNzA0OTc5NzA5LCJleHAiOjE3MDUwNjYxMDl9.vGttUhS04b65tzjxcYmpENYfh5aeNdiygJugbBXshDc'
};

String termsAndConditionsString =
    'ABCBUL Kullanıcı Sözleşmesi ("Sözleşme"), ABCBUL hizmetlerini kullanacak olan tüm bireyler ve kurumlar ("Kullanıcılar") arasında anlaşma sağlamak üzere düzenlenmiştir. ABCBUL hizmetlerini kullanarak, aşağıda belirtilen şartları ve koşulları kabul etmiş olursunuz. Bu sözleşmeyi dikkatlice okuyunuz. ABCBUL hizmetlerini kullanmaya başlamadan önce bu şartlar ve koşulları anladığınızdan emin olunuz.Hizmet KapsamıABCBUL, kullanıcılara hizmet sağlama ve alımını kolaylaştırmak amacıyla çeşitli platformlar ve araçlar sunmaktadır. Kullanıcılar, bu hizmetlerden yararlanırken bu şartlara uymayı taahhüt ederler; ABCBUL hizmetlerini yasalara uygun bir şekilde kullanmak, ABCBUL\'un kullanım kurallarına ve politikalarına uymak.Gizlilik PolitikasıABCBUL\'un gizlilik politikasını incelemek için lütfen gizlilik politikası sayfasını ziyaret ediniz.DeğişikliklerABCBUL, bu sözleşmede herhangi bir zamanda değişiklik yapma hakkını saklı tutar. Değişiklikler yapıldığında, güncellenmiş sözleşme ABCBUL platformları üzerinden erişilebilir olacaktır. ABCBUL Kullanıcı Sözleşmesi\'nin tam metnini okumak için lütfen buraya tıklayınız.';

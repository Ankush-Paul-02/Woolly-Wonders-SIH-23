import 'package:sih23/src/features/home/price/price_screen.dart';
import 'package:sih23/src/features/home/production/wool_production_screen.dart';
import 'package:sih23/src/features/home/test/screens/fourth_screen.dart';
import 'package:sih23/src/features/home/trends/trend_screen.dart';
import 'package:sih23/src/features/onBoarding/screens/screen_three.dart';
import 'package:sih23/src/features/onBoarding/screens/screen_two.dart';

import '../../features/onBoarding/screens/screen_one.dart';

class AppConstants {
  static const onboarding1 = 'assets/onb1.jpg';
  static const onboarding2 = 'assets/onb2.png';
  static const onboarding3 = 'assets/onb3.png';
  static const india = 'assets/India.png';
  static const trend = 'assets/trend.png';
  static const news = 'assets/news.png';
  static const rupee = 'assets/rupee.png';
  static const test = 'assets/test.png';
  static const language = 'assets/language.png';
  static const search = 'assets/search.png';
  static const menu = 'assets/menu1.png';
  static const home = 'assets/home.png';
  static const darkMode = 'assets/dark_mode.png';
  static const avatarDefault = 'assets/farmer.png';
  static const quality = 'assets/quality.png';
  static const procedure = 'assets/procedure.png';
  static const visit = 'assets/visit.png';
  static const add = 'assets/plus.png';

  final onBoardingScreens = [
    const ScreenOne(),
    const ScreenTwo(),
    const ScreenThree(),
  ];

  final tabScreens = [
    const WoolProductionScreen(),
    const TrendScreen(),
    const PriceScreen(),
    const WoolList(),
  ];

  static const newsApiKey = 'b513bc8a5ddf4f97977ea2225f3ffb08';
  static const newsApiUrl = 'https://newsapi.org/v2/everything';
  static const newsQuery = 'textile industry';

  Map<String, String> imageMapping = {
    'India': AppConstants.india,
    // 'Rajasthan': AppConstants.rajasthan,
    // 'Jammu & Kashmir': AppConstants.jammuKashmir,
    // 'Uttar Pradesh': AppConstants.uttarPradesh,
    // 'Gujarat': AppConstants.gujarat,
    // 'Madhya Pradesh': AppConstants.madhyaPradesh,
  };

  final List<Map<String, String>> woolSellers = [
    {
      'name': 'Samir Kumar',
      'image':
          'https://img.freepik.com/premium-photo/mature-indian-farmer-harvesting-cotton-wool-field-plantation_151355-21585.jpg'
    },
    {
      'name': 'Arjun Yadav',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRgMHAAWGh4RzDVxg5C6I1ut_qYV9jjl1Rlw&usqp=CAU'
    },
    {
      'name': 'Harish Kumar',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSS1pawu6mtvfrCvVdaqIWYcCo2dajrlfk_Qg&usqp=CAU'
    },
    {
      'name': 'Ajay Tiwari',
      'image':
          'https://static.vecteezy.com/system/resources/thumbnails/030/352/210/small/farmer-smile-in-farm-ai-generated-free-photo.jpg'
    },
    {
      'name': 'Rajesh Verma',
      'image':
          'https://media.istockphoto.com/id/652550482/photo/portrait-of-buffalo-shepherd.jpg?s=612x612&w=0&k=20&c=Rir8MHClROhkO9JhQ62BaBBtk7gf5Tv2eEltLApJWks='
    },
    {
      'name': 'Deepa Mishra',
      'image':
          'https://static.vecteezy.com/system/resources/thumbnails/000/865/660/small/smiling-farmer-with-livestock-in-background-rural-china-shanxi-province.jpg'
    },
    {
      'name': 'Som Khamaru',
      'image':
          'https://t4.ftcdn.net/jpg/04/70/86/43/360_F_470864353_0MeEv89YuSCLyl1IFRjhjcvIjLGVivn8.jpg'
    },
    {
      'name': 'Ram Das',
      'image':
          'https://static.toiimg.com/thumb/msid-70781679,width-400,resizemode-4/70781679.jpg'
    },
    {
      'name': 'Vikas Roy',
      'image': 'https://aif.org/wp-content/uploads/2020/08/desi-oon-141.jpg'
    },
    {
      'name': 'Meenal Sau',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3JNRwqYFd5r_VWPwI9TYn6VeCLPj_IOUDoQ&usqp=CAU'
    },
    {
      'name': 'Harpit Kaur',
      'image':
          'https://img.freepik.com/premium-photo/portrait-farmer-against-backdrop-his-fields_132358-15248.jpg'
    },
    {
      'name': 'Mohan Patel',
      'image':
          'https://www.hindustantimes.com/ht-img/img/2023/02/26/1600x900/Himachal-Pradesh-State-Wool-Federation-provides-a-_1677433188609.jpg'
    },
    {
      'name': 'Unus Rai',
      'image':
          'https://thumbs.dreamstime.com/b/sheep-shearing-kinnaur-kinauri-herder-shears-woolen-fleece-his-slopes-himalaya-mountains-bhaba-39325697.jpg'
    },
    {
      'name': 'Soumen Narayan',
      'image':
          'https://images.squarespace-cdn.com/content/v1/629f4cd312f5ad0b40dd2c3e/1668620874822-LGG6WQPFKGHBV24ZO64N/unsplash-image-1NRJxv4BJAU.jpg'
    },
    {
      'name': 'Abu Hasan',
      'image':
          'https://cdn.nazmiyalantiquerugs.com/wp-content/uploads/2009/12/tribal-herder-shearing-sheep.jpg'
    },
    {
      'name': 'Deep Verma',
      'image':
          'https://assets.thehansindia.com/h-upload/2023/03/31/1344404-cottonm.webp'
    },
    {
      'name': 'Gurudas Roy ',
      'image':
          'https://www.shutterstock.com/shutterstock/videos/1094934525/thumb/1.jpg?ip=x480'
    },
  ];

  final List<Map<String, String>> trendWools = [
    {
      'name': 'Merino Wool',
      'image': 'https://m.media-amazon.com/images/I/81FJ49VS7bL.jpg',
      'price': 'Rs1,853'
    },
    {
      'name': 'Lambswool',
      'image':
          'https://m.media-amazon.com/images/I/41Hl-O6woGL._AC_UF1000,1000_QL80_.jpg',
      'price': 'Rs1,351'
    },
    {
      'name': 'Angora Wool',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8qhFjPWC8hBP8OlVgIHW7gqYXUxdLHDekr4Lcl7PlTv6CFEmiCtnQetztsCOe3XjVQ_Q&usqp=CAU',
      'price': 'Rs1,548'
    },
    {
      'name': 'Alpaca Wool',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Alpaca_fleece.JPG/1200px-Alpaca_fleece.JPG',
      'price': 'Rs520'
    },
    {
      'name': 'Mohair',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/a/a0/Ull_mohair.jpg',
      'price': 'Rs700'
    },
    {
      'name': 'Shetland Wool',
      'image': 'https://foulawool.co.uk/images/shetlandyarn4.jpg',
      'price': 'Rs1,741'
    },
    {
      'name': 'Cormo Wool',
      'image':
          'https://cdn.shoplightspeed.com/shops/618969/files/16645847/1024x1024x1/stone-wool-cormo-karst.jpg',
      'price': 'Rs2,147'
    },
    {
      'name': 'Corriedale Wool',
      'image':
          'https://paradisefibers.com/cdn/shop/products/corriedale-cross-wool-top-1-lb-special.jpg?v=1657748971',
      'price': 'Rs2,143'
    },
    {
      'name': 'Romney Wool',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKCGxmvU5nEohkKkJRpGflcC7nGnJr55xVu74rGZlC6PwcDwkTQll_GnTsIMFuVgx9xgk&usqp=CAU',
      'price': 'Rs1,160'
    },
    {
      'name': 'Polwarth Wool',
      'image': 'https://www.yarnundyed.eu/acatalog/dk-polwarth-pack.jpg',
      'price': 'Rs687'
    },
    {
      'name': 'Rambouillet Wool',
      'image':
          'https://paradisefibers.com/cdn/shop/products/rambouillete.jpg?v=1586307764',
      'price': 'Rs580'
    },
    {
      'name': 'Targhee Wool',
      'image':
          'https://afibercollective.com/cdn/shop/files/IMG_1944-2.jpg?v=1683566025&width=1946',
      'price': 'Rs752'
    },
    {
      'name': 'Cheviot Wool',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFxYcbM9VTUMdT0DmV6OQjarkfC9T2vXrlj3DlFH4wuztvWUdP97tb6WCErp1RERR06AY&usqp=CAU',
      'price': 'Rs1,460'
    },
    {
      'name': 'Texel Wool',
      'image':
          'https://www.texelseproducten.nl/media/catalog/product/cache/2b7915f25e7f0a1ba375ded5cb258336/g/e/gekaarde_wol_texelaar_texel_schapenwol_vilten.jpg',
      'price': 'Rs700'
    },
    {
      'name': 'Dorset Wool',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHAEd88pxZcZTVGBR4ToHWfn3_2rJg1T-0zw&usqp=CAU',
      'price': 'Rs909'
    },
    {
      'name': 'Icelandic Wool',
      'image':
          'https://images.squarespace-cdn.com/content/v1/51b0de1ce4b0964f232d4a91/1510780060173-IRPCEK02MA3AH9CZPVKS/Rove+Handmade',
      'price': 'Rs7031'
    },
    {
      'name': 'Gotland Wool',
      'image':
          'https://i0.wp.com/waltin.se/josefinwaltinspinner/wp-content/uploads/2019/03/IMG_6545-2.jpg?resize=2000%2C1200&ssl=1',
      'price': 'Rs1,718'
    },
    {
      'name': 'Jacob Wool',
      'image':
          'https://images.squarespace-cdn.com/content/v1/5bbe3ef64d8711bbc7170a14/1601271735720-L5N44NVIUDP9E3IQKAXR/DSC_7454.jpg?format=750w',
      'price': 'Rs1288'
    },
    {
      'name': 'Perendale Wool',
      'image':
          'https://perendale.org/wp-content/uploads/2020/02/Viola-lamb-fleece-1-1024x768.jpg',
      'price': 'Rs2491'
    },
    {
      'name': 'Wensleydale Wool',
      'image':
          'https://i.etsystatic.com/11902728/r/il/8c8299/4367129459/il_794xN.4367129459_1vv8.jpg',
      'price': 'Rs1799'
    },
    {
      'name': 'Border Leicester Wool',
      'image':
          'https://sallyridgway.com.au/cdn/shop/products/white-australian-border-leicester-wool-topABP_2.jpg?v=1668168025&width=713',
      'price': 'Rs2,147'
    },
    {
      'name': 'Teeswater Wool',
      'image': 'https://www.teeswaterwools.co.uk/images/IMG_1445a.jpg',
      'price': 'Rs872'
    },
    {
      'name': 'Navajo-Churro Wool',
      'image':
          'https://shop-arriola-sunshine-farm.myshopify.com/cdn/shop/collections/Comp_1_Roving_11Nov2021_1370x.jpg?v=1638038136',
      'price': 'Rs2,175'
    },
    {
      'name': 'Columbia Wool',
      'image':
          'https://www.datocms-assets.com/75073/1674240636-columbia-sheep-header.jpg?w=1600&fm=jpg',
      'price': 'Rs2,792'
    },
    {
      'name': 'Ryeland Wool',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPATDCRytpn3AMCm1WM-9v28W71_2fuucOuw&usqp=CAU',
      'price': 'Rs871'
    },
    {
      'name': 'Falkland Wool',
      'image':
          'https://www.fibrehut.co.uk/cdn/shop/products/falkland_wool_top.jpg?v=1624700879&width=600',
      'price': 'Rs1374'
    },
    {
      'name': 'Cotswold Wool',
      'image':
          'http://www.nistockfarms.com/images/page/428e8a2087cdc4cc41b0b8713ba5a97b.jpeg',
      'price': 'Rs1030'
    },
    {
      'name': 'Herdwick Wool',
      'image':
          'https://i.etsystatic.com/17073635/r/il/58360c/4822384874/il_600x600.4822384874_brfb.jpg',
      'price': 'Rs2725'
    },
    {
      'name': 'Manx Loaghtan Wool',
      'image':
          'https://www.fibrehut.co.uk/cdn/shop/products/manx_c980119e-ee78-4695-9b15-0231c602ad01.jpg?v=1624700943&width=600',
      'price': 'Rs1635'
    },
    {
      'name': 'Suffolk Wool',
      'image':
          'https://www.worldofwool.co.uk/cdn/shop/products/wow-natural-wool-top-grey-suffolk-top-20942411527.jpg?v=1650702113&width=2000',
      'price': 'Rs4,186'
    },
    {
      'name': 'Southdown Wool',
      'image':
          'https://i.etsystatic.com/17073635/r/il/ade181/3275521747/il_794xN.3275521747_55br.jpg',
      'price': 'Rs2421'
    },
    {
      'name': 'Black Welsh Mountain Wool',
      'image':
          'https://paradisefibers.com/cdn/shop/products/paradise-fibers-black-welsh-spinning-fiber_720x@2x.jpg?v=1584826260',
      'price': 'Rs1962'
    },
    {
      'name': 'Clun Forest Wool',
      'image':
          'https://images.squarespace-cdn.com/content/v1/5f624133a4b74a0c0f092ab7/1600708895406-EXBJ3JLAWFEPBTTW85O4/Natural+Roving.jpg',
      'price': 'Rs2068'
    },
    {
      'name': 'Shropshire Wool',
      'image':
          'https://www.flockofages.co.uk/wp-content/uploads/2020/11/shropshire-wool-2.jpg',
      'price': 'Rs1630'
    },
    {
      'name': 'Karakul Wool',
      'image': 'https://www.rarebreeds.co.nz/fibrekarakul3.jpg',
      'price': 'Rs914'
    },
    {
      'name': 'Dohne Merino Wool',
      'image':
          'https://dohnes.com.au/wp-content/uploads/2021/08/Paul-Renae-Neilson-Wool.png',
      'price': 'Rs2157'
    },
    {
      'name': 'Santa Cruz Wool',
      'image':
          'https://independentstitch.typepad.com/.a/6a00d8341c6c7753ef0120a58a4cf1970b-800wi',
      'price': 'Rs637'
    },
    {
      'name': 'Valais Blacknose Wool',
      'image': 'https://www.rarebreeds.co.nz/fibrevalais7.jpg',
      'price': 'Rs424'
    },
    {
      'name': 'Ile de France Wool',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2bqwMol2EFFotLaiAZ7QYM9vbU-ydw8-EcQ&usqp=CAU',
      'price': 'Rs1744'
    },
  ];
}

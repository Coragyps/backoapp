import 'package:backoapp/screens/screens.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const titles = ["Início", "Cáterin y Decoración", "Mobiliario y Alquiler", "Entretenimiento y Servicio"];
const menuitems = {
  ["Favoritos", "Productos para mas Adelante"],
  ["Mi Carrito", "Tus Articulos Deseados"],
  ["Opciones", "Ajustes de la Cuenta"],
  ["Online", "Revisa nuestro Sitio Web"]
};
const options = ["BUSCAR"];
const mainheadings = {
  ["Mas Popular", "Descubre los articulos mas adqueridos y encuentra nuevas ideas", "Explora Nuevos", "No importa que tan grande sea la fiesta, siempre encontraras diferentes opciones de proveedores para atender tus necesidades de catering."],
  ["Mas Popular", "Descubre los articulos mas adqueridos y encuentra nuevas ideas", "Explora Nuevos", "¿Buscas mesas mas grandes? ¿Se necesita mas sillas para los invitados? Encuentra todo tipo de muebles, toldos y publicaciones de locales."],
  ["Mas Popular", "Descubre los articulos mas adqueridos y encuentra nuevas ideas", "Explora Nuevos", "¡Siempre llega la hora loca! Explora todo tipo de servicios de entretenimiento y atencion. Consigue un show tematico para todas las edades."],
};
const navbarStyle = TextStyle(fontFamily: 'TempusSansITC', fontWeight: FontWeight.w800, color: Colors.white,);
const titleStyle = TextStyle(fontWeight: FontWeight.w800, color: secondaryColor, fontSize: 25);
const subtitleStyle = TextStyle(fontWeight: FontWeight.w400, color: secondaryColor, fontSize: 12, height: 1);
const nameStyle = TextStyle(fontWeight: FontWeight.w600, color: fadedColor, fontSize: 12,height: 1.35);
const strongStyle = TextStyle(fontWeight: FontWeight.w800, color: secondaryColor, fontSize: 17, height: 1);
const priceStyle= TextStyle(fontWeight: FontWeight.w400, color: secondaryColor, fontSize: 12.5, height: 1.4);
const ratingStyle = TextStyle(fontWeight: FontWeight.w800, color: selectedColor, fontSize: 14, height: 1);
const mainColor = Color.fromRGBO(234, 233, 235, 1);
const fadedColor = Color.fromRGBO(165, 148, 158, 1);
const secondaryColor = Color.fromRGBO(42, 18, 54, 1);
const selectedColor = Color.fromRGBO(118, 8, 53, 1);

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int navbarindex = 2;
  final screenwidgets = [
    const HomeScreen(),
    const FeedScreen(type: 0),
    const FeedScreen(type: 1),
    const FeedScreen(type: 2),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.white,), // Customize the icon here
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text(titles[navbarindex],style: navbarStyle.copyWith(fontSize: 16),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [selectedColor, secondaryColor,],
          )),
        ),
      ),
      drawer: Drawer(
        backgroundColor: mainColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/login.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/face.png',
                      width: size.width * 0.15,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      "BACKO",
                      style: TextStyle(
                        fontFamily: 'TempusSansITC',
                        letterSpacing: 5,
                        fontSize: 25 ,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.favorite, color: secondaryColor,),
              title: Text(menuitems.elementAt(0)[0], style: navbarStyle.copyWith(fontSize: 18,color: selectedColor),),
              subtitle: Text(menuitems.elementAt(0)[1], style: priceStyle.copyWith(fontSize: 13),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.shopping_bag, color: secondaryColor,),
              title: Text(menuitems.elementAt(1)[0], style: navbarStyle.copyWith(fontSize: 18, color: selectedColor),),
              subtitle: Text(menuitems.elementAt(1)[1], style: priceStyle.copyWith(fontSize: 13,),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.settings, color: secondaryColor,),
              title: Text(menuitems.elementAt(2)[0], style: navbarStyle.copyWith(fontSize: 18, color: selectedColor),),
              subtitle: Text(menuitems.elementAt(2)[1], style: priceStyle.copyWith(fontSize: 13),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: const Icon(Icons.wine_bar, color: secondaryColor,),
              title: Text(menuitems.elementAt(3)[0], style: navbarStyle.copyWith(fontSize: 18, color: selectedColor),),
              subtitle: Text(menuitems.elementAt(3)[1], style: priceStyle.copyWith(fontSize: 13),),
              onTap: () async {
                final Uri url = Uri.parse('https://sites.google.com/view/backo-peru/inicio');
                if (!await launchUrl(url)) {
                      throw Exception('No se pudo acceder al Enlace');
                }
              },
            ),
          ],
        ),
      ),
      body: screenwidgets[navbarindex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: mainColor,
        height: 75.0,
        index: navbarindex,
        buttonBackgroundColor: selectedColor,
        color: secondaryColor,
        animationDuration: const Duration(milliseconds: 300),
        items: const [
          Icon(Icons.home_outlined, size: 25),
          Icon(Icons.cake_outlined, size: 25),
          Icon(Icons.chair_outlined, size: 25),
          Icon(Icons.mood, size: 25),
        ],
        onTap: (index) {
          setState(() {
            navbarindex = index;
          });
        },
      ),
    );
  }
}
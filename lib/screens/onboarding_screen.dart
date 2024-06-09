import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/img/login.jpg",
            fit: BoxFit.cover,
            height: size.height,
            width: size.width,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/img/face.png',
                    width: size.width * 0.5,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("BACKO",
                      style: TextStyle(
                          fontFamily: 'TempusSansITC',
                          fontWeight: FontWeight.w200,
                          letterSpacing: 5,
                          fontSize: 35,
                          color: Colors.white)),
                  const SizedBox(
                    height: 160,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, "menuScreen");
                      },
                      child: Container(
                        height: size.height * 0.05,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0, // Set border color to white
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "INICIAR SESION",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "¿No tienes una cuenta?", style: TextStyle(fontSize: 12,),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "searchScreen");
                        },
                        child: const Text(
                          "Registrarme",
                          style: TextStyle(
                            shadows: [Shadow(color: Colors.white, offset: Offset(0, -2))],
                            color: Colors.transparent,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            decorationThickness: 2,
                            fontSize: 12,
                          ),
                        )
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
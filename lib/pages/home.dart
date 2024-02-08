import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late dynamic routeData = {};
  @override
  Widget build(BuildContext context) {
    routeData = (routeData != null && routeData.isNotEmpty)
        ? routeData
        : ModalRoute.of(context)!.settings.arguments;

    final bgImg =
        routeData['isDayTime'] ? 'assets/day.png' : 'assets/night.png';
    Color bgColor = routeData['isDayTime'] ? Colors.blue : Colors.indigo[700]!;

    return Scaffold(
        backgroundColor: bgColor,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(bgImg), fit: BoxFit.cover),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 140.0, 0, 0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton.icon(
                          icon: const Icon(Icons.location_pin,
                              color: Colors.white),
                          label: const Text(
                            'Edit Locaiton',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            final result = await Navigator.pushNamed(
                                context, '/choose_location');
                            if (!mounted) return;
                            setState(() {
                              routeData = result;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20.0,
                              child: Image.asset('assets/${routeData['flag']}'),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              routeData['location'],
                              style: const TextStyle(
                                  fontSize: 30.0, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          routeData['time'],
                          style: const TextStyle(
                              fontSize: 50.0, color: Colors.white),
                        ),
                      ])),
            ],
          ),
        ));
  }
}

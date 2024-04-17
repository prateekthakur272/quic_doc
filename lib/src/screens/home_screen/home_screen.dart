import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quic_doc/src/constants/widgets.dart';
import 'package:quic_doc/src/extensions/build_context_extension.dart';
import 'package:quic_doc/src/screens/home_screen/widgets/doctor_categories.dart';
import 'package:quic_doc/src/screens/home_screen/widgets/main_nav_bar.dart';
import 'package:quic_doc/src/screens/home_screen/widgets/my_appointments.dart';
import 'package:quic_doc/src/screens/home_screen/widgets/nearby_doctors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 88,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                context.localizations.welcome,
                style: context.textTheme.bodyMedium,
              ),
              space4,
              Text(
                'Prateek Thakur',
                style: context.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_pin,
                    color: context.colorScheme.secondary,
                  ),
                  space4,
                  Text(
                    'Indore, India',
                    style: context.textTheme.bodyMedium!
                        .copyWith(color: context.colorScheme.secondary),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.expand_more))
                ],
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                style: IconButton.styleFrom(
                    backgroundColor: context.colorScheme.background),
                icon: const Icon(Icons.notifications_outlined)),
            space8,
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: context.colorScheme.background,
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: const Icon(FontAwesomeIcons.userDoctor),
                    suffixIcon: Container(
                      margin: const EdgeInsets.all(4),
                      child: IconButton(
                        style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: context.colorScheme.onSurface,
                            foregroundColor: context.colorScheme.surface),
                        icon: const Icon(Icons.filter_alt_outlined),
                        onPressed: () {},
                      ),
                    ),
                    hintText: context.localizations.searchDoctor),
              ),
            ),
          )),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          DoctorCategories(),
          space16,
          MyAppointments(),
          space16,
          NearbyDoctors()
        ]),
      ),
      bottomNavigationBar: const MainNavBar(),
    );
  }
}

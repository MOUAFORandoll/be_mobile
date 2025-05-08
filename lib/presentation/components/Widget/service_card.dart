import 'package:BabanaExpress/presentation/_commons/theming/app_theme.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  ServiceCard({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: ThemeApp.white,
        margin: EdgeInsets.zero,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              color: Theme.of(context).primaryColor.withOpacity(0.1)),
        ),
        child: Container(
          width: 190,
          height: 164,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeApp.second,
                    ),
                    child: Icon(
                      icon,
                      size: 40,
                      color: ThemeApp.white,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      child: Text(
                        title,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 16),
                      ),
                    ),
                    Icon(Icons.arrow_forward, size: 28),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

final designSize = 414.0; 
final kMarginX = 8.0;
final kMarginY = 8.0;

final kPaddingTop = 10;
final kPaddingBottom = 10;
final kPaddingLeft = 10;
final kPaddingRight = 10;
final kPaddingX = 10;
final kPaddingY = 10;

final kTitle = 16.0;
final kDescription = 8.0;
final kBasics = 16.0;
final kMin = 8.0;
final kLgText = kTitle;

final kSmIcon = 28.0;
final kMdIcon = 30.0;
final kLgIcon = 32.0;
final kXlIcon = 34.0;

getWidth(context) {
  MediaQueryData queryData;
  queryData = MediaQuery.of(context);

  return queryData.size.width;
}

getHeight(context) {
  MediaQueryData queryData;
  queryData = MediaQuery.of(context);

  return queryData.size.height;
}

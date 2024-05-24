import 'package:BabanaExpress/presentation/components/exportcomponent.dart';

final designSize = 414.0;
final kMarginBottom = 10;
final kMarginLeft = 10;
final kMarginRight = 10;
final kMarginX = 12.0;
final kMarginY = 10.0;

final kPaddingTop = 10;
final kPaddingBottom = 10;
final kPaddingLeft = 10;
final kPaddingRight = 10;
final kPaddingX = 10;
final kPaddingY = 10;

final kTitle = 17.0;
final kDescription = 10.0;
final kBasics = 14.0;
final kMin = 7.0;
final kLgText = kTitle;

final kSmIcon = 28.0;
final kMdIcon = 30.0;
final kLgIcon = 32.0;
final kXlIcon = 34.0;

getWith(context) {
  MediaQueryData queryData;
  queryData = MediaQuery.of(context);

  return queryData.size.width;
}

getHeight(context) {
  MediaQueryData queryData;
  queryData = MediaQuery.of(context);

  return queryData.size.height;
}

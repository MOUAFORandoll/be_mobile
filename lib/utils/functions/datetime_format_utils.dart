import 'package:BabanaExpress/utils/functions/formatData.dart';
import 'package:intl/intl.dart';

class FormatDateTime {
  String dateToMonth(value) {
    var dateTime = DateFormat('yyyy-MM-dd').parse(value.toString());
    return DateFormat('MMM').format(dateTime);
  }

  String dateToDay(value) {
    var dateTime = DateFormat('yyyy-MM-dd').parse(value.toString());
    return DateFormat('d').format(dateTime);
  }

  String dateToYear(value) {
    var dateTime = DateFormat('yyyy-MM-dd').parse(value.toString());
    return DateFormat('yyyy').format(dateTime);
  }

  String dateToSimpleDate(value) {
    DateTime dateTime = DateTime.parse(value);

    DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');
    String formattedDate = formatter.format(dateTime);
    return formattedDate.toString().split(' ')[0] +
        ' ' +
        'a' +
        ' ' +
        formattedDate.toString().split(' ')[1];
  }

  String dateToStringNew(value) {
    DateFormat inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    DateTime dateTime = inputFormat.parse(value);
    DateFormat outputFormat = DateFormat('E dd MMM yyyy HH:mm', 'fr_FR');

    // DateFormat outputFormat = DateFormat('E dd MMMM yy HH:mm', 'fr_FR');
    String outputDateString = outputFormat.format(dateTime);
    String dateFinal = outputDateString.replaceAll(RegExp(r'\.'), '');

    
    return FormatData().capitalizeFirstLetter(dateFinal);
  }

  String dateToSimpleDateCurrent() {
    DateTime dateTime = DateTime.now();

    DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');
    String formattedDate = formatter.format(dateTime);
    return formattedDate.toString().split(' ')[0] +
        ' ' +
        'a' +
        ' ' +
        formattedDate.toString().split(' ')[1];
  }

  String formatTime(value) {
    final dateTime = DateTime.parse(value);
    final format = DateFormat('HH:mm');
    final clockString = format.format(dateTime);
    return clockString;
  }
}

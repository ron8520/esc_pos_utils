import 'dart:convert';
import 'dart:core';
import 'package:gbk_codec/gbk_codec.dart';
import 'enums.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'dart:typed_data';

class LabelCmd {
  // List<int> command;
  List<int> command = [];
  static final DEBUG_TAG = "LabelCommand";

  LabelCmd([int? width, int? height, int? gap]) {
    // this.command = new List.filled(4096, 2048, growable: true);
    this.addSize(width, height);
    this.addGap(gap);
  }

  // constructor(int width, int height, int gap) {
  // this.command = Vector(4096, 1024);
  // this.addSize(width, height);
  // this.addGap(gap);
  // }

  clrCommand() {
    this.command.clear();
  }

  void _addStrToCommand(var str) {
    List<int> bs = [];
    if (str != "") {
      try {
        bs = gbk_bytes.encode(str);
        // bs = str.toByteArray(charset("GB2312"));
      } catch (unsupportedEncodingException, stacktrace) {
        print("#### StackTrace");
        print("$stacktrace");
      }

      // for (var i in bs) {
      //   this.command.add(bs[i]);
      // }
      this.command += bs;
    }
  }

  void addGap(int? gap) {
    var str = "GAP ${gap} mm,0 mm\r\n";
    this._addStrToCommand(str);
  }

  void addSize(int? width, int? height) {
    var str = "SIZE ${width} mm,${height} mm\r\n";
    this._addStrToCommand(str);
  }

  void addCashdrwer(Foot m, int t1, int t2) {
    var str = "CASHDRAWER " +
        m.value.toString() +
        "," +
        t1.toString() +
        "," +
        t2.toString() +
        "\r\n";
    this._addStrToCommand(str);
  }

  void addOffset(int offset) {
    var str = "OFFSET ${offset} mm\r\n";
    this._addStrToCommand(str);
  }

  void addSpeed(Speed speed) {
    var str = "SPEED " + speed.toString() + "\r\n";
    this._addStrToCommand(str);
  }

  void addDensity(Density density) {
    var str = "DENSITY " + density.toString() + "\r\n";
    this._addStrToCommand(str);
  }

  void addDirection(Direction direction, Mirror mirror) {
    var str = "DIRECTION " +
        direction.value.toString() +
        ','.toString() +
        mirror.value.toString() +
        "\r\n";
    this._addStrToCommand(str);
  }

  void addReference(int x, int y) {
    var str = "REFERENCE ${x},${y}\r\n";
    this._addStrToCommand(str);
  }

  void addShift(int shift) {
    var str = "SHIFT ${shift}\r\n";
    this._addStrToCommand(str);
  }

  void addCls() {
    var str = "CLS\r\n";
    this._addStrToCommand(str);
  }

  void addFeed(int dot) {
    var str = "FEED ${dot}\r\n";
    this._addStrToCommand(str);
  }

  void addBackFeed(int dot) {
    var str = "BACKFEED ${dot}\r\n";
    this._addStrToCommand(str);
  }

  void addFormFeed() {
    var str = "FORMFEED\r\n";
    this._addStrToCommand(str);
  }

  void addHome() {
    var str = "HOME\r\n";
    this._addStrToCommand(str);
  }

  void addPrint(int m, [int? n]) {
    var str = "PRINT ${m},${n}\r\n";
    this._addStrToCommand(str);
  }

  // void addPrint(int m) {
  //   String str = "PRINT $m\r\n";
  //   this._addStrToCommand(str);
  // }

  void addCodePage(Codepage page) {
    var str = "CODEPAGE " + page.value.toString() + "\r\n";
    this._addStrToCommand(str);
  }

  void addSound(int level, int interval) {
    var str = "SOUND ${level},${interval}\r\n";
    this._addStrToCommand(str);
  }

  void addLimitFeed(int n) {
    var str = "LIMITFEED ${n}\r\n";
    this._addStrToCommand(str);
  }

  void addSelfTest() {
    var str = "SELFTEST\r\n";
    this._addStrToCommand(str);
  }

  void addBar(int x, int y, int width, int height) {
    var str = "BAR ${x},${y},${width},${height}\r\n";
    this._addStrToCommand(str);
  }

  void addText(int x, int y, FontType font, Rotation rotation, Fontmul Xscal,
      Fontmul Yscal, String text) {
    String str = "TEXT ${x},${y}," +
        "\"" +
        font.code +
        "\"," +
        "${rotation.value},${Xscal.value},${Yscal.value}" +
        ",\"" +
        text +
        "\"" +
        "\r\n";
    this._addStrToCommand(str);
  }

  void add1DBarcode(int x, int y, BarCodeType type, int height,
      Readabel readable, Rotation rotation, var content,
      {int narrow = 2, int width = 2}) {
    // var narrow = 2;
    // var width = 2;
    var str = "BARCODE " +
        x.toString() +
        "," +
        y.toString() +
        "," +
        "\"" +
        type.code +
        "\"" +
        "," +
        height.toString() +
        "," +
        readable.value.toString() +
        "," +
        rotation.value.toString() +
        "," +
        narrow.toString() +
        "," +
        width.toString() +
        "," +
        "\"" +
        content +
        "\"" +
        "\r\n";
    this._addStrToCommand(str);
  }

  // void add1DBarcode(int x, int y, BARCODETYPE type, int height, READABEL readable,
  //     ROTATION rotation, int narrow, int width, String content) {
  //   String str = "BARCODE " + x.toString() + "," + y.toString() + "," + "\"" +
  //       type.value + "\"" + "," + height.toString() + "," + readable.value +
  //       "," + rotation.value + "," + narrow.toString() + "," + width.toString()
  //       + "," + "\"" + content + "\"" + "\r\n";
  //   this._addStrToCommand(str);
  // }

  void addBox(int x, int y, int xend, int yend, int thickness) {
    var str = "BOX ${x},${y},${xend},${yend},${thickness}\r\n";
    this._addStrToCommand(str);
  }

//    fun addBitmap(x: Int, y: Int, mode: BITMAP_MODE, nWidth: Int, b: Bitmap?) {
//        if (b != null) {
//            var width = (nWidth + 7) / 8 * 8
//            var height = b.height * width / b.width
//            Log.d("BMP", "bmp.getWidth() " + b.width)
//            val grayBitmap = GpUtils.toGrayscale(b)
//            val rszBitmap = GpUtils.resizeImage(grayBitmap, width, height)
//            val src = GpUtils.bitmapToBWPix(rszBitmap)
//            height = src.size / width
//            width /= 8
//            val str = "BITMAP " + x + "," + y + "," + width + "," + height + "," + mode.value + ","
//            this.addStrToCommand(str)
//            val codecontent = GpUtils.pixToLabelCmd(src)
//
//            for (k in codecontent.indices) {
//                this.command!!.add(java.lang.Byte.valueOf(codecontent[k]))
//            }
//
//            Log.d("LabelCommand", "codecontent$codecontent")
//          }
//
//    }

  void addErase(int x, int y, int xwidth, int yheight) {
    var str = "ERASE ${x},${y},${xwidth},${yheight}\r\n";
    this._addStrToCommand(str);
  }

  void addReverse(int x, int y, int xwidth, int yheight) {
    var str = "REVERSE ${x},${y},${xwidth},${yheight}\r\n";
    this._addStrToCommand(str);
  }

  void addQRCode(
      int x, int y, EEC level, int cellwidth, Rotation rotation, var data) {
    var str = "QRCODE " +
        x.toString() +
        "," +
        y.toString() +
        "," +
        level.code +
        "," +
        cellwidth.toString() +
        "," +
        'A'.toString() +
        "," +
        rotation.value.toString() +
        "," +
        "\"" +
        data +
        "\"" +
        "\r\n";
    this._addStrToCommand(str);
  }

  void addQueryPrinterType() {
    var str = "~!T\r\n";
    this._addStrToCommand(str);
  }

  void addQueryPrinterStatus() {
    this.command.add(27);
    this.command.add(33);
    this.command.add(63);
  }

  void addResetPrinter() {
    this.command.add(27);
    this.command.add(33);
    this.command.add(82);
  }

  void addQueryPrinterLife() {
    var str = "~!@\r\n";
    this._addStrToCommand(str);
  }

  void addQueryPrinterMemory() {
    var str = "~!A\r\n";
    this._addStrToCommand(str);
  }

  void addQueryPrinterFile() {
    var str = "~!F\r\n";
    this._addStrToCommand(str);
  }

  void addQueryPrinterCodePage() {
    var str = "~!I\r\n";
    this._addStrToCommand(str);
  }

  void setQueryPrinterStatus() {
    var str = "SET RESPONSE ON\r\n";
    this._addStrToCommand(str);
  }

//    fun addPeel(enable: EscCommand.ENABLE) {
//        var str = String()
//        if (enable.getValue() === 0) {
//            str = "SET PEEL " + enable.getValue() + "\r\n"
//        }
//
//        this.addStrToCommand(str)
//    }
//
//    fun addTear(enable: EscCommand.ENABLE) {
//        String()
//        val str = "SET TEAR " + enable.getValue() + "\r\n"
//        this.addStrToCommand(str)
//    }
//
//    fun addCutter(enable: EscCommand.ENABLE) {
//        String()
//        val str = "SET CUTTER " + enable.getValue() + "\r\n"
//        this.addStrToCommand(str)
//    }
//
//    fun addCutterBatch() {
//        val str = "SET CUTTER BATCH\r\n"
//        this.addStrToCommand(str)
//    }
//
//    fun addCutterPieces(number: Short) {
//        val str = "SET CUTTER $number\r\n"
//        this.addStrToCommand(str)
//    }
//
//    fun addReprint(enable: EscCommand.ENABLE) {
//        String()
//        val str = "SET REPRINT " + enable.getValue() + "\r\n"
//        this.addStrToCommand(str)
//    }
//
//    fun addPrintKey(enable: EscCommand.ENABLE) {
//        String()
//        val str = "SET PRINTKEY " + enable.getValue() + "\r\n"
//        this.addStrToCommand(str)
//    }
//
//    fun addPrintKey(m: Int) {
//        String()
//        val str = "SET PRINTKEY $m\r\n"
//        this.addStrToCommand(str)
//    }
//
//    fun addPartialCutter(enable: EscCommand.ENABLE) {
//        String()
//        val str = "SET PARTIAL_CUTTER " + enable.getValue() + "\r\n"
//        this.addStrToCommand(str)
//    }

  void addUserCommand(var command) {
    this._addStrToCommand(command);
  }
}

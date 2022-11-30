/*
 * esc_pos_utils
 * Created by Andrey U.
 * 
 * Copyright (c) 2019-2020. All rights reserved.
 * See LICENSE for distribution and usage details.
 */

import 'package:esc_pos_utils/esc_pos_utils.dart';

enum PosAlign { left, center, right }

enum PosCutMode { full, partial }

enum PosFontType { fontA, fontB }

enum PosDrawer { pin2, pin5 }

enum TscText { header, text }

/// Choose image printing function
/// bitImageRaster: GS v 0 (obsolete)
/// graphics: GS ( L
enum PosImageFn { bitImageRaster, graphics }

class PosTextSize {
  const PosTextSize._internal(this.value);
  final int value;
  static const size1 = PosTextSize._internal(1);
  static const size2 = PosTextSize._internal(2);
  static const size3 = PosTextSize._internal(3);
  static const size4 = PosTextSize._internal(4);
  static const size5 = PosTextSize._internal(5);
  static const size6 = PosTextSize._internal(6);
  static const size7 = PosTextSize._internal(7);
  static const size8 = PosTextSize._internal(8);

  static int decSize(PosTextSize height, PosTextSize width) =>
      16 * (width.value - 1) + (height.value - 1);
}

class PaperSize {
  const PaperSize._internal(this.value);
  final int value;
  static const mm58 = PaperSize._internal(1);
  static const mm80 = PaperSize._internal(2);

  int get width => value == PaperSize.mm58.value ? 372 : 558;
}

class PosBeepDuration {
  const PosBeepDuration._internal(this.value);
  final int value;
  static const beep50ms = PosBeepDuration._internal(1);
  static const beep100ms = PosBeepDuration._internal(2);
  static const beep150ms = PosBeepDuration._internal(3);
  static const beep200ms = PosBeepDuration._internal(4);
  static const beep250ms = PosBeepDuration._internal(5);
  static const beep300ms = PosBeepDuration._internal(6);
  static const beep350ms = PosBeepDuration._internal(7);
  static const beep400ms = PosBeepDuration._internal(8);
  static const beep450ms = PosBeepDuration._internal(9);
}

// ------ TSC commands Enum class start ------
class BarCodeType {
  const BarCodeType._internal(this.value);
  final int value;
  static const CODE128 = BarCodeType._internal(1);
  static const CODE128M = BarCodeType._internal(2);
  static const EAN128 = BarCodeType._internal(3);
  static const ITF25 = BarCodeType._internal(4);
  static const ITF25C = BarCodeType._internal(5);
  static const CODE39 = BarCodeType._internal(6);
  static const CODE39C = BarCodeType._internal(7);
  static const CODE39S = BarCodeType._internal(8);
  static const CODE93 = BarCodeType._internal(9);
  static const EAN13 = BarCodeType._internal(10);
  static const EAN13_2 = BarCodeType._internal(11);
  static const EAN13_5 = BarCodeType._internal(12);
  static const EAN8 = BarCodeType._internal(13);
  static const EAN8_2 = BarCodeType._internal(14);
  static const EAN8_5 = BarCodeType._internal(15);
  static const CODABAR = BarCodeType._internal(16);
  static const POST = BarCodeType._internal(17);
  static const UPCA = BarCodeType._internal(18);
  static const UPCA_2 = BarCodeType._internal(19);
  static const UPCA_5 = BarCodeType._internal(20);
  static const UPCE = BarCodeType._internal(21);
  static const UPCE_2 = BarCodeType._internal(22);
  static const UPCE_5 = BarCodeType._internal(23);
  static const CPOST = BarCodeType._internal(24);
  static const MSI = BarCodeType._internal(25);
  static const MSIC = BarCodeType._internal(26);
  static const PLESSEY = BarCodeType._internal(27);
  static const ITF14 = BarCodeType._internal(28);
  static const EAN14 = BarCodeType._internal(29);

  String get code {
    if (value == BarCodeType.CODE128.value) {
      return "128";
    } else if (value == BarCodeType.CODE128M.value) {
      return "128M";
    } else if (value == BarCodeType.EAN128.value) {
      return "EAN128";
    } else if (value == BarCodeType.ITF25.value) {
      return "25";
    } else if (value == BarCodeType.ITF25C.value) {
      return "25C";
    } else if (value == BarCodeType.CODE39.value) {
      return "39";
    } else if (value == BarCodeType.CODE39C.value) {
      return "39C";
    } else if (value == BarCodeType.CODE39S.value) {
      return "39S";
    } else if (value == BarCodeType.CODE93.value) {
      return "93";
    } else if (value == BarCodeType.EAN13.value) {
      return "EAN13";
    } else if (value == BarCodeType.EAN13_2.value) {
      return "EAN13+2";
    } else if (value == BarCodeType.EAN13_5.value) {
      return "EAN13+5";
    } else if (value == BarCodeType.EAN8.value) {
      return "EAN8";
    } else if (value == BarCodeType.EAN8_2.value) {
      return "EAN8+2";
    } else if (value == BarCodeType.EAN8_5.value) {
      return "EAN8+5";
    } else if (value == BarCodeType.CODABAR.value) {
      return "CODA";
    } else if (value == BarCodeType.POST.value) {
      return "POST";
    } else if (value == BarCodeType.UPCA.value) {
      return "UPCA";
    } else if (value == BarCodeType.UPCA_2.value) {
      return "UPCA+2";
    } else if (value == BarCodeType.UPCA_5.value) {
      return "UPCA+5";
    } else if (value == BarCodeType.UPCE.value) {
      return "UPCE13";
    } else if (value == BarCodeType.UPCE_2.value) {
      return "UPCE13+2";
    } else if (value == BarCodeType.UPCE_5.value) {
      return "UPCE13+5";
    } else if (value == BarCodeType.CPOST.value) {
      return "CPOST";
    } else if (value == BarCodeType.MSI.value) {
      return "MSI";
    } else if (value == BarCodeType.MSIC.value) {
      return "MSIC";
    } else if (value == BarCodeType.PLESSEY.value) {
      return "PLESSEY";
    } else if (value == BarCodeType.ITF14.value) {
      return "ITF14";
    } else if (value == BarCodeType.EAN14.value) {
      return "EAN14";
    } else {
      return 'Unknown';
    }
  }
}

class BitMap {
  const BitMap._internal(this.value);
  final int value;
  static const overwrite = PaperSize._internal(0);
  static const or = PaperSize._internal(1);
  static const xor = PaperSize._internal(2);
}

class Codepage {
  const Codepage._internal(this.value);
  final int value;
  static const PC437 = Codepage._internal(437);
  static const PC850 = Codepage._internal(850);
  static const PC852 = Codepage._internal(852);
  static const PC860 = Codepage._internal(860);
  static const PC863 = Codepage._internal(863);
  static const PC865 = Codepage._internal(865);
  static const WPC1250 = Codepage._internal(1250);
  static const WPC1252 = Codepage._internal(1252);
  static const WPC1253 = Codepage._internal(1253);
  static const WPC1254 = Codepage._internal(1254);
}

class Density {
  const Density._internal(this.value);
  final int value;
  static const DNESITY0 = Density._internal(0);
  static const DNESITY1 = Density._internal(1);
  static const DNESITY2 = Density._internal(2);
  static const DNESITY3 = Density._internal(3);
  static const DNESITY4 = Density._internal(4);
  static const DNESITY5 = Density._internal(5);
  static const DNESITY6 = Density._internal(6);
  static const DNESITY7 = Density._internal(7);
  static const DNESITY8 = Density._internal(8);
  static const DNESITY9 = Density._internal(9);
  static const DNESITY10 = Density._internal(10);
  static const DNESITY11 = Density._internal(11);
  static const DNESITY12 = Density._internal(12);
  static const DNESITY13 = Density._internal(13);
  static const DNESITY14 = Density._internal(14);
  static const DNESITY15 = Density._internal(15);
}

class Direction {
  const Direction._internal(this.value);
  final int value;
  static const forward = Direction._internal(0);
  static const backward = Direction._internal(1);
}

class EEC {
  const EEC._internal(this.value);
  final int value;
  static const LEVEL_L = EEC._internal(1);
  static const LEVEL_M = EEC._internal(2);
  static const LEVEL_Q = EEC._internal(3);
  static const LEVEL_H = EEC._internal(4);

  String get code {
    if (value == EEC.LEVEL_L.value) {
      return "L";
    } else if (value == EEC.LEVEL_M.value) {
      return "M";
    } else if (value == EEC.LEVEL_Q.value) {
      return "Q";
    } else if (value == EEC.LEVEL_H) {
      return "H";
    } else {
      return "Unknown";
    }
  }
}

class Fontmul {
  const Fontmul._internal(this.value);
  final int value;
  static const MUL_1 = Fontmul._internal(1);
  static const MUL_2 = Fontmul._internal(2);
  static const MUL_3 = Fontmul._internal(3);
  static const MUL_4 = Fontmul._internal(4);
  static const MUL_5 = Fontmul._internal(5);
  static const MUL_6 = Fontmul._internal(6);
  static const MUL_7 = Fontmul._internal(7);
  static const MUL_8 = Fontmul._internal(8);
  static const MUL_9 = Fontmul._internal(9);
  static const MUL_10 = Fontmul._internal(10);
}

class FontType {
  const FontType._internal(this.value);
  final int value;
  static const FONT_1 = FontType._internal(1);
  static const FONT_2 = FontType._internal(2);
  static const FONT_3 = FontType._internal(3);
  static const FONT_4 = FontType._internal(4);
  static const FONT_5 = FontType._internal(5);
  static const FONT_6 = FontType._internal(6);
  static const FONT_7 = FontType._internal(7);
  static const FONT_8 = FontType._internal(8);
  static const SIMPLIFIED_CHINESE = FontType._internal(9);
  static const TRADITIONAL_CHINESE = FontType._internal(10);
  static const KOREAN = FontType._internal(11);

  String get code {
    if (value == FontType.FONT_1.value) {
      return "1";
    } else if (value == FontType.FONT_2.value) {
      return "2";
    } else if (value == FontType.FONT_3.value) {
      return "3";
    } else if (value == FontType.FONT_4.value) {
      return "4";
    } else if (value == FontType.FONT_5.value) {
      return "5";
    } else if (value == FontType.FONT_6.value) {
      return "6";
    } else if (value == FontType.FONT_7.value) {
      return "7";
    } else if (value == FontType.FONT_8.value) {
      return "8";
    } else if (value == FontType.SIMPLIFIED_CHINESE.value) {
      return "TSS24.BF2";
    } else if (value == FontType.TRADITIONAL_CHINESE.value) {
      return "TST24.BF2";
    } else if (value == FontType.KOREAN.value) {
      return "K";
    } else {
      return "Unknown";
    }
  }
}

class Foot {
  const Foot._internal(this.value);
  final int value;
  static const F2 = Foot._internal(0);
  static const F5 = Foot._internal(1);
}

class Mirror {
  const Mirror._internal(this.value);
  final int value;
  static const NORMAL = Mirror._internal(0);
  static const MIRRORA = Mirror._internal(1);
}

class Readabel {
  const Readabel._internal(this.value);
  final int value;
  static const DISABLE = Readabel._internal(0);
  static const EANBEL = Readabel._internal(1);
}

class Rotation {
  const Rotation._internal(this.value);
  final int value;
  static const ROTATION_0 = Rotation._internal(0);
  static const ROTATION_90 = Rotation._internal(90);
  static const ROTATION_180 = Rotation._internal(180);
  static const ROTATION_270 = Rotation._internal(270);
}

class Speed {
  const Speed._internal(this.value);
  final double value;
  static const SPEED1DIV5 = Speed._internal(1.5);
  static const SPEED2 = Speed._internal(2.0);
  static const SPEED3 = Speed._internal(3.0);
  static const SPEED4 = Speed._internal(4.0);
}

class LabelTextRow {
  String text;
  FontType footType;
  TscText textType;
  Rotation rotation;
  int x;
  LabelTextRow(this.text, this.footType, this.textType, this.rotation, this.x);
}

// ------ TSC Commands Enum Class End ------


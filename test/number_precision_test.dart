import 'package:flutter_test/flutter_test.dart';
import 'package:number_precision/number_precision.dart';

void main() {
  test('NP.strip can eliminate rounding errors', () {
    expect(NP.strip(0.09999999999999998), 0.1);
    expect(NP.strip(1.0000000000000001), 1.0);
    expect(NP.strip('0.09999999999999998'), 0.1);
    expect(NP.strip('1.0000000000000001'), 1.0);
  });

  test('NP.digitLength can do digitLength operation', () {
    expect(NP.digitLength(123.4567890123), 10);

    expect(NP.digitLength(1.23e-5), 7);
    expect(NP.digitLength(1.23E-5), 7);
    expect(NP.digitLength(1.233467e-5), 11);
    expect(NP.digitLength(123.45e-5), 7);
    expect(NP.digitLength(1.23e-10), 12);
    expect(NP.digitLength(1.23e1), 1);
    expect(NP.digitLength(1e20), 1);
    expect(NP.digitLength(1.12345e20), 1);
    expect(NP.digitLength(1.123e30), 0);
    expect(NP.digitLength(1.123e-100), 103);
    expect(NP.digitLength('1.23e-5'), 7);
    expect(NP.digitLength('1.23E-5'), 7);
    expect(NP.digitLength('1.233467e-5'), 11);
    expect(NP.digitLength('123.45e-5'), 7);
    expect(NP.digitLength('1.23e-10'), 12);
    expect(NP.digitLength('1.23e1'), 1);
    expect(NP.digitLength('1e20'), 1);
    expect(NP.digitLength('1.12345e20'), 1);
    expect(NP.digitLength('1.123e30'), 0);
    expect(NP.digitLength('1.123e-100'), 103);
  });

  test('NP.float2Fixed can change float to fixed', () {
    expect(NP.float2Fixed(1e-1), 1);
    expect(NP.float2Fixed(1e-6), 1);
    expect(NP.float2Fixed(1e-7), 1);
    expect(NP.float2Fixed(1e-13), 1);
    expect(NP.float2Fixed(1.123e30), 1.123e30);
    expect(NP.float2Fixed(1.2345678912345e10), 12345678912345);
    expect(NP.float2Fixed(0.000000123456), 123456);
    expect(NP.float2Fixed(1.23456e-7), 123456);
    expect(NP.float2Fixed('1e-1'), 1);
    expect(NP.float2Fixed('1e-6'), 1);
    expect(NP.float2Fixed('1e-7'), 1);
    expect(NP.float2Fixed('1e-13'), 1);
    expect(NP.float2Fixed('1.123e30'), 1.123e30);
    // expect(NP.float2Fixed('1.6e-30'), 16);
    expect(NP.float2Fixed('1.234567e-13'), 1234567);
    expect(NP.float2Fixed('1.2345678912345e10'), 12345678912345);
    expect(NP.float2Fixed('0.000000123456'), 123456);
    expect(NP.float2Fixed('1.23456e-7'), 123456);
  });

  test('NP.plus can do plus operation', () {
    expect(NP.plus(0.1, 0.2), 0.3);
    expect(NP.plus(2.3, 2.4), 4.7);
    expect(NP.plus(-1.6, -1), -2.6);
    expect(NP.plus(-2.0, 63), 61);
    expect(NP.plus(-3, 7), 4);
    expect(NP.plus(-221, 38), -183);
    expect(NP.plus(-1, 0), -1);
    expect(NP.plus(2.018, 0.001), 2.019);
    expect(NP.plus(1.3224e10, 1.3224e3), 13224001322.4);
    // expect(NP.plus(1.6e-30, 1.6e-30), 3.2e-30);
    expect(NP.plus('0.1', '0.2'), 0.3);
    expect(NP.plus('2.3', '2.4'), 4.7);
    expect(NP.plus('-1.6', '-1'), -2.6);
    expect(NP.plus('-2.0', '63'), 61);
    expect(NP.plus('-3', '7'), 4);
    expect(NP.plus('-221', '38'), -183);
    expect(NP.plus('-1', '0'), -1);
    expect(NP.plus('2.018', '0.001'), 2.019);
    expect(NP.plus('1.3224e10', '1.3224e3'), 13224001322.4);
    // expect(NP.plus('1.6e-30', '1.6e-30'), 3.2e-30);

    expect(NP.plus(0.1, 0.2, [0.3]), 0.6);
    expect(NP.plus('0.1', '0.2', ['0.3']), 0.6);
  });

  test('NP.minus can do minus operation', () {
    expect(NP.minus(0.07, 0.01), 0.06);
    expect(NP.minus(0.7, 0.1), 0.6);
    expect(NP.minus(1.0, 0.9), 0.1);
    expect(NP.minus(1, 0), 1);
    expect(NP.minus(1, -0), 1);
    expect(NP.minus(-1, 0), -1);
    expect(NP.minus(-1, -0), -1);
    expect(NP.minus(1, 22), -21);
    // expect(
    //     NP.minus(8893568.397103781249, -7.29674059550), 8893575.693844376749);
    expect(NP.minus(105468873, 0), 105468873);
    expect(NP.minus('0.07', '0.01'), 0.06);
    expect(NP.minus('0.7', '0.1'), 0.6);
    expect(NP.minus('1.0', '0.9'), 0.1);
    expect(NP.minus('1', '0'), 1);
    expect(NP.minus('1', '-0'), 1);
    expect(NP.minus('-1', '0'), -1);
    expect(NP.minus('-1', '-0'), -1);
    expect(NP.minus('1', '22'), -21);
    // expect(NP.minus('8893568.397103781249', '-7.29674059550'),
    //     8893575.693844376749);
    expect(NP.minus('105468873', '0'), 105468873);

    expect(NP.minus(1.23e5, 10), 122990);
    expect(NP.minus(1.23e-5, 1.0023), -1.0022877);
    expect(NP.minus(1.3224e10, 21), 13223999979);
    expect(NP.minus(1.3224e10, 1.3224e3), 13223998677.6);
    // expect(NP.minus(1.7e-30, 0.1e-30), 1.6e-30);
    expect(NP.minus('1.23e5', '10'), 122990);
    expect(NP.minus('1.23e-5', '1.0023'), -1.0022877);
    expect(NP.minus('1.3224e10', '21'), 13223999979);
    expect(NP.minus('1.3224e10', '1.3224e3'), 13223998677.6);
    // expect(NP.minus('1.7e-30', '0.1e-30'), 1.6e-30);

    expect(NP.minus(6, 3, [2]), 1.0);
    expect(NP.minus(6, 3, [2, 1, 2, 3]), -5.0);
    expect(NP.minus('6', '3', ['2']), 1.0);
    expect(NP.minus('6', '3', ['2', '1', '2', '3']), -5.0);
  });

  test('NP.times can do times operation', () {
    expect(NP.times(0.07, 100), 7);
    expect(NP.times(0.7, 0.1), 0.07);
    expect(NP.times(3, 0.3), 0.9);
    expect(NP.times(118762317358.75, 1e-8), 1187.6231735875);
    expect(NP.times(0.362, 100), 36.2);
    expect(NP.times(1.1, 1.1), 1.21);
    expect(NP.times(2.018, 1000), 2018);
    expect(NP.times(5.2, -3.8461538461538462), -20);
    expect(NP.times(1.22, -1.639344262295082), -2);
    expect(NP.times(2.5, -0.92), -2.3);
    expect(NP.times(-2.2, 0.6363636363636364), -1.4);
    expect(NP.times('0.07', '100'), 7);
    expect(NP.times('0.7', '0.1'), 0.07);
    expect(NP.times('3', '0.3'), 0.9);
    expect(NP.times('118762317358.75', '1e-8'), 1187.6231735875);
    expect(NP.times('0.362', '100'), 36.2);
    expect(NP.times('1.1', '1.1'), 1.21);
    expect(NP.times('2.018', '1000'), 2018);
    expect(NP.times('5.2', '-3.8461538461538462'), -20);
    expect(NP.times('1.22', '-1.639344262295082'), -2);
    expect(NP.times('2.5', '-0.92'), -2.3);
    expect(NP.times('-2.2', '0.6363636363636364'), -1.4);
    expect(NP.times(-3, 2.3333333333333335), -7.0);
    expect(NP.times(-0.076, -92.10526315789471), 7.0);
    expect(NP.times(8.0, -0.3625), -2.9);
    expect(NP.times(6.6, 0.30303030303030304), 2);
    expect(NP.times(10.0, -0.8), -8);
    expect(NP.times(-1.1, -7.272727272727273), 8);
    expect(NP.times('8.0', '-0.3625'), -2.9);
    expect(NP.times('6.6', '0.30303030303030304'), 2);
    expect(NP.times('10.0', '-0.8'), -8);
    expect(NP.times('-1.1', '-7.272727272727273'), 8);

    expect(NP.times(-1.23e4, 20), -246000);
    // expect(NP.times(1.7e-30, 1.5e20), 2.55e-10);
    expect(NP.times('-1.23e4', '20'), -246000);
    // expect(NP.times('1.7e-30', '1.5e20'), 2.55e-10);

    expect(NP.times(2, 2, [3]), 12);
    expect(NP.times(2, 2, [3, 0.1]), 1.2);
    expect(NP.times('2', '2', ['3']), 12);
    expect(NP.times('2', '2', ['3', '0.1']), 1.2);

    // expect(NP.times(0.000000123456, 0.000000123456), 1.5241383936e-14);
    // expect(NP.times(1.23456e-7, 1.23456e-7), 1.5241383936e-14);
    // expect(NP.times('0.000000123456', '0.000000123456'), 1.5241383936e-14);
    // expect(NP.times('1.23456e-7', '1.23456e-7'), 1.5241383936e-14);
  });

  test('NP.divide can do divide operation', () {
    expect(NP.divide(1.21, 1.1), 1.1);
    expect(NP.divide(4750.49269435, 4), 1187.6231735875);
    expect(NP.divide(0.9, 3), 0.3);
    expect(NP.divide(36.2, 0.362), 100);
    expect(NP.divide(-20, 5.2), -3.84615384615385);
    expect(NP.divide(-2, 1.22), -1.63934426229508);
    expect(NP.divide(-2.3, 2.5), -0.92);
    expect(NP.divide(-1.4, -2.2), 0.63636363636364);
    expect(NP.divide(7, -3), -2.33333333333333);
    expect(NP.divide(7, -0.076), -92.10526315789473);
    expect(NP.divide(-2.9, 8.0), -0.3625);
    expect(NP.divide(2, 6.6), 0.3030303030303);
    expect(NP.divide(-8, 10.0), -0.8);
    expect(NP.divide(8, -1.1), -7.27272727272727);
    expect(NP.divide('1.21', '1.1'), 1.1);
    expect(NP.divide('4750.49269435', '4'), 1187.6231735875);
    expect(NP.divide('0.9', '3'), 0.3);
    expect(NP.divide('36.2', '0.362'), 100);
    expect(NP.divide('-20', '5.2'), -3.84615384615385);
    expect(NP.divide('-2', '1.22'), -1.63934426229508);
    expect(NP.divide('-2.3', '2.5'), -0.92);
    expect(NP.divide('-1.4', '-2.2'), 0.63636363636364);
    expect(NP.divide('7', '-3'), -2.33333333333333);
    expect(NP.divide('7', '-0.076'), -92.10526315789473);
    expect(NP.divide('-2.9', '8.0'), -0.3625);
    expect(NP.divide('2', '6.6'), 0.3030303030303);
    expect(NP.divide('-8', '10.0'), -0.8);
    expect(NP.divide('8', '-1.1'), -7.27272727272727);

    expect(NP.divide(-1.23e4, 20), -615);
    // expect(NP.divide(2.55e-10, 1.7e-30), 1.5e20);
    expect(NP.divide('-1.23e4', '20'), -615);
    // expect(NP.divide('2.55e-10', '1.7e-30'), 1.5e20);

    expect(NP.divide(12, 3, [2]), 2);
    expect(NP.divide(33.3333, 100), 0.333333);
    expect(NP.divide(83.42894732749, 100), 0.8342894732749);
    expect(NP.divide(1, 3), 0.33333333333333);
    expect(NP.divide('12', '3', ['2']), 2);
    expect(NP.divide('33.3333', '100'), 0.333333);
    expect(NP.divide('83.42894732749', '100'), 0.8342894732749);
    expect(NP.divide('1', '3'), 0.33333333333333);
  });

  test('NP.round can do round operation', () {
    expect(NP.round(0, 1), 0);
    expect(NP.round(0, 0), 0);
    expect(NP.round(0.7875, 3), 0.788);
    expect(NP.round(0.105, 2), 0.11);
    expect(NP.round(1, 1), 1);
    expect(NP.round(0.1049999999, 2), 0.1);
    expect(NP.round(0.105, 1), 0.1);
    expect(NP.round(1.335, 2), 1.34);
    expect(NP.round(1.35, 1), 1.4);
    expect(NP.round(12345.105, 2), 12345.11);
    expect(NP.round(0.0005, 2), 0);
    expect(NP.round(0.0005, 3), 0.001);
    expect(NP.round('0', 1), 0);
    expect(NP.round('0', 0), 0);
    expect(NP.round('0.7875', 3), 0.788);
    expect(NP.round('0.105', 2), 0.11);
    expect(NP.round('1', 1), 1);
    expect(NP.round('0.1049999999', 2), 0.1);
    expect(NP.round('0.105', 1), 0.1);
    expect(NP.round('1.335', 2), 1.34);
    expect(NP.round('1.35', 1), 1.4);
    expect(NP.round('12345.105', 2), 12345.11);
    expect(NP.round('0.0005', 2), 0);
    expect(NP.round('0.0005', 3), 0.001);

    expect(NP.round(1.2345e3, 3), 1234.5);
    expect(NP.round(1.2344e3, 3), 1234.4);
    expect(NP.round(1e3, 1), 1000);
    expect(NP.round('1.2345e3', 3), 1234.5);
    expect(NP.round('1.2344e3', 3), 1234.4);
    expect(NP.round('1e3', 1), 1000);
  });
}

// Copyright (c) 2015, Gary Smith. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

part of vector_math;

abstract class Vector {

  List<double> get components;
  
  int get numComponents;

  bool get isZero;

  double get length;

  double get lengthSquared;

}



/// Dot product of [a] and [b].
double dot2(Vector2 a, Vector2 b) {
  double sum = a._v2storage[0] * b._v2storage[0];
  sum += a._v2storage[1] * b._v2storage[1];
  return sum;
}

/// Dot product of [a] and [b].
double dot3(Vector3 a, Vector3 b) {
  double sum = a._v3storage[0] * b._v3storage[0];
  sum += a._v3storage[1] * b._v3storage[1];
  sum += a._v3storage[2] * b._v3storage[2];
  return sum;
}

/// Dot product of [a] and [b].
double dot4(Vector4 a, Vector4 b) {
  double sum = a._v4storage[0] * b._v4storage[0];
  sum += a._v4storage[1] * b._v4storage[1];
  sum += a._v4storage[2] * b._v4storage[2];
  sum += a._v4storage[3] * b._v4storage[3];
  return sum;
}

/// Cross product.
double cross2Length(Vector2 a, Vector2 b) {
  return a._v2storage[0] * b._v2storage[1] - a._v2storage[1] * b._v2storage[0];
}

/// Cross product of [a] and [b].
/// 
/// If [into] is supplied, the result will be written into it.
cross2(Vector2 a, Vector2 b, [Vector3 into]) {
  final ax = a._v2storage[0];
  final ay = a._v2storage[1];
  final bx = b._v2storage[0];
  final by = b._v2storage[1];
  Vector3 out = into != null ? into : new Vector3.zero();
  out._v3storage[0] = 0.0;
  out._v3storage[1] = 0.0;
  out._v3storage[2] = ax * by - ay * bx;
  return out;
}

/// Cross product of [a] and [b].
/// 
/// If [into] is supplied, the result will be written into it.
cross3(Vector3 a, Vector3 b, [Vector3 into]) {
  final ax = a._v3storage[0];
  final ay = a._v3storage[1];
  final az = a._v3storage[2];
  final bx = b._v3storage[0];
  final by = b._v3storage[1];
  final bz = b._v3storage[2];
  Vector3 out = into != null ? into : new Vector3.zero();
  out._v3storage[0] = ay * bz - az * by;
  out._v3storage[1] = az * bx - ax * bz;
  out._v3storage[2] = ax * by - ay * bx;
  return out;
}


/*
 * Copyright (c) 2013, Autumn Perrault, et al. 
 * All rights reserved.
 * This free software is distributed under the FreeBSD license (LICENSE.md).
 *
 */

#ifndef __AUTO_INTEGER_H__
#define __AUTO_INTEGER_H__

void init_integer();
VALUE swar_bits_set(VALUE self);
VALUE modular_power(VALUE self, VALUE exponent, VALUE modulus);

#endif

/* vim: set ts=4 sts=4 sw=4 et cindent: */
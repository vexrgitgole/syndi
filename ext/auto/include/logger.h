/*
 * Auto 4
 * Copyright (c) 2013, Auto Project. All rights reserved.
 * This is free software distributed under the terms of the FreeBSD license (see LICENSE.md).
 *
 */

#ifndef __AUTO_LOGGER_H__
#define __AUTO_LOGGER_H__

#define SYM(str) rb_intern(#str)

// Set format based on target OS.
#ifdef WIN32
#define LOG_FILE_FORMAT "logs\\%Y%m%d.log"
#else
#define LOG_FILE_FORMAT "logs/%Y%m%d.log"
#endif

// This is based on the desired output give or take a few characters.
#define MAX_TIME_STRING_LENGTH 18

// ("YYYY-MM-DD HH:MM:SS +ZZZZ") "YEAR-MONTH-DAY HOUR:MINUTES:SECONDS UTC_OFFSET"
#define LOG_TIME_FORMAT_LENGTH 25

static VALUE logger_init(VALUE self);

static VALUE logger_error(VALUE self, VALUE message);

static VALUE logger_debug(VALUE self, VALUE message);

static VALUE logger_warning(VALUE self, VALUE message);

static VALUE logger_info(VALUE self, VALUE message);

static VALUE logger_log(VALUE self, VALUE type, VALUE message);

static VALUE logger_log_directory_check(VALUE self);

void Init_logger();


#endif 
// __AUTO_LOGGER_H__

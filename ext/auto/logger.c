#include "ruby.h"
#include <errno.h>
#include <sys/stat.h>
#include <string.h>
#include <time.h>
#include "./logger.h"

VALUE mAuto;
VALUE cLogger;
VALUE eLogError;

static VALUE logger_init(VALUE self)
{
    rb_iv_set(self, "@status", SYM(good));
    rb_funcall(self, SYM(log_directory_check), 0);
    return Qnil;
}

static VALUE logger_error(VALUE self, VALUE message)
{
    rb_funcall(self, SYM(log), 2, rb_str_new2("ERROR"), message);
    return Qnil;
}

static VALUE logger_debug(VALUE self, VALUE message)
{
    rb_funcall(self, SYM(log), 2, rb_str_new2("DEBUG"), message);
    return Qnil;
}

static VALUE logger_warning(VALUE self, VALUE message)
{
    rb_funcall(self, SYM(log), 2, rb_str_new2("WARNING"), message);
    return Qnil;
}

static VALUE logger_info(VALUE self, VALUE message)
{
    rb_funcall(self, SYM(log), 2, rb_str_new2("INFO"), message);
    return Qnil;
}

static VALUE logger_log(VALUE self, VALUE type, VALUE message)
{
    // Declaractions and assignments.
    char *log_file_name  = ALLOCA_N(char, MAX_TIME_STRING_LENGTH + 1);
    char *log_time = ALLOCA_N(char, strlen("YYYY-MM-DD HH:MM:SS ZZZ") + 1); // Length of our maximum expected string
    FILE *log_file;
    
    // Larger than the string should ever be.
    char *temp_buffer = (char*)malloc(sizeof(char) * 50);
    size_t output_string_size = snprintf(temp_buffer, 0, "[%s] [%s] %s\n", log_time, RSTRING_PTR(type), RSTRING_PTR(message));
    char *formatted_message = ALLOCA_N(char, (++output_string_size));
    time_t current_time;

    // Free our temp buffer before we go on.
    free(temp_buffer);

    // Ensure we have the directory we need.
    rb_funcall(self, SYM(log_directory_check), 0);

    // Get the current time
    time(&current_time);

    // Create the file name
    strftime(log_file_name, 100, LOG_FILE_FORMAT, localtime(&current_time));

    // Open the log file for appending.
    log_file = fopen(log_file_name, "a+");

    // Make sure we can open the file.
    if(log_file == NULL)
    {
        rb_raise(eLogError, "Could not open logfile %s for reading: %d", log_file_name, errno);
        return Qnil;
    }

    // Create the time to log
    strftime(log_time, 100, "%Y-%M-%d %X %z", localtime(&current_time));


    // Create the string to log
    sprintf(formatted_message, "[%s] [%s] %s\n", log_time, RSTRING_PTR(type), RSTRING_PTR(message));

    // Write sting to log and close.
    fputs(formatted_message, log_file);
    fclose(log_file);

    return Qnil;
}

static VALUE logger_log_directory_check(VALUE self)
{
    int result = mkdir("logs", S_IRWXU);

    // Only raise an error if we fail to create the directory.
    if(result == -1 && errno != EEXIST)
    {
        int error_number = errno;
        rb_iv_set(self, "@status", SYM(bad));
        rb_raise(eLogError, "Could not create logs/: %s", strerror(error_number));
    }

    return Qnil;
}


void Init_logger()
{
    mAuto = rb_define_module("Auto");
    cLogger = rb_define_class_under(mAuto, "Logger", rb_cObject);
    eLogError = rb_define_class_under(mAuto, "LogError", rb_eException);
    rb_define_method(cLogger, "initialize", &logger_init, 0);
    rb_define_method(cLogger, "error", &logger_error, 1);
    rb_define_method(cLogger, "debug", &logger_debug, 1);
    rb_define_method(cLogger, "warning", &logger_warning, 1);
    rb_define_method(cLogger, "info", &logger_info, 1);
    rb_define_private_method(cLogger, "log_directory_check", &logger_log_directory_check, 0);
    rb_define_private_method(cLogger, "log", &logger_log, 2);
}
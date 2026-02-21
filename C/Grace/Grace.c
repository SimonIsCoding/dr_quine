// this is a comment
extern int open(const char *path, int oflag, ...);
extern int write(int fildes, const void *buf, int nbyte);
extern int dprintf(int fd, const char *format, ...);
#define SOURCE_CODE "// this is a comment%cextern int open(const char *path, int oflag, ...);%cextern int write(int fildes, const void *buf, int nbyte);%c#define RUN int main(void) { dprintf(open(%cGrace_kid.c%c, 512 | 1, 0644), %c%s%c, 34, %s, 34 ); };%cRUN"
#define RUN int main(void) { dprintf(open("Grace_kid.c", 512 | 1, 0644), "// this is a comment%cextern int open(const char *path, int oflag, ...);%cextern int write(int fildes, const void *buf, int nbyte);%cextern int dprintf(int fd, const char *format, ...);%c#define SOURCE_CODE %c// this is a comment%cextern int open(const char *path, int oflag, ...);%cextern int write(int fildes, const void *buf, int nbyte);%c#define RUN int main(void) { dprintf(open(%cGrace_kid.c%c, 512 | 1, 0644), %c%s%c, 34, %s, 34 ); };%cRUN%c%c#define RUN int main(void) { dprintf(open(%cGrace_kid.c%c, 512 | 1, 0644), ); };%cRUN", 10, 10, 10, 10, 34, 10, 10, 10, 34, 34, 34, SOURCE_CODE, 34, SOURCE_CODE, 10, 34, 10, 34, 34, 10); };
RUN
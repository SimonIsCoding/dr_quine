//This is a comment
#define FILENAME "Grace_kid.c"
#define CODE "//This is a comment%c#define FILENAME %cGrace_kid.c%c%c#define CODE %c%s%c%c#define RUN int main(void) { extern int open(const char *path, int oflag, ...);extern int write(int fildes, const void *buf, int nbyte);extern int dprintf(int fd, const char *format, ...); dprintf(open(FILENAME, 512 | 1024 | 1, 0644), 10, 34, 34, 10, 34, CODE, 34, 10, 10); };%cRUN"
#define RUN int main(void) { extern int open(const char *path, int oflag, ...);extern int write(int fildes, const void *buf, int nbyte);extern int dprintf(int fd, const char *format, ...); dprintf(open(FILENAME, 512 | 1024 | 1, 0644), 10, 34, 34, 10, 34, CODE, 34, 10, 10); };
RUN
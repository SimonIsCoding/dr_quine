// this is a comment
extern int open(const char *path, int oflag, ...);
extern int write(int fildes, const void *buf, int nbyte);
extern int dprintf(int fd, const char *format, ...);
#define SOURCE_CODE	"// this is a comment%cextern int open(const char *path, int oflag, ...);%cextern int write(int fildes, const void *buf, int nbyte);%c#define RUN int main(void) { dprintf(open(%cGrace_kid.c%c, 512 | 1, 0644), %c%s%c, 34, %s, 34 ); };%cRUN"
#define RUN int main(void) { dprintf(open("Grace_kid.c", 512 | 1, 0644), "%c%s%c", 34, SOURCE_CODE, 34 ); };
RUN
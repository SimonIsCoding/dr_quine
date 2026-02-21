// this is a comment
extern int open(const char *path, int oflag, ...);
extern int write(int fildes, const void *buf, int nbyte);
#define SOURCE_CODE	"";
#define RUN int main(void) { write(open("Grace_kid.c", 512 | 1, 0644), "test", 4); };
RUN

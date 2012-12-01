typedef struct _buffer {
    void *start;
    size_t length;
} buffer;

extern char *dev_name;
extern int fd, width, height;
extern buffer *buffers;
extern unsigned int n_buffers;

void read_frame(void);
void start_capturing(void);
void stop_capturing(void);
void init_mmap(void);
void uninit_mmap(void);
void init_device(void);
void uninit_device(void);
void process_image(const void *p);

/*
 *  V4L2 video capture example
 *
 *  This program can be used and distributed without restrictions.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <getopt.h>		/* getopt_long() */

#include <fcntl.h>		/* low-level i/o */
#include <errno.h>

#include "videocapture.h"

//
// open and close devices
//

void open_device(void)
{
    fprintf(stderr, "Opening device '%s'\n", dev_name);
    fd = open(dev_name, O_RDWR, 0);

    if (fd == -1) {
	fprintf(stderr, "Cannot open '%s': %d, %s\n",
		dev_name, errno, strerror(errno));
	exit(EXIT_FAILURE);
    }
}

void close_device(void)
{
    if (close(fd) == -1) {
	perror("close");
	exit(EXIT_FAILURE);
    }
    fd = -1;
}

//
//
//

void write_ppm()
{
    int i, fd_ppm;
    char tmp[width * height * 3], header[256], fname[] = "test.ppm";

    fprintf(stderr, "Writing to %s\n", fname);

    fd_ppm = open(fname, O_CREAT | O_RDWR, 0644);
    if (fd_ppm == -1) {
	perror("open");
	exit(EXIT_FAILURE);
    }
    sprintf(header, "P6\n%d %d\n255\n", width, height);
    if (write(fd_ppm, header, strlen(header)) < 0) {
	perror("write");
	exit(EXIT_FAILURE);
    }
    for (i = 0; i < width * height; i += 2) {
	unsigned char y, r, g, b;
	signed char u, v;
	y = ((char *) buffers[0].start)[i * 2];
	u = ((char *) buffers[0].start)[i * 2 + 1] - 128;
	v = ((char *) buffers[0].start)[i * 2 + 3] - 128;

	r = y + 1.40200 * v;
	g = y - 0.71414 * v - 0.34414 * u;
	b = y + 1.77200 * u;
	tmp[i * 3 + 0] = b;
	tmp[i * 3 + 1] = g;
	tmp[i * 3 + 2] = r;

	y = ((char *) buffers[0].start)[(i + 1) * 2];

	r = y + 1.40200 * v;
	g = y - 0.71414 * v - 0.34414 * u;
	b = y + 1.77200 * u;
	tmp[(i + 1) * 3 + 0] = b;
	tmp[(i + 1) * 3 + 1] = g;
	tmp[(i + 1) * 3 + 2] = r;
    }
    if (write(fd_ppm, tmp, width * height * 3) < 0) {
	perror("write");
	exit(EXIT_FAILURE);
    }
    if (close(fd_ppm) < 0) {
	perror("write");
	exit(EXIT_FAILURE);
    }
}

///
///
///

void process_image(const void *p)
{
    fputc('.', stderr);
    fflush(stderr);
}

void mainloop(void)
{
    unsigned int count;

    count = 10;

    while (count-- > 0) {
	read_frame();
    }

}

///
///
///

static void usage(FILE * fp, int argc, char **argv)
{
    fprintf(fp,
	    "Usage: %s [options]\n\n"
	    "Options:\n"
	    "-d | --device name   Video device name [/dev/video]\n"
	    "-e | --height name   Video window heigtht [640]\n"
	    "-w | --width name    Video window width [480]\n"
	    "-h | --help          Print this message\n" "", argv[0]);
}

static const char short_options[] = "d:hmru";

static const struct option long_options[] = {
    {"device", required_argument, NULL, 'd'},
    {"width", required_argument, NULL, 'w'},
    {"height", required_argument, NULL, 'e'},
    {"help", no_argument, NULL, 'h'},
    {0, 0, 0, 0}
};

int main(int argc, char **argv)
{
    dev_name = "/dev/video";

    for (;;) {
	int index;
	int c;

	c = getopt_long(argc, argv, short_options, long_options, &index);

	if (c == -1)
	    break;
	switch (c) {
	case 0:		/* getopt_long() flag */
	    break;
	case 'w':
	    width = atoi(optarg);
	    break;
	case 'e':
	    height = atoi(optarg);
	    break;
	case 'd':
	    dev_name = optarg;
	    break;
	case 'h':
	    usage(stdout, argc, argv);
	    exit(EXIT_SUCCESS);
	default:
	    usage(stderr, argc, argv);
	    exit(EXIT_FAILURE);
	}
    }

    open_device();
    init_device();
    start_capturing();
    mainloop();
    write_ppm();
    stop_capturing();
    uninit_device();
    close_device();

    exit(EXIT_SUCCESS);
}

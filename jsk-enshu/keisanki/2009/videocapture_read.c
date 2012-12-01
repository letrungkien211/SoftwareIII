/*
 *  V4L2 video capture example
 *
 *  This program can be used and distributed without restrictions.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include <getopt.h>		/* getopt_long() */

#include <fcntl.h>		/* low-level i/o */
#include <unistd.h>
#include <errno.h>
#include <malloc.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/mman.h>
#include <sys/ioctl.h>

#include <asm/types.h>		/* for videodev2.h */

#include <linux/videodev2.h>

#define CLEAR(x) memset (&(x), 0, sizeof (x))

#include "videocapture.h"

char *dev_name = NULL;
int fd = -1, width = 640, height = 480;
buffer *buffers = NULL;
unsigned int n_buffers = 0;

///
///
///

void read_frame(void)
{
    if (read(fd, buffers[0].start, buffers[0].length) == -1) {
	perror("read");
	exit(EXIT_FAILURE);
    }

    process_image(buffers[0].start);
}

///
///
///

void start_capturing(void)
{
    /* Nothing to do. */
}


void stop_capturing(void)
{
    /* Nothing to do. */
}


///
///
///
void init_read(unsigned int buffer_size)
{
    buffers = calloc(1, sizeof(*buffers));

    if (!buffers) {
	fprintf(stderr, "Out of memory\n");
	exit(EXIT_FAILURE);
    }

    buffers[0].length = buffer_size;
    buffers[0].start = malloc(buffer_size);

    if (!buffers[0].start) {
	fprintf(stderr, "Out of memory\n");
	exit(EXIT_FAILURE);
    }
}

void uninit_read(void)
{
    free(buffers[0].start);
}


///
///
///

void init_device(void)
{
    struct v4l2_capability cap;
    struct v4l2_format fmt;

    if (ioctl(fd, VIDIOC_QUERYCAP, &cap) == -1) {
	if (EINVAL == errno) {
	    fprintf(stderr, "%s is no V4L2 device\n", dev_name);
	}
	perror("VIDIOC_QUERYCAP");
	exit(EXIT_FAILURE);
    }

    fprintf(stderr, "video capabilities\n");
    fprintf(stderr, "cap.driver        =  %s\n", cap.driver);
    fprintf(stderr, "cap.card          =  %s\n", cap.card);
    fprintf(stderr, "cap.buf_info      =  %s\n", cap.bus_info);
    fprintf(stderr, "cap.version       =  %d\n", cap.version);
    fprintf(stderr, "cap.capabilities  =  0x%08x ", cap.capabilities);
    if (cap.capabilities & V4L2_CAP_VIDEO_CAPTURE)
	fprintf(stderr, " VIDEO_CAPTURE");
    if (cap.capabilities & V4L2_CAP_VIDEO_OUTPUT)
	fprintf(stderr, " VIDEO_OUTPUT");
    if (cap.capabilities & V4L2_CAP_VIDEO_OVERLAY)
	fprintf(stderr, " VIDEO_OVERLAY");
    if (cap.capabilities & V4L2_CAP_VBI_CAPTURE)
	fprintf(stderr, " VBI_CAPTURE");
    if (cap.capabilities & V4L2_CAP_VBI_OUTPUT)
	fprintf(stderr, " VBI_OUTPUT");
    if (cap.capabilities & V4L2_CAP_SLICED_VBI_CAPTURE)
	fprintf(stderr, " SLICED_VBI_CAPTURE");
    if (cap.capabilities & V4L2_CAP_SLICED_VBI_OUTPUT)
	fprintf(stderr, " VBI_SLICED_OUTPUT");
    if (cap.capabilities & V4L2_CAP_RDS_CAPTURE)
	fprintf(stderr, " RDS_CAPTURE");
    if (cap.capabilities & V4L2_CAP_VIDEO_OUTPUT_OVERLAY)
	fprintf(stderr, " VIDEO_OUTPUT_OVERLAY");
    if (cap.capabilities & V4L2_CAP_TUNER)
	fprintf(stderr, " TUNER");
    if (cap.capabilities & V4L2_CAP_AUDIO)
	fprintf(stderr, " AUDIO");
    if (cap.capabilities & V4L2_CAP_RADIO)
	fprintf(stderr, " RADIO");
    if (cap.capabilities & V4L2_CAP_READWRITE)
	fprintf(stderr, " READWRITE");
    if (cap.capabilities & V4L2_CAP_ASYNCIO)
	fprintf(stderr, " ASYNCIO");
    if (cap.capabilities & V4L2_CAP_STREAMING)
	fprintf(stderr, " STREAMING");
    fprintf(stderr, "\n");

    if (!(cap.capabilities & V4L2_CAP_VIDEO_CAPTURE)) {
	fprintf(stderr, "%s is no video capture device\n", dev_name);
	exit(EXIT_FAILURE);
    }

    if (!(cap.capabilities & V4L2_CAP_READWRITE)) {
	fprintf(stderr, "%s does not support read i/o\n", dev_name);
	exit(EXIT_FAILURE);
    }


    CLEAR(fmt);

    fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
    fmt.fmt.pix.width = 640;
    fmt.fmt.pix.height = 480;
    fmt.fmt.pix.pixelformat = V4L2_PIX_FMT_YUYV;
    fmt.fmt.pix.field = V4L2_FIELD_INTERLACED;

    if (ioctl(fd, VIDIOC_S_FMT, &fmt) == -1) {
	perror("VIDIOC_S_FMT");
	exit(EXIT_FAILURE);
    }

    init_read(fmt.fmt.pix.sizeimage);
}


void uninit_device(void)
{
    uninit_read();
    free(buffers);
}

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/types.h>
#include <linux/miscdevice.h>
#include <linux/ioport.h>
#include <linux/fcntl.h>
#include <linux/init.h>
#include <linux/poll.h>
#include <linux/spinlock.h>
#include <linux/delay.h>

#include <asm/io.h>
#include <asm/uaccess.h>
#include <asm/system.h>
#include "pc104driver.h"

unsigned char pc104_inb(unsigned int port)
{
  unsigned char byte;
  
  port=port&0x000fffff;
  byte=*(volatile unsigned char *) (PC104_BASE+port);
  byte=*(volatile unsigned char *) (PC104_BASE+port);

  return byte;
}

void pc104_outb(unsigned char byte, unsigned int port)
{
  port=port&0x000fffff;
  unsigned char dummy;
  dummy=*(volatile unsigned char *) (PC104_BASE+port);
  *(volatile unsigned char *) (PC104_BASE+port)=byte;
  *(volatile unsigned char *) (PC104_BASE+port)=byte;
}

u32 pc104_read_adregister(u32 addoff0, u32 addoff1)
{
  u32 val, val2;
  u32  data;

  val = pc104_inb(addoff0);
  val2 = pc104_inb(addoff1);

  data = (val & 0xff) << 2 | (val2 & 0x03);

  return data;
}

u32 pc104_read_encoder(u32 addoff0, u32 addoff1, u32 addoff2)
{
  u32 val, val2, val3;
  u32  data;

  val = pc104_inb(addoff0);
  val2 = pc104_inb(addoff1);
  val3 = pc104_inb(addoff2);

  data = (val & 0xff) << 16 | (val2 & 0xff) << 8 | val3;

  return data;
}

static int pc104_ioctl( struct inode *inode, struct file *file,
                      unsigned int cmd, unsigned long arg )
{
  u32 addr;
  u32 devno, adoffset0, adoffset1, adoffset2;
  u32 data;
  dcmctl dcmct;
  servoctl servoct;
  u32 dcm_ctloffset,dcm_pwmoffset;
  u32 servo_offset;
  
  switch (cmd) {
  case PC104_READ:	/* Read the value */
    if (copy_from_user(&addr, arg, sizeof addr))
      return -EFAULT;
    data = pc104_inb(addr);
    if (copy_to_user((void *)arg, &data, sizeof data))
      return -EFAULT;
    break;

  case PC104_READ_AD:	/* Read ad */
    if (copy_from_user(&devno, arg, sizeof devno))
      return -EFAULT;
    
    adoffset0 = PC104_AD_OFFSET + devno * sizeof(short);
    adoffset1 = PC104_AD_OFFSET + devno * sizeof(short) + 1;

    data = pc104_read_adregister(adoffset0,adoffset1);

    if (copy_to_user((void *)arg, &data, sizeof data))
      return -EFAULT;
    break;

  case PC104_READ_PSD:	/* Read psd */
    if (copy_from_user(&devno, arg, sizeof devno))
      return -EFAULT;

    switch(devno){
    case 0:
      adoffset0=PC104_PSD0_OFFSET0;
      adoffset1=PC104_PSD0_OFFSET1;
      break;
    case 1:
      adoffset0=PC104_PSD1_OFFSET0;
      adoffset1=PC104_PSD1_OFFSET1;
      break;
    case 2:
      adoffset0=PC104_PSD2_OFFSET0;
      adoffset1=PC104_PSD2_OFFSET1;
      break;
    }
    
    data = pc104_read_adregister(adoffset0,adoffset1);

    if (copy_to_user((void *)arg, &data, sizeof data))
      return -EFAULT;
    break;

  case PC104_READ_BMP:	/* Read bmp */
    if (copy_from_user(&devno, arg, sizeof devno))
      return -EFAULT;

    switch(devno){
    case 0:
      adoffset0=PC104_BMP0_OFFSET0;
      adoffset1=PC104_BMP0_OFFSET1;
      break;
    case 1:
      adoffset0=PC104_BMP1_OFFSET0;
      adoffset1=PC104_BMP1_OFFSET1;
      break;
    case 2:
      adoffset0=PC104_BMP2_OFFSET0;
      adoffset1=PC104_BMP2_OFFSET1;
      break;
    case 3:
      adoffset0=PC104_BMP3_OFFSET0;
      adoffset1=PC104_BMP3_OFFSET1;
      break;
    case 4:
      adoffset0=PC104_BMP4_OFFSET0;
      adoffset1=PC104_BMP4_OFFSET1;
      break;
    case 5:
      adoffset0=PC104_BMP5_OFFSET0;
      adoffset1=PC104_BMP5_OFFSET1;
      break;
    }
    
    data = pc104_read_adregister(adoffset0,adoffset1);

    if (copy_to_user((void *)arg, &data, sizeof data))
      return -EFAULT;
    break;

  case PC104_READ_MOTORCURRENT:	/* Read dc motor electric current */
    if (copy_from_user(&devno, arg, sizeof devno))
      return -EFAULT;

    switch(devno){
    case 0:
      adoffset0=PC104_MOTORCURRENT0_OFFSET0;
      adoffset1=PC104_MOTORCURRENT0_OFFSET1;
      break;
    case 1:
      adoffset0=PC104_MOTORCURRENT1_OFFSET0;
      adoffset1=PC104_MOTORCURRENT1_OFFSET1;
      break;
    case 2:
      adoffset0=PC104_MOTORCURRENT2_OFFSET0;
      adoffset1=PC104_MOTORCURRENT2_OFFSET1;
      break;
    }
    
    data = pc104_read_adregister(adoffset0,adoffset1);

    if (copy_to_user((void *)arg, &data, sizeof data))
      return -EFAULT;
    break;

  case PC104_READ_ENC:
    if (copy_from_user(&devno, arg, sizeof devno))
      return -EFAULT;

    switch(devno){
    case 0:
      adoffset0=PC104_ENC0_OFFSET0;
      adoffset1=PC104_ENC0_OFFSET1;
      adoffset2=PC104_ENC0_OFFSET2;
      break;
    case 1:
      adoffset0=PC104_ENC1_OFFSET0;
      adoffset1=PC104_ENC1_OFFSET1;
      adoffset2=PC104_ENC1_OFFSET2;
      break;
    case 2:
      adoffset0=PC104_ENC2_OFFSET0;
      adoffset1=PC104_ENC2_OFFSET1;
      adoffset2=PC104_ENC2_OFFSET2;
      break;
    }
    
    data = pc104_read_encoder(adoffset0,adoffset1,adoffset2);

    if (copy_to_user((void *)arg, &data, sizeof data))
      return -EFAULT;
    break;
    
  case PC104_READ_DIPSWITCH:
    data = pc104_inb(PC104_DIPSWITCH_OFFSET) & 0x0f;
    
    if (copy_to_user((void *)arg, &data, sizeof data))
      return -EFAULT;
    break;

  case PC104_WRITE_LED:
    if (copy_from_user(&data, arg, sizeof data))
      return -EFAULT;
    
    data = data & 0x01;
    pc104_outb(data, PC104_LED_OFFSET);
    break;

  case PC104_WRITE_DCMOTOR:
    if (copy_from_user(&dcmct, arg, sizeof dcmct))
      return -EFAULT;
    switch(dcmct.devno){
    case 0:
      dcm_ctloffset = PC104_DCMOTOR0CTL_OFFSET;
      dcm_pwmoffset = PC104_DCMOTOR0PWM_OFFSET;
      break;
    case 1:
      dcm_ctloffset = PC104_DCMOTOR1CTL_OFFSET;
      dcm_pwmoffset = PC104_DCMOTOR1PWM_OFFSET;
      break;
    case 2:
      dcm_ctloffset = PC104_DCMOTOR2CTL_OFFSET;
      dcm_pwmoffset = PC104_DCMOTOR2PWM_OFFSET;
      break;
    }

    data = ((dcmct.brk & 0x01) << 1)  | (dcmct.cwccw & 0x01);
    pc104_outb(data, dcm_ctloffset);

    data = (dcmct.pwm & 0xff);
    pc104_outb(data, dcm_pwmoffset);
    break;

  case PC104_WRITE_SERVO:
    if (copy_from_user(&servoct, arg, sizeof servoct))
      return -EFAULT;
    
    servo_offset = servoct.devno + PC104_SERVO_OFFSET;
    data = (servoct.pwm & 0xff);
    pc104_outb(data, servo_offset);    
    break;

  default:
    return -EINVAL;
    break;
  }

  return 0;
}

static int pc104_open( struct inode *inode, struct file *file )
{
  return 0;
}

static int pc104_release( struct inode *inode, struct file *file )
{
  return 0;
}

static struct file_operations pc104_fops = {
  owner:	THIS_MODULE,
  ioctl:	pc104_ioctl,
  open:		pc104_open,
  release:	pc104_release,
};

static int __init pc104_init( void )
{
  printk( KERN_INFO "PC104 driver v" PC104_VERSION "\n" );
  if( check_region( PC104_BASE, PC104_EXTENT ) ){
    printk( KERN_ERR "pc104driver: I/O port 0x%x is not free.\n", PC104_BASE );
    return( -EIO );
  }
  request_region( PC104_BASE, PC104_EXTENT, "pc104" );
  register_chrdev(PC104_MAJOR,"pc104",&pc104_fops);

  return 0;
}

static void __exit pc104_exit( void )
{
  unregister_chrdev(PC104_MAJOR,"pc104");
  release_region( PC104_BASE, PC104_EXTENT );
}

module_init( pc104_init );
module_exit( pc104_exit );
MODULE_LICENSE( "GPL" );

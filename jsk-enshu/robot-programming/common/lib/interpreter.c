#include "interpreter.h"

//���Ԥ�����ޤǤ�ʸ����ǡ������ɹ��ߡ�form�˳�Ǽ
//�ޤ��ɤ߹�����Ľ�ޤǤη��(pointer)���֤�
char *read_form(char *str, char *form)
{
    char *ptr = str;
    int length=0;
    
    while (*ptr != '\n' && *ptr != '\0') {
      //fprintf(stderr, "%c ", *ptr);
	length++;
	ptr++;
    }
    //fprintf(stderr, "\n", *ptr);
    if (*ptr == '\0'){
	ptr = str;
	length =0;
    }else{
	ptr++;
	memcpy(form, str, length);
    }
    form[length] = '\0';
    return ptr;
}

//Ϳ����줿1�Ԥ��椫��ʸ����ʶ���Ƕ��ڤ�줿�ΰ�)���ڤ�Ф��Ƴ�Ǽ����
//�����åפ�����̡�pointer)���֤�
char *read_token(char *str, char *format, void *data)
{
    sscanf(str, format, data);
    str = skip_string(1, str);
    return str;
}

//���򤢤뤤�ϲ���ʸ���������true(1)���֤�
int whitespace(char c)
{
  return (c == ' ' || c == '\n');
}

//Ϳ����줿1�Ԥ��椫��ʸ���ʶ���Ƕ��ڤ�줿�ΰ�)�򥹥��åפ��ơ�
//�����åפ�����̡�pointer)���֤�
char *skip_string(int num, char *string)
{
    int i, j;

    for (i=0; string[i] == ' '; i++);

    for (j=0; j<num; j++) {
	while (string[i]!=' '){
	    i++;
	    if (string[i] == '\n' || string[i] == '\0') return &(string[i]);
	}
	while (string[i]==' ')	i++;
    }
    
    return &(string[i]);
}


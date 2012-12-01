#include "interpreter.h"

//改行がくるまでの文字列データを読込み、formに格納
//また読み込んだ個所までの結果(pointer)を返す
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

//与えられた1行の中から文字列（空白で区切られた領域)を切り出して格納する
//スキップした結果（pointer)を返す
char *read_token(char *str, char *format, void *data)
{
    sscanf(str, format, data);
    str = skip_string(1, str);
    return str;
}

//空白あるいは改行文字がくればtrue(1)を返す
int whitespace(char c)
{
  return (c == ' ' || c == '\n');
}

//与えられた1行の中から文字（空白で区切られた領域)をスキップして、
//スキップした結果（pointer)を返す
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


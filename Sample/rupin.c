/* egg rupin.c -o rupin -Wall */
#include <string.h>
#include <unistd.h>
#include <eggx.h>

int main()
{
    char *rupin = "��ѥ��Ũ�ϥ�ѥ�" ;
    char one[4] ={'\0','\0','\0','\0'} ;
    int win,i,len,fsize,ff ;

    len=strlen(rupin) ;
    /* 800��600�Υ�����ɥ��򳫤� */
    win = gopen(800,600) ;
    /* �쥤������� */
    layer(win,0,1) ;
    i=gsetfontset(win,"-kochi-kochi gothic-medium-r-normal--560-*-*-*-*-*-*-*") ;
    if( i ){
	gsetfontset(win,"-kochi-gothic-medium-r-normal--560-*-*-*-*-*-*-*") ;
	ff=0 ;
    }
    else ff=1 ;
    for( i=0 ; i < len/2 ; i++ ){
	strncpy(one,rupin+i*2,2) ;
	/* ������ɥ����õ� */
	gclr(win) ;
	/* ʸ�������� */
	drawstr(win,100+20,600/2-560/2+560/6,FONTSET,0,one) ;
	/* �쥤��Υ��ԡ� */
	copylayer(win,1,0) ;
	msleep(220) ;
    }
    for( i=0 ; i<8 ; i++ ){
	gclr(win) ;
	fsize=1000-i*134 ;
	if( ff )
	    gsetfontset(win,"-kochi-kochi gothic-medium-r-normal--%d-*-*-*-*-*-*-*",
			fsize) ;
	else
	    gsetfontset(win,"-kochi-gothic-medium-r-normal--%d-*-*-*-*-*-*-*",
			fsize) ;
	drawstr(win,800/2-(len/2)*fsize/2,600/2-fsize/2+fsize/6,FONTSET,0,rupin) ;
	copylayer(win,1,0) ;
	msleep(20) ;
    }
    sleep(2) ;
    /* ����Ĥ��� */
    gclose(win) ;
    return(0) ;
}

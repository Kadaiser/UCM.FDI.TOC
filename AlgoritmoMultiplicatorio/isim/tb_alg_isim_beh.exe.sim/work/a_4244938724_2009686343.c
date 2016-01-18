/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/Kadaiser/Documents/GitHub/TOC/AlgoritmoMultiplicatorio/Contador.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_1919437128_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_4244938724_2009686343_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(43, ng0);

LAB3:    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t1 = (t0 + 2356);
    t3 = (t1 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 5U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 2304);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4244938724_2009686343_p_1(char *t0)
{
    char t13[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
    char *t11;
    unsigned char t12;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 684U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 568U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 2312);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(48, ng0);
    t1 = (t0 + 1052U);
    t5 = *((char **)t1);
    t1 = (t0 + 2392);
    t6 = (t1 + 32U);
    t7 = *((char **)t6);
    t8 = (t7 + 40U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 5U);
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 776U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t10 = (t4 == (unsigned char)3);
    if (t10 != 0)
        goto LAB7;

LAB9:    t1 = (t0 + 868U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB10;

LAB11:
LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1052U);
    t6 = *((char **)t2);
    t2 = (t0 + 2392);
    t7 = (t2 + 32U);
    t8 = *((char **)t7);
    t9 = (t8 + 40U);
    t11 = *((char **)t9);
    memcpy(t11, t6, 5U);
    xsi_driver_first_trans_fast(t2);
    goto LAB8;

LAB10:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 960U);
    t5 = *((char **)t1);
    t10 = *((unsigned char *)t5);
    t12 = (t10 == (unsigned char)3);
    if (t12 != 0)
        goto LAB12;

LAB14:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1236U);
    t2 = *((char **)t1);
    t1 = (t0 + 4248U);
    t5 = ieee_p_1242562249_sub_1919437128_1035706684(IEEE_P_1242562249, t13, t2, t1, 1);
    t6 = (t13 + 12U);
    t14 = *((unsigned int *)t6);
    t15 = (1U * t14);
    t3 = (5U != t15);
    if (t3 == 1)
        goto LAB17;

LAB18:    t7 = (t0 + 2392);
    t8 = (t7 + 32U);
    t9 = *((char **)t8);
    t11 = (t9 + 40U);
    t17 = *((char **)t11);
    memcpy(t17, t5, 5U);
    xsi_driver_first_trans_fast(t7);

LAB13:    goto LAB8;

LAB12:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1236U);
    t6 = *((char **)t1);
    t1 = (t0 + 4248U);
    t7 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t13, t6, t1, 1);
    t8 = (t13 + 12U);
    t14 = *((unsigned int *)t8);
    t15 = (1U * t14);
    t16 = (5U != t15);
    if (t16 == 1)
        goto LAB15;

LAB16:    t9 = (t0 + 2392);
    t11 = (t9 + 32U);
    t17 = *((char **)t11);
    t18 = (t17 + 40U);
    t19 = *((char **)t18);
    memcpy(t19, t7, 5U);
    xsi_driver_first_trans_fast(t9);
    goto LAB13;

LAB15:    xsi_size_not_matching(5U, t15, 0);
    goto LAB16;

LAB17:    xsi_size_not_matching(5U, t15, 0);
    goto LAB18;

}


extern void work_a_4244938724_2009686343_init()
{
	static char *pe[] = {(void *)work_a_4244938724_2009686343_p_0,(void *)work_a_4244938724_2009686343_p_1};
	xsi_register_didat("work_a_4244938724_2009686343", "isim/tb_alg_isim_beh.exe.sim/work/a_4244938724_2009686343.didat");
	xsi_register_executes(pe);
}

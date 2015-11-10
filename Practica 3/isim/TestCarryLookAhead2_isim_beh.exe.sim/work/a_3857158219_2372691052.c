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

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/adder/adder/adder/TestCarryLookAhead2.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_180853171_1035706684(char *, char *, int , int );


static void work_a_3857158219_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 3744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(79, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2920);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 3744);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2920);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_3857158219_2372691052_p_1(char *t0)
{
    char t15[16];
    char *t1;
    char *t2;
    int64 t3;
    int t4;
    int t5;
    char *t6;
    int t7;
    int t8;
    int t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    int t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    t1 = (t0 + 3360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(89, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(90, ng0);
    t4 = xsi_vhdl_pow(2, 3);
    t5 = (t4 - 1);
    t2 = (t0 + 6052);
    *((int *)t2) = 0;
    t6 = (t0 + 6056);
    *((int *)t6) = t5;
    t7 = 0;
    t8 = t5;

LAB8:    if (t7 <= t8)
        goto LAB9;

LAB11:    xsi_set_current_line(99, ng0);

LAB28:    *((char **)t1) = &&LAB29;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB9:    xsi_set_current_line(91, ng0);
    t9 = xsi_vhdl_pow(2, 3);
    t10 = (t9 - 1);
    t11 = (t0 + 6060);
    *((int *)t11) = 0;
    t12 = (t0 + 6064);
    *((int *)t12) = t10;
    t13 = 0;
    t14 = t10;

LAB12:    if (t13 <= t14)
        goto LAB13;

LAB15:    xsi_set_current_line(97, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t3);

LAB23:    *((char **)t1) = &&LAB24;
    goto LAB1;

LAB10:    t2 = (t0 + 6052);
    t7 = *((int *)t2);
    t6 = (t0 + 6056);
    t8 = *((int *)t6);
    if (t7 == t8)
        goto LAB11;

LAB25:    t4 = (t7 + 1);
    t7 = t4;
    t11 = (t0 + 6052);
    *((int *)t11) = t7;
    goto LAB8;

LAB13:    xsi_set_current_line(92, ng0);
    t16 = (t0 + 6052);
    t17 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t15, *((int *)t16), 4);
    t18 = (t0 + 3808);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t17, 16U);
    xsi_driver_first_trans_fast(t18);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 6060);
    t6 = ieee_p_1242562249_sub_180853171_1035706684(IEEE_P_1242562249, t15, *((int *)t2), 4);
    t11 = (t0 + 3872);
    t12 = (t11 + 56U);
    t16 = *((char **)t12);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t6, 16U);
    xsi_driver_first_trans_fast(t11);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 3936);
    t6 = (t2 + 56U);
    t11 = *((char **)t6);
    t12 = (t11 + 56U);
    t16 = *((char **)t12);
    *((unsigned char *)t16) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(95, ng0);
    t3 = (10 * 1000LL);
    t2 = (t0 + 3168);
    xsi_process_wait(t2, t3);

LAB18:    *((char **)t1) = &&LAB19;
    goto LAB1;

LAB14:    t2 = (t0 + 6060);
    t13 = *((int *)t2);
    t6 = (t0 + 6064);
    t14 = *((int *)t6);
    if (t13 == t14)
        goto LAB15;

LAB20:    t4 = (t13 + 1);
    t13 = t4;
    t11 = (t0 + 6060);
    *((int *)t11) = t13;
    goto LAB12;

LAB16:    goto LAB14;

LAB17:    goto LAB16;

LAB19:    goto LAB17;

LAB21:    goto LAB10;

LAB22:    goto LAB21;

LAB24:    goto LAB22;

LAB26:    goto LAB2;

LAB27:    goto LAB26;

LAB29:    goto LAB27;

}


extern void work_a_3857158219_2372691052_init()
{
	static char *pe[] = {(void *)work_a_3857158219_2372691052_p_0,(void *)work_a_3857158219_2372691052_p_1};
	xsi_register_didat("work_a_3857158219_2372691052", "isim/TestCarryLookAhead2_isim_beh.exe.sim/work/a_3857158219_2372691052.didat");
	xsi_register_executes(pe);
}

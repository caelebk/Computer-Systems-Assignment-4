.pos 0x1000
code:            ld   $v0, r0             # r0 = & v0;
                 ld   $s, r1              # r1 = & s;
                 ld   $i, r2              # r2 = & i;
                 ld   0x0(r2), r2         # r2 = i;
                 ld   (r1, r2, 4), r3     # r3 = s.x[i]
                 st   r3, 0x0(r0)         # v0 = s.x[i]
                 ld   $v1, r0             # r0 = & v1
                 ld   0x8(r1), r3         # r3 = * y
                 shl  $2, r2              # r2 = 4 * i
                 add  r2, r3              # r3 =  & s.y[i]
                 ld   0x0(r3), r3         # r3 = s.y[i]
                 st   r3, 0x0(r0)         # v1 = s.y[i]
                 ld   $v2, r0             # r0 = & v2
                 ld   0xc(r1), r3         # r3 = * s.z = & s_z
                 mov  r2, r4              # r4 = i
                 add  r3, r4              # r4 = i + & s_z = &s.z->x[i]
                 ld   0x0(r4), r4         # r4 = s.z->x[i]
                 st   r4, 0x0(r0)         # v2 = s.z->x[i]
                 ld   $v3, r0             # r0 = & v3
                 ld   0xc(r3), r4         # r4 = *s.z->z = &s_z_z
                 ld   0x8(r4), r4         # r4 = *s.z->z->y = &s_z_z_y
                 add  r2, r4              # r4 = &s_z_z_y + i = &s.z->z->y[i]
                 ld   0x0(r4), r4         # r4 = s.z->z->y[i]
                 st   r4, 0x0(r0)         # v3 = s.z->z->y[i]
.pos 0x2000
i:               .long 0x1                
v0:              .long 0x0                
v1:              .long 0x3                
v2:              .long 0x4                
v3:              .long 0x5                
s:               .long 0x1                # x[0]
                 .long 0x2                # x[1]
                 .long 0x3000             # s_y
                 .long 0x3008             # s_z
.pos 0x3000
s_y:             .long 0x2                # y[0]
                 .long 0x3                # y[1]
s_z:             .long 0x3                # s_z_x[0]
                 .long 0x4                # s_z_x[1]
                 .long 0x3018             # s_z_y = &s_z_y[0]
                 .long 0x3020             # s_z_z = & s_z_z
s_z_y:           .long 0x0                # y2[0]
                 .long 0x0                # y2[1]
s_z_z:           .long 0x0                # s_z_z_x[0]
                 .long 0x0                # s_z_z.x[1]
                 .long 0x3030             # szz.y = &y3[0]
                 .long 0x0                # szz.z = & szz
s_z_z_y:         .long 0x4                # y3[0]
                 .long 0x5                # y3[1]

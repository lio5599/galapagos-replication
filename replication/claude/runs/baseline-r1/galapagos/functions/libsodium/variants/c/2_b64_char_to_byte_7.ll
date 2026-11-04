; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %x = alloca i32, align 4
  %z = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 63, %1
  %add = add i32 %sub, 1
  %shr = lshr i32 %add, 8
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 %2, 90
  %sub2 = sub i32 %sub1, 1
  %shr3 = lshr i32 %sub2, 8
  %and = and i32 %shr, %shr3
  %and4 = and i32 %and, 255
  %3 = load i32, ptr %u, align 4
  %sub5 = sub i32 %3, 65
  %and6 = and i32 %and4, %sub5
  %4 = load i32, ptr %u, align 4
  %sub7 = sub i32 95, %4
  %add8 = add i32 %sub7, 1
  %shr9 = lshr i32 %add8, 8
  %5 = load i32, ptr %u, align 4
  %sub10 = sub i32 %5, 122
  %sub11 = sub i32 %sub10, 1
  %shr12 = lshr i32 %sub11, 8
  %and13 = and i32 %shr9, %shr12
  %and14 = and i32 %and13, 255
  %6 = load i32, ptr %u, align 4
  %sub15 = sub i32 %6, 71
  %and16 = and i32 %and14, %sub15
  %or = or i32 %and6, %and16
  %7 = load i32, ptr %u, align 4
  %sub17 = sub i32 46, %7
  %add18 = add i32 %sub17, 1
  %shr19 = lshr i32 %add18, 8
  %8 = load i32, ptr %u, align 4
  %sub20 = sub i32 %8, 57
  %sub21 = sub i32 %sub20, 1
  %shr22 = lshr i32 %sub21, 8
  %and23 = and i32 %shr19, %shr22
  %and24 = and i32 %and23, 255
  %9 = load i32, ptr %u, align 4
  %add25 = add i32 %9, 4
  %and26 = and i32 %and24, %add25
  %or27 = or i32 %or, %and26
  %10 = load i32, ptr %u, align 4
  %xor = xor i32 %10, 43
  %add28 = add i32 %xor, -1
  %shr29 = lshr i32 %add28, 8
  %and30 = and i32 %shr29, 255
  %and31 = and i32 %and30, 62
  %or32 = or i32 %or27, %and31
  %11 = load i32, ptr %u, align 4
  %xor33 = xor i32 %11, 47
  %add34 = add i32 %xor33, -1
  %shr35 = lshr i32 %add34, 8
  %and36 = and i32 %shr35, 255
  %and37 = and i32 %and36, 63
  %or38 = or i32 %or32, %and37
  store i32 %or38, ptr %x, align 4
  %12 = load i32, ptr %x, align 4
  %add39 = add i32 %12, -1
  %shr40 = lshr i32 %add39, 8
  %and41 = and i32 %shr40, 255
  store i32 %and41, ptr %z, align 4
  %13 = load i32, ptr %u, align 4
  %xor42 = xor i32 %13, 65
  %not = xor i32 %xor42, -1
  %add43 = add i32 %not, 1
  %shr44 = lshr i32 %add43, 8
  %and45 = and i32 %shr44, 255
  store i32 %and45, ptr %n, align 4
  %14 = load i32, ptr %x, align 4
  %15 = load i32, ptr %z, align 4
  %16 = load i32, ptr %n, align 4
  %and46 = and i32 %15, %16
  %or47 = or i32 %14, %and46
  ret i32 %or47
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}

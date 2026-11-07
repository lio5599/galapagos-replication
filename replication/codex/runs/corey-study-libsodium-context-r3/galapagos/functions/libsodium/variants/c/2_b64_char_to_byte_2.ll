; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/2_b64_char_to_byte_2.c"
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
  %upper = alloca i32, align 4
  %lower = alloca i32, align 4
  %digit = alloca i32, align 4
  %plus = alloca i32, align 4
  %slash = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %shr2 = lshr i32 %sub1, 8
  %or = or i32 %shr, %shr2
  %and = and i32 %or, 255
  %sub3 = sub i32 255, %and
  store i32 %sub3, ptr %upper, align 4
  %3 = load i32, ptr %u, align 4
  %sub4 = sub i32 %3, 97
  %shr5 = lshr i32 %sub4, 8
  %4 = load i32, ptr %u, align 4
  %sub6 = sub i32 122, %4
  %shr7 = lshr i32 %sub6, 8
  %or8 = or i32 %shr5, %shr7
  %and9 = and i32 %or8, 255
  %sub10 = sub i32 255, %and9
  store i32 %sub10, ptr %lower, align 4
  %5 = load i32, ptr %u, align 4
  %sub11 = sub i32 %5, 48
  %shr12 = lshr i32 %sub11, 8
  %6 = load i32, ptr %u, align 4
  %sub13 = sub i32 57, %6
  %shr14 = lshr i32 %sub13, 8
  %or15 = or i32 %shr12, %shr14
  %and16 = and i32 %or15, 255
  %sub17 = sub i32 255, %and16
  store i32 %sub17, ptr %digit, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub18 = sub i32 0, %xor
  %shr19 = lshr i32 %sub18, 8
  %and20 = and i32 %shr19, 255
  %sub21 = sub i32 255, %and20
  store i32 %sub21, ptr %plus, align 4
  %8 = load i32, ptr %u, align 4
  %xor22 = xor i32 %8, 47
  %sub23 = sub i32 0, %xor22
  %shr24 = lshr i32 %sub23, 8
  %and25 = and i32 %shr24, 255
  %sub26 = sub i32 255, %and25
  store i32 %sub26, ptr %slash, align 4
  %9 = load i32, ptr %upper, align 4
  %10 = load i32, ptr %u, align 4
  %sub27 = sub i32 %10, 65
  %and28 = and i32 %9, %sub27
  %11 = load i32, ptr %lower, align 4
  %12 = load i32, ptr %u, align 4
  %sub29 = sub i32 %12, 71
  %and30 = and i32 %11, %sub29
  %or31 = or i32 %and28, %and30
  %13 = load i32, ptr %digit, align 4
  %14 = load i32, ptr %u, align 4
  %sub32 = sub i32 %14, -4
  %and33 = and i32 %13, %sub32
  %or34 = or i32 %or31, %and33
  %15 = load i32, ptr %plus, align 4
  %and35 = and i32 %15, 62
  %or36 = or i32 %or34, %and35
  %16 = load i32, ptr %slash, align 4
  %and37 = and i32 %16, 63
  %or38 = or i32 %or36, %and37
  store i32 %or38, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %sub39 = sub i32 0, %18
  %shr40 = lshr i32 %sub39, 8
  %and41 = and i32 %shr40, 255
  %sub42 = sub i32 255, %and41
  %19 = load i32, ptr %u, align 4
  %xor43 = xor i32 %19, 65
  %sub44 = sub i32 0, %xor43
  %shr45 = lshr i32 %sub44, 8
  %and46 = and i32 %shr45, 255
  %and47 = and i32 %sub42, %and46
  %or48 = or i32 %17, %and47
  ret i32 %or48
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

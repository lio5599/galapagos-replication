; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r2/functions/libsodium/variants/c/2_b64_char_to_byte_3.c"
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
  %upper_bad = alloca i32, align 4
  %lower_bad = alloca i32, align 4
  %digit_bad = alloca i32, align 4
  %plus_bad = alloca i32, align 4
  %slash_bad = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 8
  store i32 %shr, ptr %upper_bad, align 4
  %3 = load i32, ptr %u, align 4
  %sub2 = sub i32 %3, 97
  %4 = load i32, ptr %u, align 4
  %sub3 = sub i32 122, %4
  %or4 = or i32 %sub2, %sub3
  %shr5 = lshr i32 %or4, 8
  store i32 %shr5, ptr %lower_bad, align 4
  %5 = load i32, ptr %u, align 4
  %sub6 = sub i32 %5, 48
  %6 = load i32, ptr %u, align 4
  %sub7 = sub i32 57, %6
  %or8 = or i32 %sub6, %sub7
  %shr9 = lshr i32 %or8, 8
  store i32 %shr9, ptr %digit_bad, align 4
  %7 = load i32, ptr %u, align 4
  %xor = xor i32 %7, 43
  %sub10 = sub i32 0, %xor
  %shr11 = lshr i32 %sub10, 8
  store i32 %shr11, ptr %plus_bad, align 4
  %8 = load i32, ptr %u, align 4
  %xor12 = xor i32 %8, 47
  %sub13 = sub i32 0, %xor12
  %shr14 = lshr i32 %sub13, 8
  store i32 %shr14, ptr %slash_bad, align 4
  %9 = load i32, ptr %u, align 4
  %sub15 = sub i32 %9, 65
  %10 = load i32, ptr %upper_bad, align 4
  %not = xor i32 %10, -1
  %and = and i32 %sub15, %not
  %11 = load i32, ptr %u, align 4
  %sub16 = sub i32 %11, 71
  %12 = load i32, ptr %lower_bad, align 4
  %not17 = xor i32 %12, -1
  %and18 = and i32 %sub16, %not17
  %or19 = or i32 %and, %and18
  %13 = load i32, ptr %u, align 4
  %sub20 = sub i32 %13, -4
  %14 = load i32, ptr %digit_bad, align 4
  %not21 = xor i32 %14, -1
  %and22 = and i32 %sub20, %not21
  %or23 = or i32 %or19, %and22
  store i32 %or23, ptr %x, align 4
  %15 = load i32, ptr %x, align 4
  %and24 = and i32 %15, 255
  %16 = load i32, ptr %plus_bad, align 4
  %not25 = xor i32 %16, -1
  %and26 = and i32 62, %not25
  %or27 = or i32 %and24, %and26
  %17 = load i32, ptr %slash_bad, align 4
  %not28 = xor i32 %17, -1
  %and29 = and i32 63, %not28
  %or30 = or i32 %or27, %and29
  store i32 %or30, ptr %x, align 4
  %18 = load i32, ptr %x, align 4
  %19 = load i32, ptr %u, align 4
  %xor31 = xor i32 %19, 65
  %sub32 = sub i32 0, %xor31
  %shr33 = lshr i32 %sub32, 8
  %20 = load i32, ptr %x, align 4
  %sub34 = sub i32 0, %20
  %shr35 = lshr i32 %sub34, 8
  %not36 = xor i32 %shr35, -1
  %and37 = and i32 %shr33, %not36
  %and38 = and i32 255, %and37
  %or39 = or i32 %18, %and38
  ret i32 %or39
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
